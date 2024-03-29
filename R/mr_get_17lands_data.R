#' Download a 17lands data file
#'
#' Not all sets or combinations of data types are available. To see the
#' available files, visit <https://www.17lands.com/public_datasets>.
#'
#' @inheritParams mr_get_17lands_data
#' @return Path to data file
#' @export
#' @examples
#' mr_download_17lands_file("KTK", "game", "premier")
mr_download_17lands_file <- function(
  set, data_type, event_type,
  use_cache = TRUE,
  overwrite = FALSE,
  cache_dir = mr_cache_dir(),
  quiet = FALSE) {

  # Checks
  assertthat::assert_that(
    assertthat::is.string(set)
  )
  assertthat::assert_that(
    assertthat::is.string(data_type)
  )
  assertthat::assert_that(
    assertthat::is.string(event_type)
  )
  assertthat::assert_that(
    assertthat::is.flag(use_cache)
  )
  assertthat::assert_that(
    assertthat::is.flag(overwrite)
  )
  assertthat::assert_that(
    assertthat::is.dir(cache_dir)
  )
  assertthat::assert_that(
    assertthat::is.flag(quiet)
  )

  set <- toupper(set)
  event_type <- tolower(event_type)
  url <- get_17lands_url(set, data_type, event_type)
  file_name <- sub(".*/", "", url)

  if (isTRUE(use_cache)) {
    file_path <- fs::path(cache_dir, file_name)
    if (isTRUE(overwrite) && file.exists(file_path)) {
      cli_alert_info_q("Existing file detected, deleting")
      fs::file_delete(file_path)
      if (!quiet) cli::cli_alert_success("{.path {file_path}} deleted")
    }
    if (!file.exists(file_path)) {
      cli_alert_info_q("Starting download")
      curl::curl_download(url, file_path, mode = "wb", quiet = quiet)
      if (!quiet) cli::cli_alert_success(
        "Data downloaded to {.path {file_path}}")
    }
  } else {
    file_path <- fs::path(tempdir(), file_name)
    cli_alert_info_q("Starting download")
    curl::curl_download(url, file_path, mode = "wb", quiet = quiet)
    cli_alert_success_q("Download successful")
  }
  file_path
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
#' @param quiet Logical: should messages emitted by this function be silenced?
#'
#' @return Dataframe
#' @export
#' @examples
#' mr_get_17lands_data("KTK", "game", "premier", select = 1:3)
mr_get_17lands_data <- function(
  set, data_type, event_type,
  nrows = Inf,
  skip = "__auto__",
  select = NULL,
  drop = NULL,
  n_threads = data.table::getDTthreads(),
  use_cache = TRUE,
  overwrite = FALSE,
  cache_dir = mr_cache_dir(),
  quiet = FALSE
  ) {

  # Download file
  file_path <- mr_download_17lands_file(
    set = set,
    event_type = event_type,
    data_type = data_type,
    use_cache = use_cache,
    overwrite = overwrite,
    cache_dir = cache_dir,
    quiet = quiet
  )

  # Load data
  cli_alert_info_q("Loading data")
  data <- data.table::fread(
    input = file_path, nrows = nrows, skip = skip, nThread = n_threads,
    select = select, drop = drop, showProgress = !quiet)
  cli_alert_success_q("Data loaded")

  data
}
