#' Column names and types in replay data
#'
#' @format ## `replay_cols`
#' A dataframe (tibble) describing columns in 17lands replay data
#' (`data_type = "replay"`).
#' 
#' Columns:
#' \describe{
#'   \item{regex}{Regular expression to match a column in the replay data}
#'   \item{py_type}{Data type used by python for that column}
#'   \item{arrow}{Data type used by arrow for that column}
#'   ...
#' }
#' @source <https://www.17lands.com/public_datasets>
"replay_cols"