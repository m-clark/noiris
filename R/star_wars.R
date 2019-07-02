#' Star Wars data
#' @description Star Wars data.
#'
#'
#' @format Lots of data frames regarding the first seven films of the Star Wars franchise.
#' \describe{
#'   \item{star_wars}{A list of the raw pull from the Star Wars API.}
#'   \item{films}{Name, opening crawl, director and lists of characters, planets, etc.}
#'   \item{people}{Name, height, mass, hair color, films, etc.}
#'   \item{species}{Name, classification, designation, average lifespan, etc.}
#'   \item{planets}{Name, rotation period, orbital period diameter, population, residents, etc.}
#'   \item{starships}{Name, model, manufacturer, hyperdrive rating, etc.}
#'   \item{vehicles}{Name, model, manufacturer, cost, cargo capacity, etc.}
#'   }
#'
#' Each has a corresponding vector of just the observation names.
#' \describe{
#'   \item{films_names}{}
#'   \item{people_names}{}
#'   \item{species_names}{}
#'   \item{planets_names}{}
#'   \item{starships_names}{}
#'   \item{vehicles_names}{}
#'   }
#'
#' @details All of this data is collected via \link[rwars]{rwars} and the Star
#'   Wars API. Unfortunately it stops after the first Disney movie and so is
#'   woefully incomplete, but that is an issue with the API itself and not the
#'   \link[rwars]{rwars} package.  The data has been cleaned up to be more
#'   usable, but may have some kinks to sort out still.
#'
#'   All the data sets are \link[tibble]{tibble} class objects.
#'
#' @source \url{https://swapi.co/}
#' @seealso \link[rwars]{rwars}
#' @examples
#' library(noiris)
#' data(planets)
#' planets
#'
#' @aliases films films_names people people_names planets planets_names species
#'   species_names starships starships_names vehicles vehicles_names


"star_wars"
