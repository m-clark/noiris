# data found here: https://www.kaggle.com/zynicide/wine-reviews/  the
# description is a little off. The '150k' version doesn't have any twitter/title
# info, and both still have plenty of dupes (about 10k for 130, and 1/3 of 150),
# but for demo this should be fine. It's not clear what the actual differences
# are between 130 and 150, so I just combined them to provide a maximum number
# of reviews.

wine_reviews0 = read_csv('data-raw/wine/winemag-data-130k-v2.csv')
# wine_reviews0

wine_reviews0 = wine_reviews0 %>%
  select(-X1) %>%
  distinct()

# not seeing too much to clean yet.

wine_150 = read_csv('data-raw/wine/winemag-data_first150k.csv') %>%
  select(-X1) %>%
  distinct()

wine_reviews = full_join(wine_reviews0, wine_150)

# do a distinct on description, as that is most likely informative of true dupe
wine_reviews = wine_reviews %>%
  distinct(description, .keep_all = TRUE)

# wine_reviews %>%
#   arrange(description)

usethis::use_data(wine_reviews, overwrite = T)



# ml example --------------------------------------------------------------
# https://archive.ics.uci.edu/ml/datasets/Wine+Quality
# P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis. Modeling wine preferences by data mining from physicochemical properties.
# In Decision Support Systems, Elsevier, 47(4):547-553, 2009.

# Available at: [http://dx.doi.org/10.1016/j.dss.2009.05.016]

wine_quality = read_csv('data-raw/wine/wine.csv')
wine_quality = wine_quality %>%
  janitor::clean_names()

usethis::use_data(wine_quality, overwrite = T)
