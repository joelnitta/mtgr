cli_alert_info_q <- function(...) {
  quiet <- mget("quiet", envir = parent.frame(), ifnotfound = FALSE)[[1]]
  if (!quiet) {
    cli::cli_alert_info(...)
  }
}

cli_alert_success_q <- function(...) {
  quiet <- mget("quiet", envir = parent.frame(), ifnotfound = FALSE)[[1]]
  if (!quiet) {
    cli::cli_alert_success(...)
  }
}

#' Check that all values in a vector are unique
#' @param x Input vector
#' @return Logical
#' @noRd
is_unique <- function(x) {
  length(x) == length(unique(x))
}
assertthat::on_failure(is_unique) <- function(call, env) {
  paste0(deparse(call$x), " is not unique")
}

#' Check that a package is installed, and issue a warning if not
#' @param pkg Name of package
#' @return Logical
#' @noRd
require_namespace <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
      stop(
        glue::glue(
          "Package '{pkg}' is required for this function. \\
          Please install it using `install.packages('{pkg}')`."
        )
      )
    }
  invisible()
}

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
