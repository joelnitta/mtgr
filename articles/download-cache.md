# Downloading files and using the cache

One of the main purposes of `mtgr` is to obtain data about drafts from
[17lands.com](https://17lands.com). These typically come in the form of
rather large, compressed CSV files. `mtgr` helps you maintain these
files by storing them in a folder referred to as the “cache”.

Let’s see how to use this feature.

## Location of the cache

``` r
library(mtgr)
```

The location of the cache defaults to a location specific to your OS
that is designated for storing files related to this package. You can
see where this is located like this:

``` r
mr_cache_dir()
#> [1] "/home/runner/.local/share/R/mtgr"
```

Notice that the exact path will differ based on your computer setup.

You can check the current contents of the cache like so:

``` r
list.files(mr_cache_dir())
#> character(0)
```

## Downloading files to the cache

By default, datasets from [17lands](https://17lands.com) will be
downloaded to the cache.

Here, let’s download *Khans of Tarkir* game data for Premier Draft to
the cache.

``` r
mr_download_17lands_file(set = "KTK", data_type = "game", event_type = "premier")
#> ℹ Starting download
#> ✔ Data downloaded to /home/runner/.local/share/R/mtgr/game_data_public.KTK.PremierDraft.csv.gz
#> /home/runner/.local/share/R/mtgr/game_data_public.KTK.PremierDraft.csv.gz
list.files(mr_cache_dir())
#> [1] "game_data_public.KTK.PremierDraft.csv.gz"
```

If you prefer to store the files in a folder of your choosing, you can
do that with the `cache_dir` argument:

``` r
mr_download_17lands_file(
  set = "KTK", data_type = "game", event_type = "premier",
  cache_dir = tempdir())
#> ℹ Starting download
#> ✔ Data downloaded to /tmp/RtmppSQq2c/game_data_public.KTK.PremierDraft.csv.gz
#> /tmp/RtmppSQq2c/game_data_public.KTK.PremierDraft.csv.gz
```

You can also change the default location of the cache using the
`mr_cache` option:

``` r
# (save any existing settings first)
old_cache_setting <- getOption("mr_cache")

# Change location of cache to temporary directory
options(mr_cache = tempdir())
mr_cache_dir()
#> [1] "/tmp/RtmppSQq2c"

# restore existing settings
options(mr_cache = old_cache_setting)
```

This way, you don’t have to specify it each time you call a function
that uses the cache.

If you want to use this approach, it is recommended to include the call
to [`options()`](https://rdrr.io/r/base/options.html) at the top of your
script or in your `.Rprofile`.

## Cached files won’t be re-downloaded

The whole point of having a cache is to avoid re-downloading files. So
if we run
[`mr_download_17lands_file()`](../reference/mr_download_17lands_file.md)
for the same dataset again, it will just return the path to the existing
file instead of re-downloading it (you should notice the command runs
almost instantaneously this time, whereas the first time it took several
seconds to download).

``` r
mr_download_17lands_file(set = "KTK", data_type = "game", event_type = "premier")
#> /home/runner/.local/share/R/mtgr/game_data_public.KTK.PremierDraft.csv.gz
```

However, sometimes new data may be available and you **do** want to
re-download. In that case, set `overwrite = TRUE` to re-download and
overwite the existing file:

``` r
mr_download_17lands_file(
  set = "KTK", data_type = "game", event_type = "premier",
  overwrite = TRUE)
#> ℹ Existing file detected, deleting
#> ✔ /home/runner/.local/share/R/mtgr/game_data_public.KTK.PremierDraft.csv.gz deleted
#> ℹ Starting download
#> ✔ Data downloaded to /home/runner/.local/share/R/mtgr/game_data_public.KTK.PremierDraft.csv.gz
#> /home/runner/.local/share/R/mtgr/game_data_public.KTK.PremierDraft.csv.gz
```

## Files are downloaded automatically when loading into R

The
[`mr_download_17lands_file()`](../reference/mr_download_17lands_file.md)
function is user-facing, but if your goal is to load the data directly
into R (which is most likely the case!), you can skip this function and
use [`mr_get_17lands_data()`](../reference/mr_get_17lands_data.md)
instead. [`mr_get_17lands_data()`](../reference/mr_get_17lands_data.md)
will download the necessary data file for you first, then load it. And
of course it will use the cached file if one is available.

``` r
ktk <- mr_get_17lands_data(set = "KTK", data_type = "game", event_type = "premier")
#> ℹ Loading data
#> ✔ Data loaded

# The dataset is large, so just print out part of it
dim(ktk)
#> [1] 212170   1290
ktk[1:6, 1:6]
#>    expansion   event_type                         draft_id          draft_time
#>       <char>       <char>                           <char>              <POSc>
#> 1:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595 2023-12-12 17:12:56
#> 2:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595 2023-12-12 17:12:56
#> 3:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595 2023-12-12 17:12:56
#> 4:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595 2023-12-12 17:12:56
#> 5:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595 2023-12-12 17:12:56
#> 6:       KTK PremierDraft e794b242c5bb4570a728c8f05bdc5595 2023-12-12 17:12:56
#>              game_time build_index
#>                 <POSc>       <int>
#> 1: 2023-12-12 17:42:14           0
#> 2: 2023-12-12 17:46:29           0
#> 3: 2023-12-12 17:53:05           0
#> 4: 2023-12-12 18:05:30           0
#> 5: 2023-12-12 18:10:20           1
#> 6: 2023-12-12 18:12:33           1
```

## Coming soon

I plan to add more functionality to see what is in the cache and clear
it out or update the files etc.
