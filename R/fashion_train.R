#' Fashion MNIST data.
#'
#' From the Kaggle entry: Fashion-MNIST is a dataset of Zalando's article images
#' consisting of a training set of 60,000 examples (\code{fashion_train})and a
#' test set of 10,000 examples (\code{fashion_test}). Each example is a 28x28
#' grayscale image, associated with a label from 10 classes. Zalando intends
#' Fashion-MNIST to serve as a direct drop-in replacement for the original MNIST
#' dataset for benchmarking machine learning algorithms. It shares the same
#' image size and structure of training and testing splits.
#'
#' @format A standard data frame with the following columns:
#'
#' \describe{
#'   \item{label}{Image label. See details.}
#'   \item{pixel1:pixel784}{Grayscale value 0-255}
#'   }
#'
#' @details Basically this provides some entry level image classification that
#'   is a little more interesting than handwritten digits. Each image is 28
#'   pixels in height and 28 pixels in width, for a total of 784 pixels in total
#'   when 'unrolled'. Each pixel has a single value associated with it (integer
#'   between 0 and 255), indicating the lightness or darkness of that pixel,
#'   with higher numbers meaning darker. The link below has downloadable image
#'   files. The labels are as follows:
#'
#' \describe{
#'   \item{0}{T-shirt/top}
#'   \item{1}{Trouser}
#'   \item{2}{Pullover}
#'   \item{3}{Dress}
#'   \item{4}{Coat}
#'   \item{5}{Sandal}
#'   \item{6}{Shirt}
#'   \item{7}{Sneaker}
#'   \item{8}{Bag}
#'   \item{9}{Ankle boot}
#'   }
#'
#'
#'
#' @aliases fashion_test
#' @source  Data set and info:
#'   \url{https://www.kaggle.com/zalando-research/fashionmnist/version/4}.  More
#'   detail can be found at the
#'   \href{https://github.com/zalandoresearch/fashion-mnist}{GitHub repo}.
#' @note License: The MIT License (MIT) Copyright © [2017] Zalando SE, https://tech.zalando.com
#' @examples
#' library(noiris)
#' str(fashion_train)
#' str(fashion_test)

"fashion_train"
