# Get 17lands data

Download data from 17lands and load it into R.

## Usage

``` r
mr_get_17lands_data(
  set,
  data_type,
  event_type,
  nrows = Inf,
  skip = "__auto__",
  select = NULL,
  drop = NULL,
  n_threads = data.table::getDTthreads(),
  use_cache = TRUE,
  overwrite = FALSE,
  cache_dir = mr_cache_dir(),
  quiet = FALSE
)
```

## Arguments

- set:

  Three-letter set code. Not case-sensitive. For a complete list of set
  names and codes, run [`mr_get_sets()`](mr_get_sets.md) (not all sets
  are available on 17lands).

- data_type:

  Type of data. Must be one of "game", "draft", or "replay".

- event_type:

  Type of event. Must be one of "premier", "traditional", "sealed", or
  "quick". Not all formats are available for all event types (in
  particular, Quick Draft is only available for one set at the time of
  writing).

- nrows:

  Number of rows to load.

- skip:

  Number of rows to skip from top before loading data.

- select:

  A vector of column names or numbers to keep; drops the rest.

- drop:

  Vector of column names or numbers to drop; keeps the rest.

- n_threads:

  The number of threads to use.

- use_cache:

  Logical; should the cache be used?

- overwrite:

  Logical: should any existing file be overwritten?

- cache_dir:

  Path to the folder used for caching data.

- quiet:

  Logical: should messages emitted by this function be silenced?

## Value

Dataframe

## Details

Not all sets or combinations of data types are available. To see the
available files, visit <https://www.17lands.com/public_datasets>.

Arguments `nrows`, `skip`, `select`, `drop`, and `n_threads` are passed
to
[`data.table::fread()`](https://rdatatable.gitlab.io/data.table/reference/fread.html);
for details, run `?data.table::fread()`.

Arguments `use_cache`, `clear_cache`, and `cache_dir` are used to
control the cache. This can save time if you need to load the same data
more than once. By setting `use_cache = TRUE`, data will be loaded from
any existing downloaded file instead of downloading it again. If you
suspect the data on 17lands has been recently updated and want to use
it, you should set `overwrite = TRUE` to overwrite any previously
downloaded file with the new one.

## Examples

``` r
mr_get_17lands_data("KTK", "game", "premier", select = 1:3)
#> ℹ Loading data
#> ✔ Data loaded
#>         expansion   event_type                         draft_id
#>            <char>       <char>                           <char>
#>      1:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595
#>      2:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595
#>      3:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595
#>      4:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595
#>      5:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595
#>     ---                                                        
#> 212166:       KTK PremierDraft 2e55454d8fcd4c338d0a15f7671de34c
#> 212167:       KTK PremierDraft 8557025b51d0482a92f3d9553a4bbe4f
#> 212168:       KTK PremierDraft 8557025b51d0482a92f3d9553a4bbe4f
#> 212169:       KTK PremierDraft 8557025b51d0482a92f3d9553a4bbe4f
#> 212170:       KTK PremierDraft 8557025b51d0482a92f3d9553a4bbe4f
```
