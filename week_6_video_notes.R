###Intro to ggplot, Box plots

library(tidyverse)
install.packages("ggplot2")
library(ggplot2)

surveys_complete <- read_csv("data/portal_data_joined.csv") %>% 
  filter(complete.cases(.))

#Syntax for ggplot
## ggplot(data = <DATA>, mapping = aes(<MAPPING>)) + <GEOM_FUNCTION>()

#Example
ggplot(data = surveys_complete)

#Add aes argument
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length))

#Add geom_function
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point()

#Add more plot elements
#Add transparency to the points 
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1)

#Add color to the points
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, color ="blue")

#Color by group
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.2, aes(color = genus)) +
  geom_smooth(aes(color = genus))

#Universal plot setting
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length, color = genus)) +
  geom_point(alpha = 0.2) +
  geom_smooth()

#Box plot: categorical  & continuous data 
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_boxplot(fill = "orange") +
  geom_jitter(color = "black", alpha = 0.05)

#Change the order of the plot construction
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_jitter(color = "black", alpha = 0.05) +
  geom_boxplot(fill = "orange")

###Timeseries, Facets

#same thing two ways
yearly_counts <- surveys_complete %>% count(year, species_id)
#OR (surveys_complete %>% group_by(year, species_id) %>% tally())

head(yearly_counts)

ggplot(data = yearly_counts, mapping = aes(x = year, y=n)) +
  geom_point()

ggplot(data = yearly_counts, mapping = aes(x = year, y=n, color = species_id)) +
  geom_line()

#color acts like you wrote "group = species_id"

#Facetting
ggplot(data = yearly_counts, mapping = aes(x = year, y=n)) +
  geom_line() + 
  facet_wrap(~ species_id, scales= 'free')

#can use nrow or ncol by scales to change number of columns or rows
#scale lets scale vary by n values of species


  



