#' Check the location of the cache
#'
#' To change the default location of the cache, use option `mr_cache`
#' (see Examples).
#'
#' @param dir directory to be used as the cache directory
#' @details This function is intended to be called internally with no
#' arguments. It will use the default
#' location returned by [tools::R_user_dir] for the application,
#' `mtgr`. This function will also
#' create the directory if it does not yet exist.
#' @export
#' @examples
#' # Default cache directory
#' mr_cache_dir()
#' # Specify a custom cache directory
#' # (save any existing settings first)
#' old_cache_setting <- getOption("mr_cache")
#' options(mr_cache = tempdir())
#' mr_cache_dir()
#' # restore existing settings
#' options(mr_cache = old_cache_setting)
mr_cache_dir <- function(
  dir = getOption("mr_cache", default = tools::R_user_dir("mtgr"))) {
  if (!fs::dir_exists(dir)) fs::dir_create(dir)
  dir
}
