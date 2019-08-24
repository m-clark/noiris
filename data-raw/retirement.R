library(tidyverse)
library(tidyext)

retirement = haven::read_dta('data-raw/401k.dta')

glimpse(retirement)


retirement = retirement %>%
  select(-agesq, -ltotempsq, -ltotemp) %>%  # drop unnecessary quadratic terms
  mutate(sole = factor(sole, labels = c('not', 'only_plan'))) %>%
  rename(
    participation_n = partic,
    emp_total_n = totemp,
    emp_eligible_n = employ,
    matching_rate = mrate,
    participation_rate = prate,
    only_plan = sole,
    age_of_401k = age
    )

# 1. prate                       participation rate, percent
# 2. mrate                       401k plan match rate
# 3. totpart                     total 401k participants
# 4. totelg                      total eligible for 401k plan
# 5. age                         age of 401k plan
# 6. totemp                      total number of firm employees
# 7. sole                        = 1 if 401k is firm's sole plan
sapply(retirement, attr, 'label')
# https://ideas.repec.org/p/boc/bocins/401k.html

# From Internal Revenue Service's Form 5500 (http://qcpages.qc.cuny.edu/~rvesselinov/statadata/databook3e.doc)

usethis::use_data(retirement, overwrite = TRUE)
