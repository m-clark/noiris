#' Gender gap data
#'
#' From the World Bank description: The Global Gender Gap Index examines the gap
#' between men and women in four fundamental categories (subindexes) and 14
#' different indicators that compose them. The subindexes are Economic
#' Participation and Opportunity, Educational Attainment, Health and Survival
#' and Political Empowerment. The highest possible score is 1 (equality) and the
#' lowest possible score is 0 (inequality).
#'
#' @format Two data frames. The first regards just the gender gap indices.
#'   There is more data for this for most countries, potentially starting as far
#'   back as 2006.  The second data set has only 2018 data but more indicators.
#'
#' \describe{
#'   \item{country_iso3}{Country ISO code}
#'   \item{country_name}{Country Name}
#'   \item{year}{}
#'   \item{global_gender_gap_economic_participation_and_opportunity_subindex}{This
#'   subindex contains three concepts: the participation gap, the remuneration
#'   gap and the advancement gap.}
#'   \item{overall_global_gender_gap_index}{The Global Gender Gap Index examines
#'   the gap between men and women across four fundamental categories.}
#'   \item{global_gender_gap_educational_attainment_subindex}{This subindex
#'   captures the gap between women’s and men’s current access to education
#'   through ratios of women to men in primary-, secondary- and tertiary-level
#'   education.}
#'   \item{global_gender_gap_health_and_survival_subindex}{This subindex
#'   provides an overview of the differences between women’s and men’s health.}
#'   \item{global_gender_gap_political_empowerment_subindex}{This subindex
#'   measures the gap between men and women at the highest level of political
#'   decision-making through the ratio of women to men in ministerial positions
#'   and the ratio of women to men in parliamentary positions.}
#'   \item{healthy_life_expectancy}{Average number of years that a person can
#'   expect to live in full health, calculated by taking into account years
#'   lived in less than full health due to disease and/or injury.}
#'   \item{labour_force_participation}{Measures the proportion of a country’s
#'   working-age population that engages actively in the labor market, either
#'   by working or looking for work.}
#'   \item{legislators_senior_officials_and_managers}{The ratio of women to men
#'   employed in senior roles.}
#'   \item{literacy_rate}{Percentage of the population aged 15 and over with the
#'   ability to both read and write and make simple arithmetic calculations.}
#'   \item{professional_and_technical_workers}{The ratio of women to men
#'   employed in professional and technical roles.}
#'   \item{sex_ratio_at_birth}{Refers to the number of boys born alive per 100
#'   girls born alive. Data is converted to a female-over-male value.
#'   Biologically, this ratio should vary little and female births should be
#'   about 94.4\% of male births.}
#'   \item{women_in_ministerial_positions}{Percentage of women holding
#'   ministerial portfolios.}
#'   \item{women_in_parliament}{Percentage of women holding parliamentary seats.
#'   In instances where a parliamentary system is bicameral, the figure used is
#'   the one for the lower house.}
#'   \item{years_with_female_head_of_state_last_50}{The number of years in the
#'   past fifty-year period for which a woman has held a post equivalent to an
#'   elected head of state or head of government in the country.}
#'   }
#' @details More details on the variables can be found at the links below.
#'
#'
#'
#'
#' @aliases gender_gap_2018
#' @source  \href{https://tcdata360.worldbank.org/indicators/af52ebe9?country=VIR&indicator=27959&countries=BRA&viz=line_chart&years=2006,2018}{Data link}.
#' \href{http://reports.weforum.org/global-gender-gap-report-2018/measuring-the-global-gender-gap/}{Information on construction of the scale}.
#' \href{http://reports.weforum.org/global-gender-gap-report-2018/users-guide/}{Information on Subindices}.
#'
#' @examples
#' library(noiris)
#' str(gender_gap)
#' str(gender_gap_2018)

"gender_gap"
