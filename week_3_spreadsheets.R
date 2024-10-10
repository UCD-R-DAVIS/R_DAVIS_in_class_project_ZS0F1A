
?read.csv

getwd()
"data/portal_data_joined.csv"
file_loc <- "data/portal_data_joined.csv"

surveys <- read.csv("data/portal_data_joined.csv")
nrow(surveys)
ncol(surveys)
dim(surveys)
str(surveys)
summary(surveys)
summary.data.frame(surveys)

# always row, column
surveys[1,5]
# first 5 rows
surveys[1:5, ]
# first column of surveys
surveys[,1]
dim(surveys[,1])

surveys[,1:5]
dim(surveys[,1:5])

surveys['record_id']

colnames(surveys)

surveys[c('record_id', 'year', 'day')]
cols_to_grab = c('record_id', 'year', 'day')
surveys[cols_to_grab]

# call first and last 6 rows
head(surveys)
tail(surveys)

head(surveys["genus"])
head(surveys[["genus"]])
# double bracket brings a vector, gets to the internal vector living within the object, 
# also loses metadata

head(surveys['genus', ])
# give me any row called genus, does not exist becuase it is a column
head(surveys[ ,'genus'])

# $ sign opens up object, next level of names? surf within object 
# only operates for columns
surveys$genus
surveys$hindfoot_length
class(surveys$hindfoot_length)

install.packages('tidyverse')
library(tidyverse)
?read_csv
t_surveys <- read_csv('data/portal_data_joined.csv')
t_surveys
class(t_surveys)
