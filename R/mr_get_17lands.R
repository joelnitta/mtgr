#' Get URL for 17lands data
#'
#' Internal function
#'
#' @param set Set abbreviation or name. If name, can be a partial but must
#' match exactly to a single set name. Not case-sensitive.
#' @param data_type Type of data. Must be one of "game", "draft", or "replay".
#' @param event_type Type of event. Must be one of "premier", "traditional",
#' or "sealed".
#' @return Character
#' @noRd
get_17lands_url <- function(set, data_type, event_type) {
  base_url_old <- paste0(
      "https://17lands-public.s3.amazonaws.com/analysis_data/",
      "%s_data/%s-data.%s.%sDraft.tar.gz",
      collapse = "")
  base_url_new <- paste0(
      "https://17lands-public.s3.amazonaws.com/analysis_data/",
      "%s_data/%s_data_public.%s.%sDraft.csv.gz",
      collapse = "")
  old_sets <- c("VOW", "MID", "AFR", "STX", "KHM")
  event_lookup <- c("Premier", "Trad", "Sealed")
  names(event_lookup) <- c("premier", "traditional", "sealed")
  if (set %in% old_sets) {
    url <- sprintf(
      base_url_old,
      data_type,
      data_type,
      set,
      event_lookup[event_type]
    )
  } else {
    url <- sprintf(
      base_url_new,
      data_type,
      data_type,
      set,
      event_lookup[event_type]
    )
  }
  return(url)
}

#' Get 17lands data
#'
#' Print a dataframe of expansion set codes and names.
#'
#' Only includes expansion sets that have already been released.
#' For access to complete set data, see scryr::scry_sets().
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

#' Get 17lands data
#'
#' Download data from 17lands and load it into R
#'
#' Arguments `nrows`, `skip`, `select`, `drop`, and `n_threads` are passed to
#' data.table::fread(); for details, see `?data.table::fread()`.
#'
#' @param set Set abbreviation. Not case-sensitive. For a list of all set
#' abbreviations, run mr_get_sets(). Not all sets are available on 17lands.
#' @param data_type Type of data. Must be one of "game", "draft", or "replay".
#' @param event_type Type of event. Must be one of "premier", "traditional",
#' or "sealed".
#' @param nrows Number of rows to load.
#' @param skip Number of rows to skip from top before loading data.
#' @param select A vector of column names or numbers to keep; drops the rest.
#' @param drop Vector of column names or numbers to drop; keeps the rest.
#' @param n_threads The number of threads to use.
#'
#' @return Dataframe
#' @export
#' @examples
#' mr_get_17lands_data("KTK", "game", "premier")
mr_get_17lands_data <- function(
  set, data_type, event_type,
  nrows = Inf,
  skip = "__auto__",
  select = NULL,
  drop = NULL,
  n_threads = data.table::getDTthreads()) {
  set <- toupper(set)
  url <- get_17lands_url(set, data_type, event_type)
  data <- data.table::fread(
    input = url, nrows = nrows, skip = skip, nThread = n_threads,
    select = select, drop = drop)
  data
}