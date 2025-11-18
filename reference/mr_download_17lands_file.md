# Download a 17lands data file

Not all sets or combinations of data types are available. To see the
available files, visit <https://www.17lands.com/public_datasets>.

## Usage

``` r
mr_download_17lands_file(
  set,
  data_type,
  event_type,
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

- use_cache:

  Logical; should the cache be used?

- overwrite:

  Logical: should any existing file be overwritten?

- cache_dir:

  Path to the folder used for caching data.

- quiet:

  Logical: should messages emitted by this function be silenced?

## Value

Path to data file

## Examples

``` r
mr_download_17lands_file("KTK", "game", "premier")
#> ℹ Starting download
#> ✔ Data downloaded to /home/runner/.local/share/R/mtgr/game_data_public.KTK.PremierDraft.csv.gz
#> /home/runner/.local/share/R/mtgr/game_data_public.KTK.PremierDraft.csv.gz
```
