#' S&P 500 data.
#'
#' Includ
#'
#' @format The nested main data frame \code{sp500} has 505 rows and 10
#'   variables:
#' \describe{
#'   \item{ticker}{}
#'   \item{company}{}
#'   \item{sector}{Global Industry Classification Standard}
#'   \item{sub_industry}{Global Industry Classification Standard}
#'   \item{address}{City, State}
#'   \item{date_added}{}
#'   \item{CIK}{A Central Index Key or CIK number is a number given to an individual, company, or foreign government by the United States Securities and Exchange Commission. The number is used to identify its filings in several online databases, including EDGAR.}
#'   \item{year_founded}{Year company was founded.}
#'   \item{pricing_data}{A list column. See details.}
#'   }
#'
#' @details
#'
#' @note
#' @source Obtained via \href{\code{BatchGetSymbols}}{https://cran.r-project.org/web/packages/BatchGetSymbols/vignettes/BatchGetSymbols-vignette.html} package. \href{Wikipedia List of S&P 500companies}{https://en.wikipedia.org/wiki/List_of_S%26P_500_companies}.
#' @examples
#' library(noiris)
#' str(sp500, 1)
#'
#'
#'
"sp500"
