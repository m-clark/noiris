
library(tidyverse); library(gapminder)

data("gapminder")


# recent data imported from here
# https://www.gapminder.org/data/

# Import data -------------------------------------------------------------

le0  = read_csv('data-raw/gapminder/life_expectancy_years.csv')
pop0 = read_csv('data-raw/gapminder/population_total.csv')
gdp0 = read_csv('data-raw/gapminder/income_per_person_gdppercapita_ppp_inflation_adjusted.csv')
gini0 = read_csv('data-raw/gapminder/gini.csv')



# Make long form ----------------------------------------------------------


# need to change to pivot* when tidyr updates

glimpse(le0)
le = le0 %>%
  gather(key = year, value = lifeExp, -country)
head(le)

glimpse(pop0)
pop = pop0 %>%
  gather(key = year, value = pop, -country)
head(pop)

glimpse(gdp0)
gdp = gdp0 %>%
  gather(key = year, value = gdpPercap, -country)
gdp

glimpse(gini0)
gini = gini0 %>%
  gather(key = year, value = giniPercap, -country)
gini

gapminder_2019 = Reduce(left_join, list(le, pop, gdp, gini)) %>%
  left_join(gapminder %>% select(country, continent) %>% distinct()) %>%
  mutate(year = as.integer(year))


# later issues found that gapminder didn't have info on some; for now just fixing for pisa

gapminder_2019 %>%
  distinct(country, continent) %>%
  filter(is.na(continent))

gapminder_2019 = gapminder_2019 %>%
  mutate(
    continent = case_when(
    country %in% c('Luxembourg', 'Latvia', 'Estonia') ~ 'Europe',
    grepl(country, pattern = 'Korea')  ~ 'Asia',
    TRUE ~ as.character(continent)
  ))

usethis::use_data(gapminder_2019, overwrite = TRUE)

