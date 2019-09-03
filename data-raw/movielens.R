library(tidyverse)

temp <- tempfile()
download.file("http://files.grouplens.org/datasets/movielens/ml-latest.zip", temp)

utils::unzip(
  zipfile = temp,
  files = c('ml-latest/ratings.csv', 'ml-latest/movies.csv'),
  exdir = 'data-raw/movielens/'
)

rm(temp)

ratings = read_csv('data-raw/movielens/ml-latest/ratings.csv')
movies = read_csv('data-raw/movielens/ml-latest/movies.csv')

set.seed(1234)

# add movie info
movielens = ratings %>%
  sample_n(1e6) %>%
  left_join(movies)

movielens

# dummy code genres; this initially took an inordinate amount of time and then
# failed on memory limit because | needed to be escaped
movielens = movielens %>%
  tidyext::combn_2_col('genres', sep = '\\|', toInteger = TRUE)

# unfortunately someone thought it a good idea to have the year in parenthesis
# along with the title; the following extracts the year and removes it from the
# title.
movielens = movielens %>%
  select(-genres) %>%
  mutate(
    timestamp = lubridate::as_datetime(timestamp),  # origin is same as ML
    userId = as.integer(userId),
    movieId = as.integer(movieId),
    year = str_extract(title, '\\([0-9]+\\)$'),
    title = str_trim(str_remove(title, '\\([0-9]+\\)$')),
    year = as.integer(str_remove_all(year, '\\(|\\)'))
    ) %>%
  rename(
    user_id = userId,
    movie_id = movieId,
    scifi = `Sci-Fi`,
    film_noir = `Film-Noir`,
    no_genre = `(no genres listed)`,
    genres = combo
  ) %>%
  rename_all(tolower)

glimpse(movielens)

tidyext::describe_all_num(movielens)

# some of the missing years are pretty recent so add manually to get back most;
# Others seem to be multi-year series like Black Mirror
movielens %>%
  filter(is.na(year)) %>%
  count(title, sort = T)

movielens = movielens %>%
  mutate(
    year = if_else(
      title %in% c('Moonlight', 'Nocturnal Animals', 'Paterson'),
      2016L,
      year
    ),
    year = if_else(title %in% c('Ready Player One'), 2018L, year)
    ) %>%
  select(user_id:title, year, everything())

tidyext::describe_all_num(movielens)
glimpse(movielens)

test = movielens %>% tidyext::num_by(rating, title, digits = 5)

test %>% filter(N > 500) %>%  arrange(desc(Mean))

movielens %>% select(user_id, movie_id) %>% map(n_distinct)  # for help file
movielens %>% count(user_id, sort = T)

usethis::use_data(movielens, overwrite = TRUE)

devtools::spell_check() %>% as.data.frame() %>% unnest() %>% arrange(found)
