# Data Manipulation - Joins & Pivots

library(tidyverse)

tail <- read_csv('data/tail_length.csv')
head(tail)
dim(tail)

#join_function(data frame a, data frame b, how to join)
#inner_join(data frame a, data frame b, common id)
#inner_join only keeps records that are in both data frames

surveys <- read_csv('data/portal_data_joined.csv')
inner_join(x = surveys, y=tail, by= 'record_id')

dim(inner_join(x = surveys, y=tail, by= 'record_id'))
dim(surveys)
dim(tail)

#left_join
#left_join takes dataframe x & dataframe y and it keeps everything in x, 
#but only matches in y 
#left_join(x,y) == right_join(y.x)

surveys_left_joined <- left_join(x = surveys, y = tail, by = 'record_id')

#full join(x,y)
#full_join keeps EVERYTHING (beware)
surveys_full_joined <- full_join(x = surveys, y = tail)
dim(surveys_full_joined)

#Pivot_wider makes data with more columns
pivot_wider()

#pivot_longer makes data with more rows
pivot_longer()

surveys_mz <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight))

surveys_mz
unique(surveys_mz$genus)

wide_survey <- surveys_mz %>% 
  pivot_wider(names_from = 'plot_id', values_from = 'mean_weight')

head(wide_survey)

long_survey <- wide_survey %>% 
  pivot_longer(-genus, names_to = 'plot_id', values_to = 'mean_weight')
  





