# Open a dataset in arrow format

Since the replay datasets are so large (often \> 1 million rows x
thousands of columns), they cannot be read into R directly. It works
better to keep the data out of memory and only load the necessary parts.
This function provides the capability to do this using the arrow
package.

## Usage

``` r
mr_open_17lands_arrow(
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

Character vector

## Details

Not all sets are available. To see the available files, visit
<https://www.17lands.com/public_datasets>.

Currently only works for 'replay' data.

## Examples

``` r
# See what happened on user's turn 1 for all KTK games
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union
ktk_replay <- mr_open_17lands_arrow("KTK", "replay", "premier")
ktk_turn_1 <- ktk_replay |>
  select(
    draft_id, game_number, contains("user_turn_1_")) |>
  collect()
```
