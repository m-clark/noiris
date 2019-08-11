# https://www.nytimes.com/interactive/2019/08/06/climate/world-water-stress.html
# https://www.wri.org/resources/data-sets/aqueduct-30-country-rankings
# https://github.com/rutgerhofste/aqueduct30_country_rankings_data_download/blob/master/metadata.md

library(tidyverse)

# Import ------------------------------------------------------------------

# country_data comes from second sheet of aqueduct-30-country-rankings.xlsx
water_risk_country0 = readxl::read_excel(
  'data-raw/water-risk/country_data.xlsx',
  na = '-9999'
  ) %>%
  janitor::remove_empty()

water_risk_province0 = readxl::read_excel(
  'data-raw/water-risk/aqueduct-30-country-rankings.xlsx',
  sheet = 3,
  na = '-9999'
  ) %>%
  janitor::remove_empty()



# country -----------------------------------------------------------------

glimpse(water_risk_country0)

tidyext::describe_all(water_risk_country0)

water_risk = water_risk_country0 %>%
  select(-cat, -indicator_name, -weight) %>%    # just a numeric of 'label', and this is only one indicator
  mutate_if(function(x)
    is.numeric(x) & !any(grepl(as.character(x), pattern = '\\.')),
    as.integer)

glimpse(water_risk)

# province ----------------------------------------------------------------


glimpse(water_risk_province0)

tidyext::describe_all(water_risk_province0)

water_risk_province = water_risk_province0 %>%
  tidyext:::select_not(cat, sum_weights:valid_hybas6, primary, indicator_name, weight) %>%  # remove hidden weight info and constant
  mutate_if(function(x)
    is.numeric(x) & !any(grepl(as.character(x), pattern = '\\.')),
    as.integer)

glimpse(water_risk_province)


# save --------------------------------------------------------------------

usethis::use_data(water_risk, overwrite = TRUE)
usethis::use_data(water_risk_province, overwrite = TRUE)
