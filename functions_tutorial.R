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





