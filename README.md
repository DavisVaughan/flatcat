
<!-- README.md is generated from README.Rmd. Please edit that file -->

# flatcat

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/DavisVaughan/flatcat.svg?branch=master)](https://travis-ci.org/DavisVaughan/flatcat)
[![Codecov test
coverage](https://codecov.io/gh/DavisVaughan/flatcat/branch/master/graph/badge.svg)](https://codecov.io/gh/DavisVaughan/flatcat?branch=master)
<!-- badges: end -->

The goal of flatcat is to provide flat map functions.

## Installation

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("DavisVaughan/flatcat")
```

## Examples

No size 1 restriction in each `.f` call

``` r
library(flatcat)
library(purrr)

map_dbl(list(1, 2:3, 4:6), ~.x)
#> Result 2 must be a single double, not an integer vector of length 2

flat_map_dbl(list(1, 2:3, 4:6), ~.x)
#> [1] 1 2 3 4 5 6
```

A neat (but fairly inefficient) way to interleave vectors

``` r
flat_map2_dbl(1:5, 6:10, ~c(.x, .y))
#>  [1]  1  6  2  7  3  8  4  9  5 10
```

With data frames

``` r
flat_map_dfr(list(1, 2:3, 4:6), ~data.frame(x = .x))
#>   x
#> 1 1
#> 2 2
#> 3 3
#> 4 4
#> 5 5
#> 6 6

flat_map_dfc(
  list(1, 2:3, 4, 5:6), 
  ~{
    name <- paste0("x_", paste0(.x, collapse = "_"))
    tibble::tibble(!! name := .x)
  }
)
#>   x_1 x_2_3 x_4 x_5_6
#> 1   1     2   4     5
#> 2   1     3   4     6
```
