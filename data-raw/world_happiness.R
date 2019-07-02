

library(tidyverse)

# Due to issues with Kaggle, just downloaded directly from https://s3.amazonaws.com/happiness-report/2019/Chapter2OnlineData.xls
# 2019 has all the indicators, but for some reason only the happiness score for the specific year.

world_happiness_report = readxl::read_xlsx('data-raw/world-happiness/world-happiness-report-2019-direct.xlsx')

# excel maneuvers
# 2015 initially deleted first two lines; This data is notably different from the others
# 2016 & 2017 switched sheet 2 and 3
happy_files = paste0('data-raw/world-happiness/world-happiness-report-201', 5:9, '-direct.xlsx')
happiness_scores = map(happy_files, readxl::read_xlsx, sheet = 2)
names(happiness_scores) = 2015:2019

happiness_scores = map(happiness_scores, janitor::clean_names)
happiness_scores = map(happiness_scores, janitor::remove_empty, which =c('rows', 'cols'))


# rename variables
happiness_scores[['2015']] = happiness_scores[['2015']] %>% rename(happiness_score = ladder_score)

find_dystopia = function(dat) {
  dat %>% rename_if(
    str_detect(colnames(.), pattern = 'dystopia_[0-9]'),
    function(nam) 'dystopia_residual')
}

happiness_scores[-1] = map(happiness_scores[-1], find_dystopia)

# select and combine
happiness_scores  = map_df(happiness_scores,
                           function(dat) select(dat, country, happiness_score, dystopia_residual),
                           .id = 'year') %>%
  arrange(country, year) %>%
  mutate(year = as.integer(year))

# happiness_scores


world_happiness_report = janitor::clean_names(world_happiness_report) %>%
  rename(country = country_name) %>%
  left_join(happiness_scores)

# Checks
# world_happiness_report %>%
#   select_if(is.numeric) %>%
#   cor(select(., happiness_score, dystopia_residual), use = 'pair') %>%
#   round(2)
# world_happiness_report %>%
#   select(happiness_score, dystopia_residual) %>%
#   cor(use = 'pair') %>%
#   round(2)
#
# world_happiness_report %>%
#   ggplot(aes(x = life_ladder, y=happiness_score)) +
#   geom_point()

world_happiness = world_happiness_report %>%
  select(-matches('standard_deviation|[0-9]'), -starts_with('most_people'))

usethis::use_data(world_happiness, overwrite = TRUE)

