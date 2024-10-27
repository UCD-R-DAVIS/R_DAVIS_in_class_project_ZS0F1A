# Data Manipulation - Conditional Statements

library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)

summary(surveys$hindfoot_length)

#psuedocode
#if else (test or condition, what to do if test is yes/true, what to do if false)

#boolean test
surveys$hindfoot_length < 29.29

surveys$hindfoot_cat <- ifelse(surveys$hindfoot_length < 29.29, yes = "small", no = "big")
head(surveys$hindfoot_cat)
head(surveys$hindfoot_length)
surveys$hindfoot_length <- ifelse(surveys$hindfoot_length < mean 
                                  (surveys$hindfoot_length, na.rm = TRUE), yes = "small", no = "big")
head(surveys$hindfoot_length)

#case_when()
surveys %>% 
  mutate(hindfoot_cat = case_when(
    hindfoot_length > 29.29 ~ "big",
    is.na(hindfoot_length) ~ NA_character_, #also other types: NA_integer_
    TRUE ~ "small" #weird syntax... essentially "else"
  )) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  head()

#more categories?
surveys %>% 
  mutate(hindfoot_cat = case_when(
    hindfoot_length > 31.5 ~ "big",
    hindfoot_length > 29 ~ "medium",
    is.na(hindfoot_length) ~ NA_character_, #also other types: NA_integer_
    TRUE ~ "small" #weird syntax... essentially "else"
  )) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  group_by(hindfoot_cat) %>% 
  tally()

#something is wrong with my code here :(

