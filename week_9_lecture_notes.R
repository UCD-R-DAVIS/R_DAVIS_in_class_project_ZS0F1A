#Iteration

test <- function(i){
  print(i)
}

test(1)

for(i in 1:10){
  print(i)
}

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

#print shows you what is looping
