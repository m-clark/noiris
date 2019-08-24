#' Retirement plan data
#'
#'
#' This data is useful for demonstrating binomial, beta, fractional regression models.
#'
#' @format Data frame with 7 variables.
#' \describe{
#'   \item{participation_n}{Number employees participating in 401(k)}
#'   \item{emp_total_n}{Number of worldwide firm employees}
#'   \item{emp_eligible_n}{Number of employees eligible for 401(k)}
#'   \item{matching_rate}{Plan match rate, per $}
#'   \item{participation_rate}{participation_n / emp_eligible_n}
#'   \item{only_plan}{If 401k is the firm's only plan}
#'   \item{age_of_401k}{Age of the plan}
#' }
#'
#' @details From Internal Revenue Service's Form 5500
#'   (\href{http://qcpages.qc.cuny.edu/~rvesselinov/statadata/databook3e.doc}{link})
#'
#'
#' @note Names were changed from the original
#'
#'
#' @source \href{https://ideas.repec.org/p/boc/bocins/401k.html}{Data link}
#' @references
#' Wooldridge, J. M. Introductory Econometrics: A Modern Approach.
#' \href{Demo}{https://m-clark.github.io/posts/2019-08-20-fractional-regression/}
#'
#' @examples
#' library(noiris)
#' str(retirement)
#'
"retirement"
