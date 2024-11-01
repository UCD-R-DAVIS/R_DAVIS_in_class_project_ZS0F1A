library(tidyverse)
library(ggplot2)
surveys <- read_csv("data/portal_data_joined.csv") %>% 
  filter(complete.cases(.)) #remove NAs

#specific geom settings
ggplot(data = surveys, mapping = aes(x= weight, y= hindfoot_length)) +
  geom_point(aes(color = genus, alpha = 0.1)) +
  geom_smooth()

surveys_wt_cat <- surveys %>% 
  mutate(weight_cat = case_when(
    weight <= 20.00 ~ "small",
    weight > 20.00 & weight < 48.00 ~ "medium",
    weight >= 48.00 ~ "large"
  ))

#categorical v cts data
ggplot(data= surveys_wt_cat, aes(x = weight_cat, y = hindfoot_length)) + 
  geom_jitter(aes(color = weight_cat, alpha = 0.005)) +
  geom_boxplot(aes(color = weight_cat))

#reorder box plot
surveys_wt_cat$weight_cat <- factor(surveys_wt_cat$weight_cat, c
                                    ("small", "medium", "large"))

#facets
head(surveys %>% count(year, species_id))
head(surveys %>% group_by(year, species_id) %>% tally())

yearly_counts <- (surveys %>% group_by(year, species_id) %>% tally())
head(yearly_counts)

#after data = y add [yearly_counts$species_id%in%c('BA', 'DM', 'DO', 'DS')]?

ggplot(data = yearly_counts, 
       mapping = aes(x= year, y=n, group = species_id)) + 
  geom_line() + 
  facet_wrap(~species_id, scales = 'free_y') +
  scale_y_continuous(name = 'obs', breaks = seq(0,600,100)) +
  theme_economist()

install.packages('ggthemes')
library(ggthemes)

install.packages('tigris')
library(tigris)

install.packages('sf')
library(sf)

ca_counties = tigris::counties(state = "CA", class = "sf")

