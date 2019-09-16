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

Below is an example of the output provided by the MAR (in long
format):

``` r
find_location(string = "1600 Pennsylvania Ave NW") %>% tidyr::gather() %>% print(n=Inf)
```

    ## # A tibble: 46 x 2
    ##    key                    value                                 
    ##    <chr>                  <chr>                                 
    ##  1 ADDRESS_ID             293211                                
    ##  2 MARID                  293211                                
    ##  3 STATUS                 ACTIVE                                
    ##  4 FULLADDRESS            1600 PENNSYLVANIA AVENUE NW           
    ##  5 ADDRNUM                1600                                  
    ##  6 ADDRNUMSUFFIX          <NA>                                  
    ##  7 STNAME                 PENNSYLVANIA                          
    ##  8 STREET_TYPE            AVENUE                                
    ##  9 QUADRANT               NW                                    
    ## 10 CITY                   WASHINGTON                            
    ## 11 STATE                  DC                                    
    ## 12 XCOORD                 396829.87                             
    ## 13 YCOORD                 136646.99                             
    ## 14 SSL                    0187S   0800                          
    ## 15 ANC                    ANC 2A                                
    ## 16 PSA                    Police Service Area 207               
    ## 17 WARD                   Ward 2                                
    ## 18 NBHD_ACTION            " "                                   
    ## 19 CLUSTER_               <NA>                                  
    ## 20 POLDIST                Police District - Second District     
    ## 21 ROC                    Police Sector 2D3                     
    ## 22 CENSUS_TRACT           006202                                
    ## 23 VOTE_PRCNCT            Precinct 2                            
    ## 24 SMD                    SMD 2A01                              
    ## 25 ZIPCODE                20500                                 
    ## 26 NATIONALGRID           18S UJ 23390 07392                    
    ## 27 ROADWAYSEGID           2522                                  
    ## 28 FOCUS_IMPROVEMENT_AREA NA                                    
    ## 29 HAS_ALIAS              Y                                     
    ## 30 HAS_CONDO_UNIT         N                                     
    ## 31 HAS_RES_UNIT           N                                     
    ## 32 HAS_SSL                Y                                     
    ## 33 LATITUDE               38.89766766                           
    ## 34 LONGITUDE              -77.03654468                          
    ## 35 STREETVIEWURL          <NA>                                  
    ## 36 RES_TYPE               MIXED USE                             
    ## 37 WARD_2002              Ward 2                                
    ## 38 WARD_2012              Ward 2                                
    ## 39 ANC_2002               ANC 2A                                
    ## 40 ANC_2012               ANC 2A                                
    ## 41 SMD_2002               SMD 2A05                              
    ## 42 SMD_2012               SMD 2A01                              
    ## 43 IMAGEURL               http://citizenatlas.dc.gov/mobilevideo
    ## 44 IMAGEDIR               NO_IMAGE                              
    ## 45 IMAGENAME              No_Image_Available.JPG                
    ## 46 ConfidenceLevel        100

## Next Steps

  - Testing
  - Implementing additional functions: [all available endpoints for the
    MAR
    webservice](https://citizenatlas.dc.gov/newwebservices/locationverifier.asmx)
