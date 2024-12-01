### Date/Time Lubridate Tutorial Notes

#Dates (just dates, i.e., 2012-02-10)
#POSIXct (“ct” == calendar time, best class for dates with times)
#POSIXlt (“lt” == local time, enables easy extraction of specific components of
#   a time, however, remember that POXIXlt objects are lists)

sample_dates_1 <- c("2018-02-01", "2018-03-21", "2018-10-05", "2019-01-01", "2019-02-18")
#notice we have dates across two years here
class(sample_dates_1)

#YYY-MM-DD is the needed format for the function "as.date"

sample_dates_1 <- as.Date(sample_dates_1)
class(sample_dates_1)

# Some sample dates:
sample_dates_2 <- c("02-01-2018", "03-21-2018", "10-05-2018", "01-01-2019", "02-18-2019")

sample_dates_3<- as.Date(sample_dates_2, format = "%m-%d-%Y" ) # date code preceded by "%"
class(sample_dates_3)

?(strptime)

## Working With Times

#best to use class POSIXct

tm1 <- as.POSIXct("2016-07-24 23:55:26")
tm1

tm2 <- as.POSIXct("25072016 08:32:07", format = "%d%m%Y %H:%M:%S")
tm2

#Notice how POSIXct automatically uses the timezone your computer is set to. 
#What if we collected this data in a different timezone?

# specify the time zone:
tm3 <- as.POSIXct("2010-12-01 11:42:03", tz = "GMT")
tm3

#install.packages("lubridate")

library(lubridate)

#Lubridate uses functions that looks like ymd or mdy to transform data into the class “Date”. 
#Our sample_dates_1 data is formatted like Year, Month, Day, so we would use the lubridate function ymd 
#(y = year, m = month, d = day).

sample_dates_1 <- c("2018-02-01", "2018-03-21", "2018-10-05", "2019-01-01", "2019-02-18")
class(sample_dates_1)

sample_dates_lub <- ymd(sample_dates_1)
class(sample_dates_lub)

sample_dates_2 <- c("2-01-2018", "3-21-2018", "10-05-18", "01-01-2019", "02-18-2019")
#notice that some numbers for years and months are missing

sample_dates_lub2 <- mdy(sample_dates_2) #lubridate can handle it! 

library(dplyr)
library(readr)

# read in some data and skip header lines
nfy1 <- read_csv("data/2015_NFY_solinst.csv", skip = 12)
head(nfy1) #R tried to guess for you that the first column was a date and the second a time
