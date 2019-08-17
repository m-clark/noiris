library(tidyverse)
library(tidyext)

gender_gap0 = read_csv('data-raw/gender-gap/wef_gender_gap.csv') %>%
  janitor::clean_names() %>%
  janitor::remove_empty()

gender_gap0 %>% describe_all()




gender_gap = gender_gap0 %>%
  select(-indicator_id) %>%
  filter(!grepl(subindicator_type, pattern = 'Normalized Score|Rank')) %>%
  gather(key = year, value = value,
         -country_iso3, -country_name, -indicator, -subindicator_type) %>%
  mutate(year = as.integer(str_remove(year, pattern = 'x'))) %>%
  arrange(country_name, indicator, year, subindicator_type)

gender_gap

gender_gap_2018 = gender_gap %>%
  filter(year == 2018) %>%
  spread(indicator, value) %>%
  janitor::clean_names() %>%
  select(-subindicator_type)

gender_gap_2018

gender_gap = gender_gap %>%
  filter(grepl(indicator, pattern = 'Gender')) %>%
  spread(key = indicator, value = value) %>%
  janitor::clean_names() %>%
  select(-subindicator_type)



usethis::use_data(gender_gap, overwrite = T)
usethis::use_data(gender_gap_2018, overwrite = T)
