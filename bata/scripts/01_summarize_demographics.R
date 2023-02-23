library(tidyverse)

study_data_df <- read_csv("../data/study_data.csv", na = c("", "#NULL!")) %>%
  select(
    IV1_lay,
    IV2_ben,
    IV3_her,
    BI_rec,
    gender,
    age,
    Bata_brand_famillarity
  )
  