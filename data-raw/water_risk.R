# https://www.nytimes.com/interactive/2019/08/06/climate/world-water-stress.html
# https://www.wri.org/resources/data-sets/aqueduct-30-country-rankings
# https://github.com/rutgerhofste/aqueduct30_country_rankings_data_download/blob/master/metadata.md

library(tidyverse)

# Import ------------------------------------------------------------------

water_risk_country0 = readxl::read_excel(
  'data-raw/aqueduct-30-country-rankings.xlsx',
  sheet = 2,
  na = '-9999'
  ) %>%
  janitor::remove_empty()

water_risk_province0 = readxl::read_excel(
  'data-raw/aqueduct-30-country-rankings.xlsx',
  sheet = 3,
  na = '-9999'
  ) %>%
  janitor::remove_empty()



# country -----------------------------------------------------------------

glimpse(water_risk_country0)

tidyext::describe_all(water_risk_country0)

water_risk_country = water_risk_country0 %>%
  select(-cat)   # just a numeric of 'label'

# province ----------------------------------------------------------------



glimpse(water_risk_province00)
