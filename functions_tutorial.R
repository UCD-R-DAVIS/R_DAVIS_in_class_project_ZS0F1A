### Functions

my_sum <- function(a, b) {
  the_sum <- a + b
  return(the_sum)
}

my_sum(a = 2, b = 2)
my_sum(3, 4)

my_sum2 <- function(a = 1, b = 2) {
  the_sum <- a + b
  return(the_sum)
}
my_sum2()

#Temps

my_sum2(b = 7)

F_to_K <- function(temp) {
  K <- ((temp - 32) * (5 / 9)) + 273.15
  return(K)
}

# freezing point of water
F_to_K(32)


# boiling point of water
F_to_K(212)

#Source()ing functions
#You can load all the functions in your code/functions.R script without even opening the file, 
#via the source function. This allows you to keep your functions separate from the analyses which use them.
source('code/functions.R')

install.packages("gapminder")
library(gapminder)
library(tidyverse)

gapminder %>% 
  filter(country == "Canada", year %in% c(1950:1970)) %>% 
  summarize(mean(gdpPercap, na.rm = T))

# Note: try to name arguments something that do not exist as a column name, to avoid confusing yourself and R
avgGDP <- function(cntry, yr.range){
  df <- gapminder %>% 
    filter(country == cntry, year %in% yr.range)
  mean(df$gdpPercap, na.rm = T)
}

avgGDP("Iran", 1980:1985)

avgGDP("Zimbabwe", 1950:2000)

#Pass by value
#Functions in R almost always make copies of the data to operate on inside of a function body. 
#When we modify a data frame inside the function we are modifying the copy of the gapminder dataset,
#not the original variable we gave as the first argument. This is called “pass-by-value” and it
#makes writing code much safer: you can always be sure that whatever changes you make within the 
#body of the function, stay inside the body of the function.




