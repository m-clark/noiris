% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pisa.R
\docType{data}
\name{pisa}
\alias{pisa}
\title{PISA data.}
\format{The main data frame \code{pisa} has 216 rows and 12 variables:
\describe{
  \item{country}{factor with 36 levels, including the International average}
  \item{continent}{factor with 5 levels}
  \item{year}{ranges from 2000 to 2015 in increments of 3}
  \item{math}{PISA math score}
  \item{reading}{PISA reading score}
  \item{science}{PISA science score}
  \item{interest_sci}{PISA interest in science score - 2006 only}
  \item{support_sci}{PISA support for science score - 2006 only}
  \item{lifeExp}{life expectancy at birth, in years}
  \item{pop}{population}
  \item{gdpPercap}{GDP per capita (US$, inflation-adjusted)}
  \item{giniPercap}{Gini coefficient of inequality}
  }}
\source{
\url{https://www.oecd.org/pisa/}
}
\usage{
pisa
}
\description{
PISA is the OECD's Programme for International Student Assessment. Every
three years it tests 15-year-old students from all over the world in reading,
mathematics and science. The tests are designed to gauge how well the
students master key subjects in order to be prepared for real-life situations
in the adult world.
}
\details{
The PISA data has been linked to the \link{gapminder_2019} data.
  Not all countries have PISA scores for all years. Interest and support for
  science were only measured in 2006.
}
\examples{
library(noiris)
str(pisa)
pisa

}
\seealso{
\link[gapminder]{gapminder}
}
\keyword{datasets}
