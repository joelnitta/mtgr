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
