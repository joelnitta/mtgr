#' Get a list of Magic the Gathering sets
#'
#' Print a dataframe of expansion set codes and names.
#'
#' Only includes expansion sets that have already been released.
#' For access to complete set data, see scryr::scry_sets().
#' Not all sets have data available on 17lands.
#'
#' @return Dataframe
#' @export
#' @examples
#' mr_get_sets()
mr_get_sets <- function() {
  data <- scryr::scry_sets()
  data <- data[data$set_type == "expansion", ]
  data <- data[data$released_at <= Sys.Date(), ]
  data <- data[, c("code", "name")]
  data$code <- toupper(data$code)
  data
}
