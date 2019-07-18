library(tidyverse)
library(tidyext)

gender_gap0 = read_csv('data-raw/wef_gender_gap.csv') %>%
  janitor::clean_names() %>%
  janitor::remove_empty()

gender_gap0 %>% describe_all()




gender_gap = gender_gap0 %>%
  filter(subindicator_type != 'Normalized Score') %>%
  gather(key = year, value = value,
         -country_iso3, -country_name, -indicator_id, -indicator, -subindicator_type) %>%
  mutate(year = as.integer(str_remove(year, pattern = 'x'))) %>%
  arrange(country_name, indicator, year, subindicator_type)

gender_gap

# how do you have more ranks than values? go world bank!
gender_gap %>%
  spread(key = subindicator_type, value = value)

gender_gap %>% tidyext::describe_all_num()

gender_gap = gender_gap %>%
  spread(key = `Subindicator Type`, value = value)

# looks like gender gap
gender_gap %>%
  spread(key = Indicator, value = Index) %>%
  tidyext::describe_all_num()
