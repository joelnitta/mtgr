#' Get column names of a 17lands data file
#'
#' Not all sets or combinations of data types are available. To see the
#' available files, visit <https://www.17lands.com/public_datasets>.
#'
#' @inheritParams mr_get_17lands_data
#' @return Character vector
#' @export
#' @examples
#' mr_get_17lands_cols("KTK", "game", "premier")
mr_get_17lands_cols <- function(
  set, data_type, event_type,
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
  colnames(
    readr::read_csv(
    file = file_path, n_max = 1, show_col_types = FALSE)
  )
}
