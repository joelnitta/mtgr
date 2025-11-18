# Handling large datasets with arrow

The [17lands](https://17lands.com) datasets all tend to be large, but
the game replay datasets in particular are so large that they often
cannot be loaded into R (depending on your computer’s memory).

Fortunately, the [{arrow} R package](https://arrow.apache.org/docs/r/)
can work with *external* data files, so we can use it to analyze the
game replay data, with the help of some `magicr` functions. This
vignettes shows how.

``` r
library(mtgr)
library(arrow)
# you could also just do library(tidyverse) for the next three
library(dplyr)
library(tibble)
library(tidyr)
```

## Get the data

First, let’s download a dataset of game replay data to analyze. Here,
we’ll download *Khans of Tarkir*:

``` r
ktk_file <- mr_download_17lands_file(
  set = "WOE", data_type = "replay", event_type = "premier")
#> ℹ Starting download
#> ✔ Data downloaded to /home/runner/.local/share/R/mtgr/replay_data_public.WOE.PremierDraft.csv.gz
```

The file is automatically downloaded to the cache (see
[`vignette("download-cache")`](../articles/download-cache.md) for more
details).

Let’s check the location and size of the file we just downloaded:

``` r
ktk_file
#> /home/runner/.local/share/R/mtgr/replay_data_public.WOE.PremierDraft.csv.gz
fs::file_size(ktk_file)
#> 556M
```

## Open the dataset

Next, we will *open* the dataset.

..notice I did **not** say “load”! This is an important distinction when
using {arrow}: *opening* a dataset means that we are establishing a
connection to the external file, but we are not actually loading it into
R.

To open a 17lands game-replay file, use
[`mr_open_17lands_arrow()`](../reference/mr_open_17lands_arrow.md) with
the same settings as you did above for
[`mr_download_17lands_file()`](../reference/mr_download_17lands_file.md)
(actually,
[`mr_open_17lands_arrow()`](../reference/mr_open_17lands_arrow.md) will
download the file automatically if it’s not there yet, so we could have
skipped the previous step; that was just to illustrate where the file
gets saved and to check the file size).

``` r
ktk_replay_data <- mr_open_17lands_arrow("KTK", "replay", "premier")
```

If you check the results of
[`mr_open_17lands_arrow()`](../reference/mr_open_17lands_arrow.md) by
typing `ktk_replay_data` directly, you will get a very long list of
column names and their corresponding data types, called “schema” in
{arrow} parlance (here I have truncated the output to only first 20).

``` r
ktk_replay_data
```

    #> FileSystemDataset with 1 csv file
    #> 2505 columns
    #> expansion: string
    #> event_type: string
    #> draft_id: string
    #> draft_time: string
    #> build_index: int8
    #> match_number: int8
    #> game_number: int8
    #> game_time: string
    #> rank: string
    #> opp_rank: string
    #> main_colors: string
    #> splash_colors: string
    #> on_play: bool
    #> num_mulligans: int8
    #> opp_num_mulligans: int8
    #> opp_colors: string
    #> num_turns: int8
    #> won: string

Once again, the reason that we see a schema and not the actual data is
that we have not loaded the data into R yet, we have only made a
connection to the file.

We can check the dimensions of the dataset without reading it in, by
using [`dim()`](https://rdrr.io/r/base/dim.html) as usual:

``` r
dim(ktk_replay_data)
#> [1] 212170   2505
```

That is pretty big: 212,170 rows by 2,505 columns (and KTK isn’t even
that big; last I checked, WOE had \>1 million rows). The reason the game
data are so large is that each row is a single game, and the columns
account for every action taken on every turn. I don’t have the time to
go into the details here, but suffice to say there are a lot of columns.

## Analyze the data

OK, now that we have opened the dataset, it’s finally time to do
something with it!

For demonstration purposes, let’s use the dataset to analyze the
**win-rate of cards in the user’s opening hand**.

First, let’s make a vector of columns that we are interested in to
subset the data:

``` r
# Columns we are interested in:
# - whether the user won or or not
# - all the columns that tell us what they had in their opening hand
#   (including tutored cards, but that seems pretty unlikely!)
turn_1_card_cols <- c(
  # "draft_time",
  "won",
  "user_turn_1_cards_drawn",
  "user_turn_1_cards_tutored",
  "user_turn_1_creatures_cast",
  "user_turn_1_eot_user_cards_in_hand",
  "user_turn_1_lands_played",
  "user_turn_1_non_creatures_cast")
```

Next, use `dplyr`-like syntax to subset to only the columns we are
interested in from the data (the
[`select()`](https://dplyr.tidyverse.org/reference/select.html)
function), and combine this with
[`collect()`](https://dplyr.tidyverse.org/reference/compute.html) from
[arrow](https://github.com/apache/arrow/). That last step is different
from normal `dplyr` pipelines: [arrow](https://github.com/apache/arrow/)
will hold off on doing any actual calculations on the data until you
tell it to do so with
[`collect()`](https://dplyr.tidyverse.org/reference/compute.html). That
is what enables it to handle large, out-of-memory datasets.

``` r
ktk_turn_1 <-
  ktk_replay_data |>
  select(won, all_of(turn_1_card_cols)) |>
  collect()
```

The output of
[`collect()`](https://dplyr.tidyverse.org/reference/compute.html) is a
dataframe (tibble). This is **much smaller** than the original replay
dataframe, so we will have no problem working with it in R as usual.

``` r
ktk_turn_1
#> # A tibble: 212,170 × 7
#>    won   user_turn_1_cards_drawn user_turn_1_cards_tuto…¹ user_turn_1_creature…²
#>    <chr> <chr>                   <chr>                    <chr>                 
#>  1 True  NA                      NA                       NA                    
#>  2 True  58033                   NA                       NA                    
#>  3 False NA                      NA                       NA                    
#>  4 False 58183                   NA                       NA                    
#>  5 True  90190                   NA                       NA                    
#>  6 False 58145                   NA                       NA                    
#>  7 False NA                      NA                       57959                 
#>  8 False 58423                   NA                       NA                    
#>  9 False 57939                   NA                       57959                 
#> 10 True  58409                   NA                       NA                    
#> # ℹ 212,160 more rows
#> # ℹ abbreviated names: ¹​user_turn_1_cards_tutored, ²​user_turn_1_creatures_cast
#> # ℹ 3 more variables: user_turn_1_eot_user_cards_in_hand <chr>,
#> #   user_turn_1_lands_played <chr>, user_turn_1_non_creatures_cast <chr>
```

In general, you typically don’t need *all* the columns for a given
analysis; you should be able to use this approach to only subset to
those you’re interested in, then work with the data as a dataframe from
there.

The following code sets a threshold of number of games played for each
card (in other words, dropping cards with insufficient data), then
calculates the win-rate per card in the opening hand. None of this uses
[arrow](https://github.com/apache/arrow/), since we are now working with
an in-memory dataframe. It’s just good-old `tidyverse`-style data
wrangling.

``` r
# Calculate the cutoff value (.25% of the total number of rows)
# to exclude cards that have insufficient data
cutoff_value <- 0.0025 * nrow(ktk_turn_1)

ktk_opening_hand_wr <-
  ktk_turn_1 |>
  mutate(id = seq_len(nrow(ktk_turn_1))) |>
  pivot_longer(names_to = "what", values_to = "card", -c(id, won)) |>
  filter(!is.na(card)) |>
  select(id, won, card) |>
  separate_longer_delim(card, delim = "|") |>
  mutate(
    won = as.logical(won),
    card = as.numeric(card)) |>
  unique() |>
  group_by(card) |>
  summarize(
    n_win = sum(won),
    n_total = n_distinct(id)
  ) |>
  filter(n_total > cutoff_value) |>
  mutate(win_rate = n_win / n_total) |>
  arrange(desc(win_rate))

ktk_opening_hand_wr
#> # A tibble: 352 × 4
#>     card n_win n_total win_rate
#>    <dbl> <int>   <int>    <dbl>
#>  1 58263   564     874    0.645
#>  2 84596   381     591    0.645
#>  3 57999   661    1039    0.636
#>  4 57961  1357    2139    0.634
#>  5 58135   589     935    0.630
#>  6 57981  3378    5367    0.629
#>  7 58275  2983    4767    0.626
#>  8 58331   936    1496    0.626
#>  9 57963  1353    2164    0.625
#> 10 58305   982    1575    0.623
#> # ℹ 342 more rows
```

There’s one last detail: the cards are labeled with a code (ID number),
not their actual names!

Fortunately, 17lands provides a dataset that links these card IDs to
actual card names:

``` r
card_names <- readr::read_csv("https://17lands-public.s3.amazonaws.com/analysis_data/cards/cards.csv")
#> Rows: 22509 Columns: 8
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr (5): expansion, name, rarity, color_identity, types
#> dbl (2): id, mana_value
#> lgl (1): is_booster
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

card_names
#> # A tibble: 22,509 × 8
#>       id expansion name        rarity color_identity mana_value types is_booster
#>    <dbl> <chr>     <chr>       <chr>  <chr>               <dbl> <chr> <lgl>     
#>  1 65591 HOU       Ammit Eter… rare   B                       3 Crea… TRUE      
#>  2 65633 HOU       Torment of… uncom… B                       4 Ench… TRUE      
#>  3 32925 M10       Merfolk Lo… common U                       2 Crea… TRUE      
#>  4 32951 M10       Ornithopter uncom… NA                      0 Arti… TRUE      
#>  5 33035 M10       Platinum A… mythic NA                      7 Arti… TRUE      
#>  6 33069 M10       Hypnotic S… rare   B                       3 Crea… TRUE      
#>  7 65961 XLN       Adanto Van… uncom… W                       2 Crea… TRUE      
#>  8 65963 XLN       Ashes of t… rare   W                       2 Ench… TRUE      
#>  9 65965 XLN       Axis of Mo… mythic W                       6 Ench… TRUE      
#> 10 65967 XLN       Bellowing … uncom… W                       6 Crea… TRUE      
#> # ℹ 22,499 more rows
```

Let’s do a join operation to go from card ID to card name and drop basic
lands:

``` r
ktk_opening_hand_wr |>
  left_join(select(card_names, card = id, name)) |>
  filter(!name %in% c("Swamp", "Plains", "Island", "Mountain", "Forest"))
#> Joining with `by = join_by(card)`
#> # A tibble: 224 × 5
#>     card n_win n_total win_rate name                     
#>    <dbl> <int>   <int>    <dbl> <chr>                    
#>  1 58263   564     874    0.645 Anafenza, the Foremost   
#>  2 57999   661    1039    0.636 Wingmate Roc             
#>  3 57961  1357    2139    0.634 Herald of Anafenza       
#>  4 58135   589     935    0.630 Ashcloud Phoenix         
#>  5 57981  3378    5367    0.629 Seeker of the Way        
#>  6 58275  2983    4767    0.626 Chief of the Edge        
#>  7 58331   936    1496    0.626 Savage Knuckleblade      
#>  8 57963  1353    2164    0.625 High Sentinels of Arashin
#>  9 58305   982    1575    0.623 Mantis Rider             
#> 10 58329  1195    1917    0.623 Sagu Mauler              
#> # ℹ 214 more rows
```

You can verify that this matches up with the opening-hand win-rate
(`OH WR`) available in the[17lands card
data](https://www.17lands.com/card_data?expansion=KTK&format=PremierDraft&start=2014-09-26&columns=opening&sort=opening_hand_win_rate%2Cdesc)
(exact numbers will vary because the public dataset doesn’t include
exactly the same dataset as that used to calculate the stats available
on the card stats page; I recommend filtering the data by date to help
with this).

## Wrap-up

This vignette showed how you can analyze very large MtG datasets in R
with [arrow](https://github.com/apache/arrow/) and
[mtgr](https://joelnitta.github.io/mtgr/).

The analysis I demonstrated here was obviously not anything new, but I
hope the methods explained in the vignette help you generate new
insights with your own analyses.

Enjoy!
