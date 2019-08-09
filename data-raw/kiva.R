# https://www.kaggle.com/kiva/data-science-for-good-kiva-crowdfunding

library(tidyverse)

files = list.files('data-raw/kiva/', full.names = T)

kiva_0 = map(files, read_csv) %>%
  map(janitor::remove_empty) %>%
  map(janitor::clean_names)

kiva %>% map(glimpse)

kiva %>% map(function(d) format(object.size(d), 'MB'))


kiva_base = kiva_0[[1]]
kiva_locations = kiva_0[[2]]
kiva_loan_ids = kiva_0[[3]]
kiva_loan_region_ids = kiva_0[[4]]

n_distinct(kiva_loan_ids$id)
n_distinct(kiva_base$id)


# fix genders, make integers
kiva_base = kiva_base %>%
  mutate(
    borrower_female_n = str_count(borrower_genders, 'female'),
    borrower_male_n = str_count(borrower_genders, 'male') - borrower_female_n
  ) %>%
  mutate(
    id = as.integer(id),
    funded_amount = as.integer(funded_amount),
    loan_amount = as.integer(loan_amount),
    term_in_months = as.integer(term_in_months),
    lender_count = as.integer(lender_count),
    partner_id = as.integer(partner_id)
  )

# remove redundancy
kiva_locations = kiva_locations %>%
  select(-geo)

# make integers
kiva_loan_ids = kiva_loan_ids %>%
  mutate(
    id = as.integer(id),
    partner_id = as.integer(partner_id)
  )

# fix mpi_geo, integers
kiva_loan_region_ids = kiva_loan_region_ids %>%
  mutate(
    partner_id = as.integer(partner_id),
    mpi_geo = str_remove_all(mpi_geo, '[\\(\\)]'),
    lat_mpi = sapply(mpi_geo, str_split, pattern = ', ')[[1]][1],
    lon_mpi = sapply(mpi_geo, str_split, pattern = ', ')[[1]][2],
  ) %>%
  mutate_at(vars(lat_mpi, lon_mpi), as.numeric) %>%
  select(-geocode_old, -mpi_geo, -geocode, -geo)


# merge
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


glimpse(kiva)
format(object.size(kiva), 'MB')

# reorder
kiva = kiva %>%
  select(
    contains('id'),
    field_partner_name,
    contains('country'),
    iso,
    contains('region'),
    matches('^lat|^lon'),
    contains('mpi'),
    location_name,
    contains('loan'),
    date,
    contains('time'),
    term_in_months,
    contains('lender'),
    contains('borrower'),
    everything()
    )

usethis::use_data(kiva, overwrite = TRUE)
