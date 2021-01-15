library(tidyverse)
library(glue)
library(rvest)

#' Scrape the HICDEP tables from the web
#'
#' This function gets the tables from the
#' \href{https://hicdep.org/Wiki/v/10/pt/2}{HICDEP homepage}. HICDEP is a
#' is a platform that provides a standardised variable definition for HIV
#' cohorts used in Europe.
#'
#' @param url Website to scrape
#' @param table_name Name of the associated table
#'
#' @return list of tables scraped from the web
#' @export
#'
#' @examples
#' \dontrun{
#' hicdep_scrape(
#' url = "https://hicdep.org/Wiki/v/10/pt/3/Table/86",
#' table_name = "tblART"
#' )}
hicdep_scrape <- function(url, table_name) {
  content <- url %>%
    xml2::read_html()


  fieldname <- content %>%
    rvest::html_nodes(".columnFieldName") %>%
    rvest::html_text()


  format <- content %>%
    rvest::html_nodes(".columnFormat") %>%
    rvest::html_text()


  description <- content %>%
    rvest::html_nodes(".columnDescription") %>%
    rvest::html_text()


  # There are 2 tables, slice them

  bounds <- which(fieldname == "Field name")

  if (length(bounds) == 1) {
    fieldname1 <- fieldname[2:length(fieldname)]
    description1 <- description[2:length(fieldname)]
    format1 <- format[2:length(fieldname)]

    tidyr::tibble(
      fieldname = fieldname1,
      format = format1,
      description = description1
    )

  } else {
    slice1 <- 2:(bounds[2]-1)
    slice2 <- (bounds[2]+1):length(fieldname)

    fieldname1 <- fieldname[slice1]
    fieldname2 <- fieldname[slice2]


    description1 <- description[slice1]
    description2 <- description[slice2]

    format1 <- format[slice1]
    format2 <- format[slice2]

    # Combine tables
    df1_corefields <- tidyr::tibble(
      fieldname = fieldname1,
      format = format1,
      description = description1
    )

    df2_additional <- tidyr::tibble(
      fieldname = fieldname2,
      format = format2,
      description = description2
    )
    # Combine to lists
    list(corefields = df1_corefields, additional = df2_additional)
  }
}


