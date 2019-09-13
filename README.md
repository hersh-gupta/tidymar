tidymar
================

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

Interact with DC’s Master Address Repository with R

## Description

District of Columbia’s [Master Address Repository
(MAR)](https://dcatlas.dcgis.dc.gov/mar/) provides a [web
service](https://opendata.dc.gov/pages/mar-webservices) with geocoding
and address verification operations. The `tidymar` package gives R users
a set of fuctions to interact with the MAR web service.

## What’s Inside?

Currently only the following function is implemented:

  - `find_location()`: Location query for DC addresses, intersections,
    blocks, and place names

## Installation

``` r
remotes::install_git("https://github.in.dc.gov/hershgupta/tidymar.git")
```

## Setup

The MAR web service is free to use and requies no credentialing\!

## Usage

``` r
find_location(string = "1600 Pennsylvania Ave NW")
```

## Next Steps

  - Testing
  - Implementing additional functions
