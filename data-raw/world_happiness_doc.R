#' World Happiness data.
#'
#' The World Happiness Report is a survey of the state of global happiness that
#' ranks countries by how happy their citizens perceive themselves to be. Almost
#' all the information here is gleaned from the report and appendices.
#'
#' @format The main data frame \code{world_happiness} has 1704 rows and 18 variables:
#' \describe{
#'   \item{country}{factor with 36 levels, including the International average}
#'   \item{year}{ranges from 2008 to 2018}
#'   \item{log_gdp_per_capita}{log GDP per capita}
#'   \item{healthy_life_expectancy_at_birth}{Based on WHO}
#'   \item{social_support }{National average of the binary responses to the Gallup World Poll (GWP) question 'If you were in trouble, do you have relatives or friends you can count on to help you whenever you need them, or not?' }
#'   \item{freedom_to_make_life_choices}{ national average of responses to the GWP question "Are you satisfied or dissatisfied with your freedom to choose what you do with your life?"}
#'   \item{generosity}{ residual of regressing national average of response to the GWP question "Have you donated money to a charity in the past month?" on GDP per capita.}
#'   \item{perceptions_of_corruption}{The measure is the national average of the survey responses to two questions in the GWP: "Is corruption widespread throughout the government or not" and "Is corruption widespread within businesses or not?"}
#'   \item{positive_affect }{the average of three positive affect measures in GWP: happiness, laugh and enjoyment}
#'   \item{negative_affect }{ the average of three negative affect measures in GWP: worry, sadness and anger}
#'   \item{confidence_in_national_government }{indicator of the GWP national institutions index, which reflects citizens' confidence in key institutions prominent in a country's leadership: the military, the judicial system, the national government, and the honesty of elections}
#'   \item{democratic_quality }{dimension of governance from the Worldwide Governance Indicators (WGI) project. 'Roughly standardized'.}
#'   \item{delivery_quality }{dimension of governance from the Worldwide Governance Indicators (WGI) project. 'Roughly standardized'.}
#'   \item{gini_index_wb}{World Bank estimate of Gini coefficient of inequality}
#'   \item{happiness_score}{National average response to the question of life evaluations. The English wording of the question is 'Please imagine a ladder, with steps numbered from 0 at the bottom to 10 at the top. The top of the ladder represents the best possible life for you and the bottom of the ladder represents the worst possible life for you. On which step of the ladder would you say you personally feel you stand at this time?'.}
#'   \item{dystopia_residual}{population}
#'   }
#'
#' @details  Happiness score is the
#'
#' @note This does not contain all the information available from the report
#'   website.  Choices were made especially due to the amount of response and/or
#'   arbitrarily determined relevancy.
#' @source \href{World Happiness Report 2019 Chapter 2 Appendix 1}{https://s3.amazonaws.com/happiness-report/2019/WHR19_Ch2A_Appendix1.pdf}, \href{World Happiness Report 2019 Chapter 2 Appendix 2}{https://s3.amazonaws.com/happiness-report/2019/WHR19_Ch2A_Appendix2.pdf}
#' @seealso \link[gapminder]{gapminder}
#' @examples
#' library(noiris)
#' str(pisa)
#' pisa
#'
"pisa"
