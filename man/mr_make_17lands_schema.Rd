% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mr_open_17lands_arrow.R
\name{mr_make_17lands_schema}
\alias{mr_make_17lands_schema}
\title{Create an arrow schema for 17lands data}
\usage{
mr_make_17lands_schema(
  set,
  data_type,
  event_type,
  use_cache = TRUE,
  overwrite = FALSE,
  cache_dir = mr_cache_dir(),
  quiet = FALSE
)
}
\arguments{
\item{set}{Three-letter set code. Not case-sensitive. For a complete list of
set names and codes, run \code{mr_get_sets()} (not all sets are available on
17lands).}

\item{data_type}{Type of data. Must be one of "game", "draft", or "replay".}

\item{event_type}{Type of event. Must be one of "premier", "traditional",
"sealed", or "quick". Not all formats are available for all event types (in
particular, Quick Draft is only available for one set at the time of
writing).}

\item{use_cache}{Logical; should the cache be used?}

\item{overwrite}{Logical: should any existing file be overwritten?}

\item{cache_dir}{Path to the folder used for caching data.}

\item{quiet}{Logical: should messages emitted by this function be silenced?}
}
\value{
Character vector
}
\description{
Not all sets are available. To see the
available files, visit \url{https://www.17lands.com/public_datasets}.
}
\details{
Currently only works for 'replay' data.
}
\examples{
mr_make_17lands_schema("KTK", "replay", "premier")
}
