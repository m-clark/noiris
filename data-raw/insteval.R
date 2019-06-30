library(tidyverse)

insteval = lme4::InstEval

instructor_evaluations = insteval %>%
  rename(
    student_id = s,
    instructor_id = d,
    student_age = studage,
    lecture_age = lectage,
    department = dept,
    rating = y
  ) %>%
  mutate(
    lecture_age_num = as.integer(lecture_age),
    service = factor(service, labels = c('main', 'service'))
  ) %>%
  as_tibble()


usethis::use_data(instructor_evaluations, overwrite = TRUE)
