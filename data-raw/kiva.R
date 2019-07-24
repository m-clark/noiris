# https://www.kaggle.com/kiva/data-science-for-good-kiva-crowdfunding

library(tidyverse)

files = list.files('data-raw/kiva/', full.names = T)

kiva = map(files, read_csv) %>%
  map(janitor::remove_empty) %>%
  map(janitor::clean_names)

kiva %>% map(glimpse)

kiva %>% map(function(d) format(object.size(d), 'MB'))


kiva_base = kiva[[1]]
kiva_locations = kiva[[2]]
kiva_loan_ids = kiva[[3]]
kiva_loan_region_ids = kiva[[4]]

n_distinct(kiva_loan_ids$id)
n_distinct(kiva_base$id)


# fix genders
test = kiva_base %>%
  mutate(borrower_female_n = str_count(borrower_genders, 'female'),
         borrower_male_n = str_count(borrower_genders, 'male') - borrower_female_n) %>%
  select(contains('borrow'))

# test %>% data.frame() %>% slice(150:200) # check


# fix mpi_geo
kiva_loan_region_ids = kiva_loan_region_ids %>%
  mutate(mpi_geo = str_remove_all(mpi_geo, '[\\(\\)]'),
       lat_mpi = sapply(mpi_geo, str_split, pattern = ', ')[[1]][1],
       lon_mpi = sapply(mpi_geo, str_split, pattern = ', ')[[1]][2]) %>%
  mutate_at(vars(lat_mpi, lon_mpi), as.numeric)

kiva_loan_info = kiva_loan_ids %>%
  left_join(kiva_base)

kiva_location_info = kiva_loan_region_ids %>%
  left_join(kiva_locations)


kiva = kiva_loan_info %>%
  left_join(kiva_location_info)

library(tidyext)

kiva %>% describe_all_num()
# kiva %>% describe_all_cat() # takes a bit

kiva %>% summarise_all(n_distinct) %>% glimpse()

format(object.size(kiva), 'Mb')


test = kiva %>%
  select(-contains('geo'))

glimpse(test)

usethis::use_data(kiva, overwrite = TRUE)
