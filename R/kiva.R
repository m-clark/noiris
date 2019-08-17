#' Kiva crowdfunding data
#'
#' From the Kaggle website description: Kiva.org is an online crowdfunding
#' platform to extend financial services to poor and financially excluded people
#' around the world. Kiva lenders have provided over $1 billion dollars in loans
#' to over 2 million people. In order to set investment priorities, help inform
#' lenders, and understand their target communities, knowing the level of
#' poverty of each borrower is critical. However, this requires inference based
#' on a limited set of information for each borrower...
#'
#' Kiva has provided a dataset of loans issued over the last two years, and
#' participants are invited to use this data as well as source external public
#' datasets to help Kiva build models for assessing borrower welfare levels...
#' With a stronger understanding of their borrowers and their poverty levels,
#' Kiva will be able to better assess and maximize the impact of their work.
#'
#' @format Several data frames combined by id: kiva_loans,
#'   kiva_mpi_region_locations, loan_theme_ids, loan_themes_by_region. Original
#'   names and descriptions are provided.
#'
#' \describe{
#'   \item{id}{Unique ID for loan}
#'   \item{funded_amount}{The amount disbursed by Kiva to the field agent(USD)}
#'   \item{activity}{More granular category}
#'   \item{sector}{High level category}
#'   \item{use}{Exact usage of loan amount}
#'   \item{country_code}{ISO country code of country in which loan was disbursed}
#'   \item{country}{Full country name of country in which loan was disbursed}
#'   \item{region}{Full region name within the country}
#'   \item{currency}{The currency in which the loan was disbursed}
#'   \item{partner_id}{ID of partner organization}
#'   \item{posted_time}{The time at which the loan is posted on Kiva by the field agent}
#'   \item{disbursed_time}{The time at which the loan is disbursed by the field agent to the borrower}
#'   \item{funded_time}{The time at which the loan posted to Kiva gets funded by lenders completely}
#'   \item{term_in_months}{The duration for which the loan was disbursed in months}
#'   \item{lender_count}{The total number of lenders that contributed to this loan}
#'   \item{tags}{No description provided}
#'   \item{borrower_genders}{Comma separated Male, Female, where each instance
#'   represents a single male/female in the group. This was broken out into
#'   separate counts for male and female.}
#'   \item{repayment_interval}{}
#'   \item{date}{}
#'   }
#'
#' \describe{
#'   \item{LocationName}{region, country}
#'   \item{ISO}{some sort of unique abbreviation for country}
#'   \item{country}{country}
#'   \item{region}{region with in country}
#'   \item{world_region}{parts of the world}
#'   \item{MPI}{multidimensional poverty index}
#'   \item{geo}{(latitude, longitude)}
#'   \item{lat}{latitude}
#'   \item{lon}{longitude}
#' }
#'
#' \describe{
#'   \item{id}{Unique ID for loan (Loan ID)}
#'   \item{Loan Theme ID}{ID for Loan Theme}
#'   \item{Loan Theme Type}{Category name of type of loan}
#'   \item{Partner ID}{Unique ID for field partners}
#' }
#'
#'
#' \describe{
#'   \item{Field Partner Name}{No description provided.}
#'   \item{sector}{No description provided.}
#'   \item{Loan Theme ID}{No description provided.}
#'   \item{Loan Theme Type}{No description provided.}
#'   \item{country}{No description provided.}
#'   \item{forkiva}{No description provided.}
#'   \item{region}{No description provided.}
#'   \item{geocode_old}{No description provided.}
#'   \item{ISO}{No description provided.}
#'   \item{number}{No description provided.}
#'   \item{amount}{No description provided.}
#'   \item{LocationName}{No description provided.}
#'   \item{geocode}{No description provided.}
#'   \item{names}{No description provided.}
#'   \item{geo}{No description provided.}
#'   \item{lat}{No description provided.}
#'   \item{lon}{No description provided.}
#'   \item{mpi_region}{No description provided.}
#' }
#'
#' @details This is a merged version of the four data sets provided at Kaggle. I
#'   began with the largest dataset, loan_theme_ids, and joined the others by id
#'   to that one.  While most did ids had a match across datasets, many did not
#'   match.
#'
#'   In terms of cleanup, the 'geo' variables were removed as they were just text
#'   strings of latitude and longitude coordinates. The borrower_genders column
#'   was broken out into male and female counts.  Where possible, strings were
#'   converted to integer or date formats. Column names were made more
#'   appropriate, and rearranged to reflect conceptual information.
#'
#'   More context on the variables can be found at the links below, but specific
#'   information is sparse.
#'
#' Known issues:
#' Some character strings may have formatting issues.
#'
#'
#' @note License is CC0
#' @source  \href{https://www.kaggle.com/kiva/data-science-for-good-kiva-crowdfunding}{Data link}.
#'
#' @examples
#' library(noiris)
#' str(kiva)

"kiva"
