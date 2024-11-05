library(tidyverse)
gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")
library(ggplot2)
view(gapminder)

#1 
cont_pop <- gapminder %>% 
  group_by(continent) %>% 
  summarise(mean_life = mean(lifeExp)) 
view(cont_pop)

cont_pop_yearly <- gapminder %>% 
  group_by(continent, year) %>% 
  summarise(mean_life = mean(lifeExp)) 
view(cont_pop_yearly)

ggplot(data = cont_pop_yearly, mapping = aes(x = year, y = mean_life, color = continent)) + 
  geom_point() +
  geom_smooth(aes(color = continent))

#2
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, size = pop)) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

#why don't you need to use aes for the geom_smooth line?

#3
gg_sub <- gapminder %>% 
  filter(country %in% c("Brazil", "China", "El Salvador", "Niger", "United States")) %>% 
  group_by(country, year) %>% 
  summarise(mean_life = mean(lifeExp)) 
view(gg_sub)

ggplot(data= gg_sub, aes(x = country, y = mean_life, color = country)) + 
  geom_boxplot() +
  geom_jitter() + 
  ggtitle("Life Expectancy of Five Countries") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Country") + ylab("Life Expectancy")



