# Check the location of the cache

To change the default location of the cache, use option `mr_cache` (see
Examples).

## Usage

``` r
mr_cache_dir(dir = getOption("mr_cache", default = tools::R_user_dir("mtgr")))
```

## Arguments

- dir:

  directory to be used as the cache directory

## Details

This function is intended to be called internally with no arguments. It
will use the default location returned by tools::R_user_dir for the
application, `mtgr`. This function will also create the directory if it
does not yet exist.

## Examples

``` r
# Default cache directory
mr_cache_dir()
#> [1] "/home/runner/.local/share/R/mtgr"
# Specify a custom cache directory
# (save any existing settings first)
old_cache_setting <- getOption("mr_cache")
options(mr_cache = tempdir())
mr_cache_dir()
#> [1] "/tmp/RtmpCjZr7h"
# restore existing settings
options(mr_cache = old_cache_setting)
```
