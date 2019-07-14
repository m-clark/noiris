library(tidyverse)

fashion_train = read_csv('data-raw/fashion-mnist/fashion-mnist_train.csv')
fashion_test = read_csv('data-raw/fashion-mnist/fashion-mnist_test.csv')


usethis::use_data(fashion_train, overwrite = T)
usethis::use_data(fashion_test, overwrite = T)

# pointless as tsv = csv in size
# git2rdata::write_vc(fashion_train, 'data-raw/fashion-mnist/fashion-mnist_train')
