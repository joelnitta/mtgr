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