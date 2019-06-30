library(tidyverse)

fish = read_csv("https://stats.idre.ucla.edu/stat/data/fish.csv")

fish <- fish %>%
  mutate(
    nofish = factor(nofish, labels = c('no', 'yes')),
    livebait = factor(livebait, labels = c('no', 'yes')),
    camper = factor(camper, labels = c('no', 'yes'))
  ) %>%
  select(-xb, -zg)

usethis::use_data(fish, overwrite = TRUE)
