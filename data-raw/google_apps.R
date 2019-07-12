library(tidyverse)

gapps = read_csv('data-raw/google-play-store-apps/googleplaystore.csv')
greviews = read_csv('data-raw/google-play-store-apps/googleplaystore_user_reviews.csv')

gapps
greviews

n_distinct(gapps$App)
n_distinct(greviews$App)

gapps = gapps %>%
  janitor::remove_empty() %>%
  janitor::clean_names() %>%
  distinct() %>%
  mutate(
    last_updated = lubridate::mdy(last_updated),
    size = case_when(
      grepl(size, pattern = 'M$') ~ as.numeric(str_remove(size, pattern = 'M')),
      grepl(size, pattern = 'k$') ~ as.numeric(str_remove(size, pattern = 'k'))/1000,
      TRUE ~ 0
    ))

greviews = greviews %>%
  janitor::remove_empty() %>%
  janitor::clean_names()

google_apps = gapps %>%
  nest_join(greviews)

google_apps
map(google_apps$greviews, nrow)

greviews %>%
  count(app)


google_apps = google_apps %>%
  mutate(greviews = ifelse(
    map(greviews, nrow) == 0,
    NA,
    greviews))

usethis::use_data(google_apps, overwrite = TRUE)
