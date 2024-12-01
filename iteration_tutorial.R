###Iterations

x <- 1:10
log(x)

#Loops
for(i in 1:10) {
  print(i)
}

#You’ll often see i used in for loops, you can think of it as the iteration value. 
#For each i value in the vector 1:10, we’ll print that index value. 
#You can use the i value more than once in a loop:

for (i in 1:10) {
  print(i)
  print(i^2)
}

for (i in 1:10) {
  print(letters[i])
  print(mtcars$wt[i])
}

results <- rep(NA, nrow(mtcars))

for (i in seq_along(mtcars$wt)) {
  results[i] <- mtcars$wt[i] * 1000
}
results
?seq_along

mtcars %>% map(mean) # gives a list
mtcars %>% map_dbl(mean) # gives a numeric vector
mtcars %>% map_chr(mean) # gives a character vector

mtcars2 <- mtcars # make a copy of the mtcars dataset
mtcars2[3,c(1,6,8)] <- NA # make one of the cars have NAs for several columns
mtcars2

mtcars2 %>% map_dbl(mean) # returns NA for mpg, wt, and vs columns
mtcars2 %>% map_dbl(mean, na.rm = TRUE)

map2_chr(rownames(mtcars), mtcars$mpg, function(x,y) paste(x, "gets", y, "miles per gallon")) %>% 
  head()

#Complete workflow
#Rescale weight values from 0-1
(mtcars$wt[1] - min(mtcars$wt, na.rm = T)) /
  (max(mtcars$wt, na.rm = T) - min(mtcars$wt, na.rm = T))

mtcars$wt_scaled <- (mtcars$wt - min(mtcars$wt, na.rm = T)) /
  diff(range(mtcars$wt, na.rm = T))

mtcars$wt_scaled

#generalizing 
x_scaled <- (x - min(x, na.rm = T)) /
  diff(range(x, na.rm = T))

rescale_0_1 <- function(x) {
  (x - min(x, na.rm = T)) /
    diff(range(x, na.rm = T))
}

rescale_0_1(mtcars$mpg) # it works on one of our columns

map_df(mtcars, rescale_0_1)


