#' Wine Reviews data
#'
#' @description Two data sets regarding wine reviews.
#'
#' @format The first is \code{wine_reviews}, a CC0 release of data obtained from
#'   Kaggle.  I combined the two data sets available there and removed
#'   duplicates.  Not every data point will have twitter info, but all will have
#'   most of the columns. The result is a data frame of more than 160 thousand
#'   rows and 13 columns.  The reviews can serve as an example for text
#'   analysis, specifically sentiment analysis.
#'   \describe{
#'   \item{country}{The country that the wine is from}
#'   \item{description}{The reviewers description of the data}
#'   \item{designation}{The vineyard within the winery where the grapes that
#'   made the wine are from}
#'   \item{points}{The number of points Wine Enthusiast rated the wine on a scale
#'   of 80-100}
#'   \item{price}{The cost for a bottle of the wine}
#'   \item{province}{The province or state that the wine is from}
#'   \item{region_1}{The wine growing area in a province or state (i.e. Napa)}
#'   \item{region_2}{Sometimes there are more specific regions specified within
#'   a wine growing area (i.e. Rutherford inside the Napa Valley)}
#'   \item{taster_name}{The reviewer's name}
#'   \item{taster_twitter_handle}{The reviewer's Twitter handle}
#'   \item{title}{The title of the wine review, which often contains the vintage
#'   if you're interested in extracting that feature.}
#'   \item{variety}{The type of grapes used to make the wine (i.e. Pinot Noir)}
#'   \item{winery}{The winery that made the wine}
#'   }
#'
#' The second data set is \code{wine_quality}, obtained from the UCI repository,
#' and the one that I use in my \href{https://m-clark.github.io/introduction-to-machine-learning/}{Introduction
#' to Machine Learning} document.  It has nearly 6500 rows and 15 columns,
#' mostly with physicochemical qualities of the wine. It can be used for
#' standard regression using the quality score, or classification for color or
#' 'good' quality.  However, more than 90\% of the scores are 5-7, so it can so
#' it can also serve as an ordinal regression example with appropriate
#' collapsing.
#'
#' \describe{
#'   \item{color}{Labels are 'red' and 'white'}
#'   \item{white}{A binary based on color. White \code{==} 1.}
#'   \item{fixed_acidity}{tartaric acid - g / dm^3}
#'   \item{volatile_acidity}{acetic acid - g / dm^3}
#'   \item{citric_acid}{g / dm^3}
#'   \item{residual_sugar}{g / dm^3}
#'   \item{chlorides}{sodium chloride - g / dm^3}
#'   \item{free_sulfur_dioxide}{mg / dm^3}
#'   \item{total_sulfur_dioxide}{mg / dm^3}
#'   \item{density}{g / cm^3}
#'   \item{pH}{pH level}
#'   \item{sulphates}{potassium sulphate - g / dm^3}
#'   \item{alcohol}{\% by volume}
#'   \item{quality}{Technically 0 (very bad) - 10 (excellent), but actual scores
#'   are from 3 to 9}
#'   \item{good}{Quality scores of 6 or greater. Labels are 'Good' and 'Bad'}
#'   }
#'
#' @references \code{wine_reviews}:
#'\href{https://www.kaggle.com/zynicide/wine-reviews}{Kaggle}
#'
#'\code{wine_quality}: P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis.
#'Modeling wine preferences by data mining from physicochemical properties. In
#'Decision Support Systems, Elsevier, 47(4):547-553, 2009.
#'\href{http://dx.doi.org/10.1016/j.dss.2009.05.016}{link};
#'\href{https://archive.ics.uci.edu/ml/datasets/Wine+Quality}{UCI Link}
#'
#' @aliases wine_quality
#'
#' @examples
#' library(noiris)
#' str(wine_reviews)
#' str(wine_quality)
#'
'wine_reviews'
