cli_alert_info_q <- function(quiet, ...) {
  if (!quiet) {
    cli::cli_alert_info(...)
  }
}

cli_alert_success_q <- function(quiet, ...) {
  if (!quiet) {
    cli::cli_alert_success(...)
  }
}