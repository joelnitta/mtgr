## code to prepare replay_cols

library(tidyverse)

# Column types are specified using regex in a python script. Download it.
col_dat <- readr::read_lines(
  paste0(
    "https://17lands-public.s3.amazonaws.com/analysis_data/helper_files/",
    "replay_dtypes.py"
  )
)

# Detect line where column type definitions start
start_line <-
  col_dat %>%
  str_detect("COLUMN_TYPES = ") %>%
  which() %>%
  magrittr::add(1)

# Detect line where column type definitions end
end_line <-
  col_dat %>%
  str_detect("^\\)$") %>%
  which() %>%
  magrittr::subtract(1)

# Trim to lines with column definitions
col_dat <- col_dat[start_line:end_line]

# Exclude comment lines
col_dat <- col_dat[!str_detect(col_dat, "^ +\\#")]

# Process to only the text we need
col_dat <-
  col_dat %>%
  str_remove_all('"') %>%
  str_remove_all("\\# +DEPRECATED") %>% # may want to delete this instead
  str_remove_all("\\(re\\.compile\\(r") %>%
  str_replace_all("\\),", ",") %>%
  str_squish() %>%
  str_remove_all(",$")

# Make lookup table mapping python data types to arrow data types
py_arrow_lookup_tbl <- tribble(
  ~py_type, ~arrow_type,
  "bool", "boolean",
  "float16", "float32",
  "int16", "int32",
  "int8", "int8",
  "str", "string"
)

# Make into a tibble and add arrow data types
replay_cols <-
  tibble(text = col_dat) %>%
  separate_wider_delim(
    delim = ", ", names = c("regex", "py_type"), cols = text) %>%
  left_join(py_arrow_lookup_tbl, by = "py_type") %>%
  assertr::assert(assertr::not_na, everything()) %>%
  assertr::assert(assertr::is_uniq, regex)

# Write out data
usethis::use_data(
  replay_cols, overwrite = TRUE)
