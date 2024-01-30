
<!-- README.md is generated from README.Rmd. Please edit that file -->

# magicr

<!-- badges: start -->
<!-- badges: end -->

The goal of `magicr` is to enable analysis of *Magic: The Gathering*
data in R.

This package is in **early development**: functionality is likely to
change!

## Installation

You can install the development version of `magicr` like so:

``` r
remotes::install_github("joelnitta/magicr")
```

## Example

Download some draft game data for *Khans of Tarkir* from
[17lands.com](https://www.17lands.com)

``` r
library(magicr)
mr_get_17lands_data(
  "KTK", "game", "premier",
  # only load a small portion of the data for this demo
  nrows = 10, select = 1:8)
#> ℹ Loading data
#> ✔ Data loaded
#>     expansion   event_type                         draft_id          draft_time
#>  1:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595 2023-12-12 17:12:56
#>  2:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595 2023-12-12 17:12:56
#>  3:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595 2023-12-12 17:12:56
#>  4:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595 2023-12-12 17:12:56
#>  5:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595 2023-12-12 17:12:56
#>  6:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595 2023-12-12 17:12:56
#>  7:       KTK PremierDraft 3a191c3e78b040fba7b5962c3552122b 2023-12-12 18:16:29
#>  8:       KTK PremierDraft 3a191c3e78b040fba7b5962c3552122b 2023-12-12 18:16:29
#>  9:       KTK PremierDraft 3a191c3e78b040fba7b5962c3552122b 2023-12-12 18:16:29
#> 10:       KTK PremierDraft 782e4b7d9e664decbb94e0751b3efe60 2023-12-13 02:32:16
#>               game_time build_index match_number game_number
#>  1: 2023-12-12 17:42:14           0            1           1
#>  2: 2023-12-12 17:46:29           0            2           1
#>  3: 2023-12-12 17:53:05           0            3           1
#>  4: 2023-12-12 18:05:30           0            4           1
#>  5: 2023-12-12 18:10:20           1            5           1
#>  6: 2023-12-12 18:12:33           1            6           1
#>  7: 2023-12-12 18:39:34           0            1           1
#>  8: 2023-12-12 18:44:28           0            2           1
#>  9: 2023-12-12 18:48:19           0            3           1
#> 10: 2023-12-13 03:03:54           0            1           1
```

## Copyright Notice

`magicr` may include unofficial Fan Content permitted under the [Wizards
of the Coast Fan Content
Policy](https://company.wizards.com/en/legal/fancontentpolicy). Any
literal and graphical information presented via this package and its
documentation pages about *Magic: The Gathering*, including card images,
the mana symbols, and Oracle text, is copyright of Wizards of the Coast,
LLC, a subsidiary of Hasbro, Inc. This software is not produced by,
endorsed by, supported by, or affiliated with Wizards of the Coast, LLC
or [17lands](https://www.17lands.com).

## License

[MIT](LICENSE)
