
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

hicdep_data$tblART
#> $corefields
#>   fieldname                                         format
#> 1   PATIENT             character (or numeric if possible)
#> 2    ART_ID character. see coding table for valid codings.
#> 3    ART_SD                                     yyyy-mm-dd
#> 4  ART_SD_A       character: see coding of date precision 
#> 5    ART_ED                                     yyyy-mm-dd
#> 6  ART_ED_A       character: see coding of date precision 
#> 7    ART_RS character. see coding table for valid codings.
#>                                   description
#> 1                          identifies patient
#> 2     represents the antiretroviral treatment
#> 3             date of initiation of treatment
#> 4 precision of date "Initiation of Treatment"
#> 5                  date of stopping treatment
#> 6   precision of date "Stopping of Treatment"
#> 7               reason for stopping treatment
#> 
#> $additional
#>       fieldname
#> 1       ART_RS2
#> 2       ART_RS3
#> 3       ART_RS4
#> 4        ART_DO
#> 5        ART_FR
#> 6       GENERIC
#> 7      ART_FORM
#> 8      ART_COMB
#> 9  ART_START_RS
#> 10       ART_ST
#> 11       ART_ET
#>                                                                                                                                                                                                                                                                    format
#> 1                                                                                                                                                                                                                          character. see coding table for valid codings.
#> 2                                                                                                                                                                                                                          character. see coding table for valid codings.
#> 3                                                                                                                                                                                                                          character. see coding table for valid codings.
#> 4                                                                                                                                                                                                                                                                 numeric
#> 5  \r\nnumeric:\r\n\r\n-1 = Frequency not known. ART_DO contains dosage per day\r\n0.33 = 1 dose every third day\r\n0.5 = 1 dose every second day\r\n1 = 1 daily dose/qd\r\n2 = 2 daily doses/bid\r\n3 = 3 daily doses/tid\r\n4... = code gives number of daily doses\r\n
#> 6                                                                                                                                                                                                       \r\nnumeric:\r\n\r\n1 = Branded\r\n2 = Generic\r\n9 = Unknown\r\n
#> 7                                                                               \r\nnumeric:\r\n\r\n1 = Tablet/capsule\r\n2 = Syrup/Suspension\r\n3 = Combination of 1 and 2\r\n4 = Powder\r\n5 = Subcutaneous\r\n6 = Intravenous\r\n7 = Intramuscular\r\n9 = Unknown\r\n
#> 8                                                                                                                                                                      \r\nnumeric:\r\n\r\n0 = Individual drug\r\n1 = Part of a fixed-dose combination\r\n9 = Unknown\r\n
#> 9                                                                                                                                                                                                                            numeric: see coding table for valid codings 
#> 10                                                                                                                                                                                                                                                                  hh:mm
#> 11                                                                                                                                                                                                                                                                  hh:mm
#>                                                  description
#> 1                       Second reason for stopping treatment
#> 2                        Third reason for stopping treatment
#> 3                       Fourth reason for stopping treatment
#> 4              Dosage (mg or mL) per intake unless ART_FR=-1
#> 5                                                  Frequency
#> 6                       Was this a branded or generic drug? 
#> 7                  What formulations of the drug was given? 
#> 8   Was the drug given as part of a fixed-dose combination? 
#> 9                         Reason for starting/receiving ART 
#> 10                      Start hour and minute of the day\r\n
#> 11                           Stop hour and minute of the day
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
