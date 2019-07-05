library(tidyverse)
library(BatchGetSymbols)

# note that this switches the company and ticker names
sp500_base = GetSP500Stocks()
sp500_base = sp500_base %>%
  rename(company = tickers, ticker = company) %>%
  as_tibble()


library(future)
plan(multiprocess)

# by default will fill missing with last, but just leave unbalanced as it bugs trying to fill na
library(lubridate)
recession_nadir = '2009-03-09'
start = as_date(recession_nadir) - years(5)
end   = as_date(recession_nadir) + years(5)

sp500 = BatchGetSymbols(
  tickers = sp500_base$ticker,
  first.date = start,
  last.date  = end,
  freq.data  = 'daily',
  do.complete.data = F,
  do.fill.missing.prices = F,
  thresh.bad.data = .01,
  cache.folder = file.path(tempdir(), 'BGS_Cache'), # cache in tempdir()
  do.parallel = T
)

plan(sequential)

# sp500$df.control
# range(sp500$df.control$perc.benchmark.dates)

# sp500_base %>% glimpse()
# sp500$df.tickers %>% glimpse()

sp500 = sp500$df.tickers %>%
  as_tibble() %>%
  janitor::clean_names()


sp500 = sp500_base %>%
  nest_join(sp500, name = 'pricing_data') %>%
  select(-SEC.filings) %>%
  mutate(Date.first.added = as_date(Date.first.added),
         Founded = as.integer(Founded)) %>%
  rename(sector = GICS.Sector,
         subindustry = GICS.Sub.Industry,
         date_added = Date.first.added,
         year_founded = Founded) %>%
  rename_all(.funs = tolower) %>%  # evidently .funs (plural) can only take one function
  janitor::clean_names()

# sp500 %>%
#   tidyr::unnest()

# rm cache dir from main package dir
unlink("BGS_Cache/", recursive=TRUE)

usethis::use_data(sp500, overwrite = TRUE)
