# bfi comes from psych package; reverse scored for visibly package; add back gender, ed, age

library(tidyverse)

bfi = visibly::bfi %>%
  cbind(psych::bfi %>% select(gender:age))


bfi %>% tidyext::describe_all()

big_five = bfi %>%
  mutate(
    gender = factor(gender, labels = c('male', 'female')),
    education = factor(education, labels = c("HS", "finished HS", "some college", "college graduate", "graduate degree"))
    )

usethis::use_data(big_five, overwrite = TRUE)
