
<!-- README.md is generated from README.Rmd. Please edit that file -->

# HicdepR

<!-- badges: start -->

<!-- badges: end -->

The goal of HicdepR is to provide local `.rds` files that contain the
HICDEP codes (version 1.120) locally to users. In addition, the function
`hicdep_scrape.R` can be used to manually scrape one of the HICDEP
tables from the web.

## Installation

HicdepR is currently in development version. You can download it from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("bsurial/HicdepR")
```

## Access HICDEP tables

If you need information from a HICDEP table, access it from the list
`hicdep_data`.

``` r
library(HicdepR)
library(dplyr)
#> 
#> Attache Paket: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

tblLAB <- hicdep_data$tblLAB

tblLAB$corefields %>% 
  select(-format) # Omit format for nicer printing
#> # A tibble: 7 x 2
#>   fieldname description                                                 
#>   <chr>     <chr>                                                       
#> 1 PATIENT   Code to identify patient (Cohort Patient ID)                
#> 2 LAB_ID    Code representing the measurement                           
#> 3 LAB_D     Date of measurement/sample                                  
#> 4 LAB_D_A   optional precision annotation for date of measurement/sample
#> 5 LAB_R     Measurement result                                          
#> 6 LAB_V     Value of measurement                                        
#> 7 LAB_U     Unit of measurement
```

## Manually get a table from HICDEP

If you want to manually scrape a HICDEP page (e.g. an older version than
1.120), just add the URL and the corresponding name to
`hicdep_scrape()`.

``` r
library(HicdepR)

## Get an older version of tblART from HICDEP 1.110
tblART <- hicdep_scrape("https://hicdep.org/Wiki/v/9/pt/3/Table/17", "tblART")
```

For most HICDEP tables, there the function provides a list of 2 tables,
`corefields` and `additional`. These can be retrieved as with any list
items.

``` r
head(tblART$corefields)
#> # A tibble: 6 x 3
#>   fieldname format                            description                       
#>   <chr>     <chr>                             <chr>                             
#> 1 PATIENT   "character (or numeric if possib… "identifies patient"              
#> 2 ART_ID    "character. see coding table for… "represents the antiretroviral tr…
#> 3 ART_SD    "yyyy-mm-dd"                      "date of initiation of treatment" 
#> 4 ART_SD_A  "character: see coding of date p… "precision of date \"Initiation o…
#> 5 ART_ED    "yyyy-mm-dd"                      "date of stopping treatment"      
#> 6 ART_ED_A  "character: see coding of date p… "precision of date \"Stopping of …
```
