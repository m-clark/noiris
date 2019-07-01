# raw data downloaded from the pisa data explorer; first save as xlsx, as the format is Excel 2004 ffs

library(tidyverse)

pisa_math_raw  = readxl::read_excel(
  'data-raw/pisa/PISAExport-Jun302019.xlsx',
  sheet = 1,
  skip = 11,
  col_names = TRUE,
  na = c('—', '†'),
  n_max = 234 - 11    # based on inspection
)

pisa_reading_raw  = readxl::read_excel(
  'data-raw/pisa/PISAExport-Jun302019.xlsx',
  sheet = 2,
  skip = 11,
  col_names = TRUE,
  na = c('—', '†'),
  n_max = 234 - 11
)

pisa_science_raw  = readxl::read_excel(
  'data-raw/pisa/PISAExport-Jun302019.xlsx',
  sheet = 3,
  skip = 11,
  col_names = TRUE,
  na = c('—', '†'),
  n_max = 234 - 11
)

pisa_interest_sci_raw  = readxl::read_excel(
  'data-raw/pisa/PISAExport-Jun302019.xlsx',
  sheet = 4,
  skip = 11,
  col_names = TRUE,
  na = c('—', '†'),
  n_max = 234 - 11
)

pisa_support_sci_raw  = readxl::read_excel(
  'data-raw/pisa/PISAExport-Jun302019.xlsx',
  sheet = 5,
  skip = 11,
  col_names = TRUE,
  na = c('—', '†'),
  n_max = 234 - 11
)



clean_pisa <- function(data) {
  data %>%
    fill(Year) %>%
    mutate(Year = as.integer(Year),
           Average = as.numeric(Average),
           `Standard Error` = as.numeric(`Standard Error`),
           Jurisdiction = if_else(Jurisdiction == 'Korea', 'South Korea', Jurisdiction)) %>%
    rename(SE = `Standard Error`,
           country = Jurisdiction,
           year = Year,
           average = Average)
}

# rm(pisa_raw)  # if redoing
pisa_raw = mget(ls(pattern = '^pisa'))

# debugonce(clean_pisa)
# basic cleaning plus remove first row which just dupes the international average.
pisa = pisa_raw %>%
  map(clean_pisa) %>%
  map_df(function(x) x %>%
           group_split(year) %>%
           map(slice, -1) %>%
           bind_rows(),
         .id = 'variable')

pisa = pisa %>%
  mutate(variable = str_remove(variable, pattern = 'pisa_'),
         variable = str_remove(variable, pattern = '_raw'))

pisa = pisa %>%
  select(-SE) %>%
  spread(variable, average) %>%
  arrange(country, year)

# join to gapminder, assumes that has already been processed with gapminder.R.

data("gapminder_2019")

# setdiff(pisa$country, gapminder_2019$country)
# intersect(pisa$country, gapminder_2019$country)

pisa = pisa %>%
  left_join(gapminder_2019)
# pisa %>%
#   filter(is.na(continent) & !grepl(country, pattern = 'International')) %>%
#   data.frame()

# reorder
pisa = pisa %>%
  select(country, continent, year,
         math, reading, science,
         interest_sci, support_sci,
         everything())

usethis::use_data(pisa, overwrite = T)
