#' 25 Personality items representing 5 factors
#'
#' From the original helpfile: 25 personality self report items taken from the
#' International Personality Item Pool (ipip.ori.org) were included as part of
#' the Synthetic Aperture Personality Assessment (SAPA) web based personality
#' assessment project. The data from 2800 subjects are included here as a
#' demonstration set for scale construction, factor analysis, and Item Response
#' Theory analysis. Three additional demographic variables (sex, education, and
#' age) are also included.
#'
#' @format The data are from 2800 subjects.
#'
#' \describe{
#'   \item{A1:}{Am indifferent to the feelings of others. (q_146)}
#'   \item{A2:}{Inquire about others' well-being. (q_1162)}
#'   \item{A3:}{Know how to comfort others. (q_1206)}
#'   \item{A4:}{Love children. (q_1364)}
#'   \item{A5:}{Make people feel at ease. (q_1419)}
#'   \item{C1:}{Am exacting in my work. (q_124)}
#'   \item{C2:}{Continue until everything is perfect. (q_530)}
#'   \item{C3:}{Do things according to a plan. (q_619)}
#'   \item{C4:}{Do things in a half-way manner. (q_626)}
#'   \item{C5:}{Waste my time. (q_1949)}
#'   \item{E1:}{Don't talk a lot. (q_712)}
#'   \item{E2:}{Find it difficult to approach others. (q_901)}
#'   \item{E3:}{Know how to captivate people. (q_1205)}
#'   \item{E4:}{Make friends easily. (q_1410)}
#'   \item{E5:}{Take charge. (q_1768)}
#'   \item{N1:}{Get angry easily. (q_952)}
#'   \item{N2:}{Get irritated easily. (q_974)}
#'   \item{N3:}{Have frequent mood swings. (q_1099)}
#'   \item{N4:}{Often feel blue. (q_1479)}
#'   \item{N5:}{Panic easily. (q_1505)}
#'   \item{O1:}{Am full of ideas. (q_128)}
#'   \item{O2:}{Avoid difficult reading material.(q_316)}
#'   \item{O3:}{Carry the conversation to a higher level. (q_492)}
#'   \item{O4:}{Spend time reflecting on things. (q_1738)}
#'   \item{O5:}{Will not probe deeply into a subject. (q_1964)}
#'   \item{gender}{male or female}
#'   \item{education}{HS, finished HS, some college, college graduate, graduate degree.}
#'   \item{age}{age in years}
#' }
#'
#'
#' @details The data regards the 'Big 5' Personality traits- agreeableness,
#'   openness, extraversion, neuroticism, and conscientiousness. The items are
#'   based on a 6 point response scale: 1 Very Inaccurate 2 Moderately
#'   Inaccurate 3 Slightly Inaccurate 4 Slightly Accurate 5 Moderately Accurate
#'   6 Very Accurate. This is the same as the \code{bfi} data set in the
#'   \code{psych} package, except with reverse coded items already reversed as
#'   they would need to be for scoring purposes.  More details can be found at
#'   the \code{\link[psych]{bfi}} help file.
#'
#' @seealso \code{\link[psych]{bfi}}
#' @references
#' Goldberg, L.R. (1999) A broad-bandwidth, public domain, personality inventory measuring the lower-level facets of several five-factor models. In Mervielde, I. and Deary, I. and De Fruyt, F. and Ostendorf, F. (eds) Personality psychology in Europe. 7. Tilburg University Press. Tilburg, The Netherlands.
#' Revelle, W., Wilt, J., and Rosenthal, A. (2010) Individual Differences in Cognition: New Methods for examining the Personality-Cognition Link In Gruszka, A. and Matthews, G. and Szymura, B. (Eds.) Handbook of Individual Differences in Cognition: Attention, Memory and Executive Control, Springer.
#' Revelle, W, Condon, D.M., Wilt, J., French, J.A., Brown, A., and Elleman, L.G. (2016) Web and phone based data collection using planned missing designs. In Fielding, N.G., Lee, R.M. and Blank, G. (Eds). SAGE Handbook of Online Research Methods (2nd Ed), Sage Publcations.
#'
#' @examples
#' library(noiris)
#' str(big_five)
#'
"big_five"
