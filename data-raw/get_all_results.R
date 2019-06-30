## see also https://github.com/tidyverse/dplyr/blob/master/data-raw/starwars.R#L36
# library(httr)
# get_all <- function(url) {
#   out <- NULL
#
#   while (!is.null(url)) {
#     message("Getting ", url)
#     req <- GET(url)
#     stop_for_status(req)
#
#     con <- content(req)
#     out <- c(out, con$results)
#     url <- con$`next`
#   }
#
#   out
# }
#
# lookup <- function(url, name = "name") {
#   all <- get_all(url)
#
#   url <- all %>% map_chr("url")
#   name <- all %>% map_chr(name)
#   name[name == "unknown"] <- NA
#
#   set_names(name, url)
# }

# this function assumes tidyverse loaded
get_all_results = function(fn) {

  # initial results ---------------------------------------------------------

  fn_name = deparse(substitute(fn))
  result_list = list()
  result_list[[1]] = fn(parse_result = T)


  # more results ------------------------------------------------------------

  more = getElement(result_list[[1]], "next")

  if (!is_null(more)) {
    page = as.integer(str_sub(more, start = -1))

    # page should be empty if nothing left
    while(!is_empty(page)) {
      current_result = fn(getElement(result_list[[page - 1]], "next"), parse_result = TRUE)

      result_list[[page]] = current_result

      page = as.integer(str_sub(getElement(current_result, "next"), start = -1))
    }
  }


  # create data frame -------------------------------------------------------

  # get the actual results that are desired
  init = map(result_list, function(x) x$results)

  # to deal with multiple entry columns (flatten won't work because they aren't a list)
  init = map_depth(init, 3, function(x) ifelse(length(x) > 1, paste0(x, collapse = ' '),
                                               ifelse(is.null(x), NA, x)))

  # make a data frame and bind together
  init = map_depth(init, 2, as_tibble)

  result = bind_rows(map(init, bind_rows))


  # more misc cleanup -------------------------------------------------------

  nams = names(result)

  result = result %>%
    mutate_all(function(x) ifelse(x == 'n/a' | x == 'unknown' | x == 'none', NA, x)) %>%
    mutate(index = as.integer(str_extract_all(url, '[0-9]+'))) %>%
    mutate_if(function(x) any(grepl(unlist(x), pattern = '^http')), # make urls indices
              function(x) sapply(str_extract_all(x, '[0-9]+'), as.integer)) %>%
    arrange(index)

  # specific fixes

  # films
  if (fn_name == 'get_all_films') {
    result = result %>%
      mutate(
        release_date = lubridate::ymd(release_date)
      )
  }

  # people
  if (fn_name == 'get_all_people') {
    result = result %>%
      mutate(
        birth_year = str_extract_all(birth_year, '[0-9]+'),
        mass = as.numeric(mass),
        height = as.numeric(height)
      )
  }

  # planets
  if (fn_name == 'get_all_planets') {
    result = result %>%
      mutate_at(vars(rotation_period, orbital_period, diameter, surface_water, population),
                as.numeric) %>%
      mutate(gravity = str_extract_all(gravity, '[0-9]+'))
  }

  # starships & vehicles (fix consumables some other time)
  if (grepl(fn_name, pattern = 'starship|vehicle')) {
    result = result %>%
      mutate_at(
        vars(
          cost_in_credits,
          max_atmosphering_speed,
          crew,
          passengers,
          cargo_capacity),
        as.numeric
      ) %>%
      mutate_at(vars(contains('class')), tolower) %>%
      mutate(length = str_remove_all(length, ','),   # fun!
             length = as.numeric(length))

    if (fn_name == 'get_all_starships') {
      result = result %>%
        mutate_at(vars(hyperdrive_rating, MGLT), as.numeric)  # not in vehicles
    }
  }

  # species
  if (fn_name == 'get_all_species') {
    result = result %>%
      mutate(
        average_height = as.numeric(average_height),
        average_lifespan = ifelse(average_lifespan == 'indefinite',
                                  NA,
                                  average_lifespan),
        average_lifespan = as.numeric(average_lifespan)
      )
  }

  result
}


convert_to_film = function(data) {
  nams = names(data)

  if ('films' %in% nams)
    mutate(data, films = sapply(data[['films']], function(idx) films_names[idx]))
  else data
}

convert_to_people = function(data) {
  nams = names(data)

  if ('characters' %in% nams)
    data =  mutate(data, characters = sapply(data[['characters']], function(idx) people_names[idx]))
  if ('pilots' %in% nams)
    data =  mutate(data, pilots = sapply(data[['pilots']], function(idx) people_names[idx]))
  if ('people' %in% nams)
    data =  mutate(data, people = sapply(data[['people']], function(idx) people_names[idx]))

  data
}

convert_to_species = function(data) {
  nams = names(data)

  if ('residents' %in% nams)
    data = mutate(data, residents = sapply(data[['residents']], function(idx) species_names[idx]))
  if ('species' %in% nams)
    data = mutate(data, species = sapply(data[['species']], function(idx) species_names[idx]))

  data
}

convert_to_planets = function(data) {
  nams = names(data)

  if ('planets' %in% nams)
    data = mutate(data, planets = sapply(data[['planets']], function(idx) planets_names[idx]))
  if ('homeworld' %in% nams)
    data = mutate(data, homeworld = sapply(data[['homeworld']], function(idx) planets_names[idx]))

  data
}

convert_to_vehicles = function(data) {
  nams = names(data)

  if ('vehicles' %in% nams)
    mutate(data, vehicles = sapply(data[['vehicles']], function(idx) vehicles_names[idx]))
  else data
}

convert_to_starships = function(data) {
  nams = names(data)
  if ('starships' %in% nams)
    mutate(data, starships = sapply(data[['starships']], function(idx) starships_names[idx]))
  else data
}

convert_all = function(data) {
  data %>%
    convert_to_film() %>%
    convert_to_species() %>%
    convert_to_planets() %>%
    convert_to_vehicles() %>%
    convert_to_starships() %>%
    as_tibble()
}
