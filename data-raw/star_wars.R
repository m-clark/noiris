library(tidyverse)
library(rwars)


# get preliminary results -------------------------------------------------

films     = get_all_films(parse_result = T)
people    = get_all_people(parse_result = T)
planets   = get_all_planets(parse_result = T)
species   = get_all_species(parse_result = T)
starships = get_all_starships(parse_result = T)
vehicles  = get_all_vehicles(parse_result = T)

star_wars = list(
        films     = films,
        people    = people,
        planets   = planets,
        species   = species,
        starships = starships,
        vehicles  = vehicles
)


usethis::use_data(star_wars, overwrite = TRUE)


# load('data/starwars_raw.RData')


source('data-raw/get_all_results.R')


# get all the results (for real) ------------------------------------------

films     = get_all_results(get_all_films)
people    = get_all_results(get_all_people)
planets   = get_all_results(get_all_planets)
species   = get_all_results(get_all_species)
starships = get_all_results(get_all_starships)
vehicles  = get_all_results(get_all_vehicles)


# extract names -----------------------------------------------------------


films_names      = films$title
people_names    = people$name
planets_names   = planets$name
species_names   = species$name
starships_names = starships$name
vehicles_names  = vehicles$name

usethis::use_data(
        films_names,
        people_names,
        planets_names,
        species_names,
        starships_names,
        vehicles_names,
        overwrite = TRUE
)



# convert the former urls to labeled values -------------------------------

films     = convert_all(films)
people    = convert_all(people)
planets   = convert_all(planets)
species   = convert_all(species)
starships = convert_all(starships)
vehicles  = convert_all(vehicles)


usethis::use_data(
        films,
        people,
        planets,
        species,
        starships,
        vehicles,
        overwrite = TRUE
)



