#' Gapminder data.
#'
#' A recent download of the Gapminder data on life expectancy, GDP per capita,
#' Gini coefficient, and population by country.
#'
#' @format The main data frame \code{gapminder} has 40,953 rows and 7 variables:
#' \describe{
#'   \item{country}{factor with 142 levels}
#'   \item{continent}{factor with 5 levels}
#'   \item{year}{ranges from 1800 to 2018}
#'   \item{lifeExp}{life expectancy at birth, in years}
#'   \item{pop}{population}
#'   \item{gdpPercap}{GDP per capita (US$, inflation-adjusted)}
#'   \item{giniPercap}{Gini coefficient of inequality}
#'   }
#'
#' @details While the data goes back to 1800, most of it prior to a couple of
#'   decades ago is either filler or probably nonsense.  See the
#'   \link[gapminder]{gapminder} package for a smaller version.
#'
#' @source \url{http://www.gapminder.org/data/}
#' @seealso \link[gapminder]{gapminder}
#' @examples
#' library(noiris)
#' str(gapminder_2019)
#' gapminder_2019
#' summary(gapminder_2019)
#'
#' if (require("dplyr")) {
#' gapminder_2019 %>%
#'   filter(year == 2007) %>%
#'   group_by(continent) %>%
#'   summarise(lifeExp = median(lifeExp))
#' }
#'
"gapminder_2019"
