getwd()
"data/portal_data_joined.csv"
file_loc <- "data/portal_data_joined.csv"

## Video Notes

#nts: use read_csv instead of read.csv
surveys <- read_csv("data/portal_data_joined.csv")
library(tidyverse)

#select columns 
month_day_year <- select(surveys, month, day, year)

#filtering by equals
filter(surveys, year ==1981)

#filtering by a range
filter(surveys, year %in% c(1981:1983))
#nts: DON"T USE == for a concatenated list, repeats the comparison of years)

#filtering by multiple conditions
bigfoot_with_weight <- filter(surveys, hindfoot_length > 40 & !is.na(weight))

#multi-step processs
small_animals <- filter(surveys, weight <5)
small_animals_ids <- select(small_animals, record_id, plot_id, species_id)

#same process, nested
small_animals_ids <- select(filter(surveys, weight <5), record_id, plot_id, species_id)

#same process using a pipe
#Cmd Shift M
#adds to first element of next function invisibly
small_animal_ids <- filter(surveys, weight <5) %>% select(record_id, plot_id, species_id)

#same as
small_animal_ids <- surveys %>% filter(weight<5) %>% select(record_id, plot_id, species_id)

#how to do line breaks
surveys %>% filter(month==1)

#good: 
surveys %>% 
  filter(month==1)

#not good: 
surveys 
%>% filter(month==1)

#data manipulation
surveys2 <- surveys %>% 
  mutate(weight_kg = weight/1000) %>% 
  head()

surveys %>% 
  group_by(sex) %>% 
  summarise(mean_weight = mean(weight, na.rm=T)) 

surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(sex, species_id) %>% 
  summarise(mean_weight = mean(weight),
            min_weight = min(weight)) %>% 
  arrange(min_weight)

## Homework 3

surveys_base <- surveys[1:5000,] %>% 
  select(species_id, weight, plot_type) %>% 
  filter(!is.na(weight))

surveys_base$species_id <- factor(surveys_base$species_id)
surveys_base$plot_type <- factor(surveys_base$plot_type)

class(surveys_base$species_id)

challenge_base <- surveys_base %>% 
  filter(weight >150)
