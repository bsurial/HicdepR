## code to prepare all datasets goes here
library(tidyverse)
library(here)
library(rvest)
library(HicdepR)

# Version 1.120
url <- "https://hicdep.org/Wiki/v/10/pt/2"


tables <- read_html(url) %>%
  html_table()

overview <- tables[[1]] %>%
  as_tibble()


tbl_names <- overview$Table
# Get data for tblART

tblART <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/86",
                        "tblART")
tblART_MUM <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/87",
                            "tblART_MUM")
tblBAS <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/88",
                        "tblBAS")
tblCANC <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/89",
                         "tblCANC")
tblCEP <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/91",
                        "tblCEP")
tblDELIVERY_CHILD <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/92",
                                   "DELIVERY_CHILD")
tblDELIVERY_MUM <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/93",
                                 "DELIVERY_MUM")
tblDIS <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/94",
                        "tblDIS")
tblLAB <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/95",
                        "tblLAB")
tblLAB_BP <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/96",
                           "tblLAB_BP")
tblLAB_CD4 <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/97",
                            "tblLAB_CD4")
tblLAB_HCV <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/117",
                            "tblLAB_HCV")
tblLAB_RNA <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/98",
                            "tblLAB_RNA")
tblLAB_VIRO <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/103",
                             "tblLAB_VIRO")
tblLTFU <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/104",
                         "tblLTFU")
tblMED <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/105",
                        "tblMED")
tblOVERLAP <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/108",
                            "tblOVERLAP")
tblPREG <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/109",
                         "tblPREG")
tblPREG_OBS <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/110",
                             "tblPREG_OBS")
tblPREG_OUT <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/111",
                             "tblPREG_OUT")
tblPROGRAM <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/112",
                            "tblPROGRAM")
tblVIS <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/115",
                        "tblVIS")
tblVIS_SUBS <- hicdep_scrape("https://hicdep.org/Wiki/v/10/pt/3/Table/116",
                             "tblVIS_SUBS")


hicdep_data <- list("tblART" = tblART,
                    "tblART_MUM" = tblART_MUM,
                    "tblBAS" = tblBAS,
                    "tblCEP" = tblCEP,
                    "tblCANC" = tblCANC,
                    "tblDELIVERY_CHILD" = tblDELIVERY_CHILD,
                    "tblDELIVERY_MUM" = tblDELIVERY_MUM,
                    "tblDIS" = tblDIS,
                    "tblLAB" = tblLAB,
                    "tblLAB_BP" = tblLAB_BP,
                    "tblLAB_CD4" = tblLAB_CD4,
                    "tblLAB_HCV" = tblLAB_HCV,
                    "tblLAB_RNA" = tblLAB_RNA,
                    "tblLAB_VIRO" = tblLAB_VIRO,
                    "tblLTFU" = tblLTFU,
                    "tblMED" = tblMED,
                    "tblOVERLAP" = tblOVERLAP,
                    "tblPREG" = tblPREG,
                    "tblPREG_OBS" = tblPREG_OBS,
                    "tblPREG_OUT" = tblPREG_OUT,
                    "tblPROGRAM" = tblPROGRAM,
                    "tblVIS" = tblVIS,
                    "tblVIS_SUB" = tblVIS_SUBS)

use_data(hicdep_data)

# walk2(dfs, names(dfs), function(obj, name) {
#   assign(name, obj)
#   do.call("use_data", list(as.name(name), overwrite = TRUE))
# })
