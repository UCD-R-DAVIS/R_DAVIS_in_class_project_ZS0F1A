set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

hw2[!is.na(hw2)]
z <- hw2[!is.na(hw2)]
z[z>=14 & z<=38]
prob1 <- z[z>=14 & z<=38]

times3 <- prob1 * 3
times3

plus10 <- times3 + 10
plus10

