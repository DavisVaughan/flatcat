
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

``` r
library(flatcat)
library(purrr)

map_dbl(list(1, 2:3, 4:6), ~.x)
#> Result 2 must be a single double, not an integer vector of length 2

fmap_dbl(list(1, 2:3, 4:6), ~.x)
#> [1] 1 2 3 4 5 6
```
