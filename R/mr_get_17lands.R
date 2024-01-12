#' Get URL for 17lands data
#'
#' Internal function
#'
#' @param set Set abbreviation or name.
#' @param data_type Type of data. Must be one of "game", "draft", or "replay".
#' @param event_type Type of event. Must be one of "premier", "traditional",
#' "sealed", or "quick". Not all formats are available for all event types (in
#' particular, Quick Draft is only available for one set at the time of
#' writing).
#' @return Character
#' @noRd
# https://17lands-public.s3.amazonaws.com/analysis_data/
# draft_data/draft_data_public.KTK.PremierDraft.csv.gz
get_17lands_url <- function(set, data_type, event_type) {
  base_url <- paste0(
      "https://17lands-public.s3.amazonaws.com/analysis_data/",
      "%s_data/%s_data_public.%s.%sDraft.csv.gz",
      collapse = "")
  event_lookup <- c("Premier", "Trad", "Sealed", "Quick")
  names(event_lookup) <- c("premier", "traditional", "sealed", "quick")
  url <- sprintf(
    base_url,
    data_type,
    data_type,
    set,
    event_lookup[event_type]
  )
  return(url)
}

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

#' Set the cache directory
#'
#' A configurable default location for persistent data storage.
#'
#' @param dir directory to be used as the cache directory
#' @details This function is intended to be called internally with no
#' arguments. It will use the default
#' location returned by [tools::R_user_dir] for the application,
#' `magicr`. This function will also
#' create the directory if it does not yet exist.
#' @export
#' @examples
#' # Default cache directory
#' mr_cache_dir()
#' # Custom cache directory (here, temporary directory)
#' mr_cache_dir(tempdir())
mr_cache_dir <- function(dir = tools::R_user_dir("magicr")) {
  if (!fs::dir_exists(dir)) fs::dir_create(dir)
  dir
}

#' Get 17lands data
#'
#' Download data from 17lands and load it into R.
#'
#' Not all sets or combinations of data types are available. To see the
#' available files, visit <https://www.17lands.com/public_datasets>.
#'
#' Arguments `nrows`, `skip`, `select`, `drop`, and `n_threads` are passed to
#' `data.table::fread()`; for details, run `?data.table::fread()`.
#'
#' Arguments `use_cache`, `clear_cache`, and `cache_dir` are used to control
#' the cache. This can save time if you need to load the same data more than
#' once. By setting `use_cache = TRUE`, data will be loaded from any
#' existing downloaded file instead of downloading it again. If you suspect
#' the data on 17lands has been recently updated and want to use it, you should
#' set `overwrite = TRUE` to overwrite any previously downloaded file with the
#' new one.
#'
#' @param set Three-letter set code. Not case-sensitive. For a complete list of
#' set names and codes, run `mr_get_sets()` (not all sets are available on
#' 17lands).
#' @param data_type Type of data. Must be one of "game", "draft", or "replay".
#' @param event_type Type of event. Must be one of "premier", "traditional",
#' "sealed", or "quick". Not all formats are available for all event types (in
#' particular, Quick Draft is only available for one set at the time of
#' writing).
#' @param nrows Number of rows to load.
#' @param skip Number of rows to skip from top before loading data.
#' @param select A vector of column names or numbers to keep; drops the rest.
#' @param drop Vector of column names or numbers to drop; keeps the rest.
#' @param n_threads The number of threads to use.
#' @param use_cache Logical; should the cache be used?
#' @param overwrite Logical: should any existing file be overwritten?
#' @param cache_dir Path to the folder used for caching data.
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
  n_threads = data.table::getDTthreads(),
  use_cache = TRUE,
  overwrite = FALSE,
  cache_dir = mr_cache_dir()
  ) {

  set <- toupper(set)
  event_type <- tolower(event_type)
  url <- get_17lands_url(set, data_type, event_type)
  file_name <- sub(".*/", "", url)

  if (isTRUE(use_cache)) {
    file_path <- fs::path(cache_dir, file_name)
    if (isTRUE(overwrite) && file.exists(file_path)) {
      fs::file_delete(file_path)
    }
    if (!file.exists(file_path)) {
      curl::curl_download(url, file_path, mode = "wb", quiet = FALSE)
    }
  } else {
    file_path <- url
  }

  data <- data.table::fread(
    input = file_path, nrows = nrows, skip = skip, nThread = n_threads,
    select = select, drop = drop)

  data
}