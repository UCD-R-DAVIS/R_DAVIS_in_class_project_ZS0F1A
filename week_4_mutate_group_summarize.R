# Homework 3 Review -----
#Load your survey data frame with the read.csv() function. 
surveys <- read.csv("data/portal_data_joined.csv")
surveys

#Create a new data frame called surveys_base with only the species_id, 
#the weight, and the plot_type columns. Have this data frame only be the first 5,000 rows. 
surveys_base <- surveys [, c(6,9,13)]
surveys_base <- surveys [, c("species_id", "weight", "plot_type")]
surveys_base <- select ( surveys, species_id, weight, plot_type)
surveys_base <- surveys [1:5000, c("species_id", "weight", "plot_type")]

#Convert both species_id and plot_type to factors. Remove all rows where there is an NA in the weight column. 
# R automatically concatenates between two numbers separated by a colon. 
surveys_base$species_id <- factor(surveys_base$species_id)
str(surveys_base)

#Explore these variables and try to explain why a factor is different from a character. 
#Why might we want to use factors? Can you think of any examples?

#CHALLENGE: Create a second data frame called challenge_base that only consists 
#of individuals from your surveys_base data frame with weights greater than 150g.


#learning dplyr and tidyr: select, filter, and pipes
#only do this once ever: install()

#We've learned bracket subsetting
#It can be hard to read and prone to error
#dplyr is great for data table manipulation!
#tidyr helps you switch between data formats
  
#Packages in R are collections of additional functions
#tidyverse is an "umbrella package" that
#includes several packages we'll use this quarter:
#tidyr, dplyr, ggplot2, tibble, etc.
  
#benefits of tidyverse
#1. Predictable results (base R functionality can vary by data type) 
#2. Good for new learners, because syntax is consistent. 
#3. Avoids hidden arguments and default settings of base R functions
  
#To load the package type:
library(tidyverse)
    
#now let's work with a survey dataset
surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)
        
#select columns
month_day_year <- select(surveys, month, day, year)
          
#filtering by equals
year_1981 <- filter(surveys, year == 1981)
str (year_1981)
sum(year_1981$year !=1981, na.rm = T)
            
#???

surveys %>% filter(
  month ==1)

surveys %>% 
  filter (month ==1)

mini <- surveys[190:209,]
table(mini$species_id)

#Mutate
surveys <- surveys %>% 
  mutate(weight_kg = weight/1000)

# Adding a new column
# mutate: adds a new column
surveys <- surveys %>%
  mutate(weight_kg = weight/1000)

# Add other columns
surveys <- surveys %>% 
  mutate(.,
          weight_kg = weight/1000,
          weightkg2 = weight_kg*2)
str(surveys)

surveys$weight_kg2 = as.character(surveys$weight_kg2)

# Filter out the NA's
ave_weight <- surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(mean_weight = mean(weight))

str(ave_weight)

# avg weight shows up as one number for every row
# if you used complete cases instead of is.na fewer results because it removes those rows? 

# Group_by and summarize ----
# A lot of data manipulation requires us to split the data into groups, 
# apply some analysis to each group, and then combine the results
# group_by and summarize functions are often used together to do this
# group_by works for columns with categorical variables 
# we can calculate mean by certain groups
surveys %>%
  group_by(sex) %>%
  mutate(mean_weight = mean(weight, na.rm = TRUE))
  
summarize(mean_weight = mean(weight, na.rm = TRUE))

# multiple groups
df <- surveys %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

df



# remove na's


# sort/arrange order a certain way


# Challenge
#What was the weight of the heaviest animal measured in each year? 
#Return a table with three columns: year, weight of the heaviest animal in grams, 
#and weight in kilograms, arranged (arrange()) in descending order, from heaviest to lightest. 
#(This table should have 26 rows, one for each year)
