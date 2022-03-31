library(tidyverse)

class_a_df <- read_csv("../data/class_a.csv")
class_b_df <- read_csv("../data/class_b.csv")
class_c_df <- read_csv("../data/class_c.csv")

class_a_df <- class_a_df %>%
  mutate(class = "a")

class_b_df <- class_b_df %>%
  mutate(class = "b")

class_c_df <- class_c_df %>%
  mutate(class = "c")

class_attendance_df <- bind_rows(
  class_a_df,
  class_b_df,
  class_c_df
)