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

#' Create an arrow schema for 17lands data
#'
#' Not all sets are available. To see the
#' available files, visit <https://www.17lands.com/public_datasets>.
#'
#' Currently only works for 'replay' data.
#'
#' @inheritParams mr_get_17lands_data
#' @autoglobal
#' @return Character vector
#' @export
#' @examples
#' mr_make_17lands_schema("KTK", "replay", "premier")
mr_make_17lands_schema <- function(
  set, data_type, event_type,
  use_cache = TRUE,
  overwrite = FALSE,
  cache_dir = mr_cache_dir(),
  quiet = FALSE) {

  # Checks
  require_namespace("arrow")

  assertthat::assert_that(
    assertthat::is.string(data_type)
  )
  assertthat::assert_that(
    data_type == "replay",
    msg = paste(
      "`mr_make_17lands_schema()` currently only supports",
      "'replay' for `data_type`"
    )
  )

  # Get column names
  replay_col_names <- mr_get_17lands_cols(
    set = set, data_type = data_type, event_type = event_type,
    use_cache = use_cache,
    overwrite = overwrite,
    cache_dir = cache_dir,
    quiet = quiet
  )

  # Set up arrow schema
  schema_arguments <-
    data.frame(replay_col_name = replay_col_names) |>
    fuzzyjoin::regex_left_join(
      dplyr::select(replay_cols, regex, arrow_type),
      by = c(replay_col_name = "regex")
    )

  assertthat::assert_that(
    assertthat::noNA(schema_arguments$arrow_type),
    is_unique(schema_arguments$replay_col_name)
  )

  schema_arguments <-
    schema_arguments |>
    dplyr::select(replay_col_name, arrow_type) |>
    dplyr::mutate(
      schema_arguments = glue::glue(
        "`{replay_col_name}` = arrow::{arrow_type}()")) |>
    dplyr::pull(schema_arguments) |>
    paste(collapse = ", ")

  eval(parse(text = glue::glue("arrow::schema ({schema_arguments})")))
}

#' Open a dataset in arrow format
#'
#' Since the replay datasets are so large (often > 1 million rows x thousands
#' of columns), they cannot be read into R directly. It works better to keep
#' the data out of memory and only load the necessary parts. This function
#' provides the capability to do this using the {arrow} package.
#'
#' Not all sets are available. To see the
#' available files, visit <https://www.17lands.com/public_datasets>.
#'
#' Currently only works for 'replay' data.
#'
#' @inheritParams mr_get_17lands_data
#' @return Character vector
#' @export
#' @examples
#' # See what happened on user's turn 1 for all KTK games
#' library(dplyr)
#' ktk_replay <- mr_open_17lands_arrow("KTK", "replay", "premier")
#' ktk_turn_1 <- ktk_replay |>
#'   select(
#'     draft_id, game_number, contains("user_turn_1_")) |>
#'   collect()
mr_open_17lands_arrow <- function(set, data_type, event_type,
  use_cache = TRUE,
  overwrite = FALSE,
  cache_dir = mr_cache_dir(),
  quiet = FALSE) {

  require_namespace("arrow")

  replay_file <- mr_download_17lands_file(
    set = set, data_type = data_type, event_type = event_type,
    use_cache = use_cache,
    overwrite = overwrite,
    cache_dir = cache_dir,
    quiet = quiet
  )

  replay_schema <- mr_make_17lands_schema(
    set = set, data_type = data_type, event_type = event_type,
    use_cache = use_cache,
    overwrite = overwrite,
    cache_dir = cache_dir,
    quiet = quiet)

  arrow::open_csv_dataset(replay_file, schema = replay_schema, skip = 1)

}
