library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
tail <- read_csv("data/tail_length.csv")

surveys$hindfoot_cat <- ifelse(surveys$hindfoot_length < mean(
  surveys$hindfoot_length, na.rm = TRUE), yes = "small", no = "big")
head(surveys$hindfoot_cat)
head(surveys$hindfoot_length)
surveys$record_id
unique(surveys$hindfoot_cat)

#the same using casewhen
#hindfoot length over mean (29.29) I want to be reclassified as "big"
surveys %>% 
  mutate (hindfoot_cat = case_when(
    hindfoot_length > 29.29 ~ "big", 
    TRUE ~ "small"
  )) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  head()

table(surveys$hindfoot_cat)

surveys %>% 
  mutate(hindfoot_cat = case_when(
    hindfoot_length > 31.5 ~ "big", 
    hindfoot_length > 29 ~ "medium", 
    is.na(hindfoot_length) ~ NA_character_, 
    TRUE ~ "small"
  )) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  head(10)

dim(tail)
dim(surveys)
head(tail)

inner_join(x=surveys, y=tail)
surveys_inner <- inner_join(x=surveys, y=tail)

dim(surveys_inner)
head(surveys_inner)

all(surveys$record_id %>% tail$record_id)
all(tail$record_id %in% surveys$record_id)

surveys_left <- left_join(x = surveys, y = tail)
surveys_full <- full_join(surveys, tail)

?cross_join

#Insert pivots/joins code

surveys_mz %>% 
  pivot_wider(id_cols = 'genus', 
              names_from = 'plot_id',
              values_from = 'mean_weight')


