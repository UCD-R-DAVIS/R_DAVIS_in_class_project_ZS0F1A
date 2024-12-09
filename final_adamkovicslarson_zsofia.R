#1
library(tidyverse)
url <- 'https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv'
tyler_data2  <- read_csv(url)
view(tyler_data2)
dim(tyler_data2)

#2
tyler_running <- filter(tyler_data2, sport == 'running')
dim(tyler_running)
view(tyler_running)

#3
tyler_running_normal <- tyler_running %>% 
  filter(minutes_per_mile < 10) %>% 
  filter(minutes_per_mile > 5) %>% 
  filter(total_elapsed_time_s >= 60)
view(tyler_running_normal)

#4
trn_grouped <- tyler_running_normal %>% 
  mutate(Group = case_when(
    year < 2024 ~ "Old",
    year >= 2024 & month < 7 ~ "Middle",
    year >= 2024 & month >= 7  ~ "New",
  ))
view(trn_grouped)

#5 & 6 & 7 
library(ggplot2)
ggplot(data = trn_grouped, mapping = aes(x = minutes_per_mile, y = steps_per_minute, colour = Group)) +
  geom_point(alpha = 0.1) +
  geom_smooth(method=lm, se=FALSE) +
  theme_light() +
  xlab("Minutes Per Mile") +
  ylab("Steps Per Minute") +
  labs(title = "Changes in Step Rate vs Speed") +
  theme(plot.title = element_text(hjust = 0.5))

#8
new_trn <- filter(trn_grouped, Group == 'New') %>% 
  mutate(Lap = case_when(
   ???
  ))

#I'm past my hour here and also not sure how to rank the laps correctly. 
#Theoretically I would start by mutating the data to have a new column with lap numbers somehow,
#and then I would graph it in a similar way to the graph above with colors by lap numbers. 
#If that isn't clear I might try another graph format.


  