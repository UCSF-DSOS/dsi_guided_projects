library(tidyverse)

# Get column names for OMOP CDM v5.3
cdm_fields <- read_csv("https://raw.githubusercontent.com/OHDSI/CommonDataModel/main/inst/csv/OMOP_CDMv5.3_Field_Level.csv") %>%
  mutate( # Recode cdmDatatype to tidyverse column type abbreviations
    cdmDatatype = recode(
      cdmDatatype,
      integer = "i",
      date = "D",
      Integer = "i",
      float = "d",
      datetime = "T",
      .default = "c"
    )
  )

# Loop through raw csv files in data/raw
for (file in list.files("data/raw")){
  # read file
  processed_table <- read_delim(
    sprintf("data/raw/%s", file),
    delim = "\t", # tab-delimited
    locale = locale(encoding = "utf-8"), # utf-8 encoded
    col_names = cdm_fields %>% # column names from cdm_fields
      filter(cdmTableName == str_to_upper(
        str_split(file, pattern = ".csv")[[1]][1])
      ) %>%
      pull("cdmFieldName"),
    col_types = cdm_fields %>%  # column types from cdm_fields
      filter(cdmTableName == str_to_upper(
        str_split(file, pattern = ".csv")[[1]][1])
      ) %>%
      pull("cdmDatatype")
  )
  
  # save csv file to data/processed
  processed_table %>%
    write.csv(
      file = sprintf("data/processed/%s", file),
      row.names = FALSE
    )
}
