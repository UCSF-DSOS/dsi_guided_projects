library(tidyverse)

diagnosis_df <- read_csv("../data/diagnosis.csv")
groups_df <- read_csv("../data/groups.csv")
participants_df <- read_csv("../data/participants.csv")
test_results_df <- read_csv("../data/test_results.csv")

experiment_data_df <- participants_df %>%
  full_join(diagnosis_df, by = "participant_id") %>%
  full_join(groups_df, by = "participant_id") %>%
  full_join(test_results_df, by = "participant_id")

experiment_data_df %>% write_csv("../data/experimental_data.csv")