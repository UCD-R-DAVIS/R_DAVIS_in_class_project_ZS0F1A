set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

# runif is random uniform distribution

hw2[!is.na(hw2)]
z <- hw2[!is.na(hw2)]

# na.omit(hw2) is another option that behaves slightly differently
# complete.cases(hw2) also works. usse carefully

z[z>=14 & z<=38]
prob1 <- z[z>=14 & z<=38]

# could also be hw2[c(14:38)] which takes the subset

times3 <- prob1 * 3
times3

plus10 <- times3 + 10
plus10

plus10[c(T,F)]

?set.seed
?runif

str(plus10)
cbind(hw2, plus10, hw2 +plus10)
a <- cbind(hw2, plus10, hw2 +plus10)
class(a)

# other data types
## lists

c(4, 6, "dog")
list(4, 6, "dog'")
a <- list(4, 6, "dog'")
class(a)
str(a)

# data. frames

letters
data.frame(letters)
df <- data.frame(letters)
length(df)
dim(df) # rows, columns
nrow(df)
ncol(df)

# factors

animals <- factor(c("quail", "duck", "duck", "goose", "goose"))
animals
# factor alphabetizes columns
class(animals)
levels(animals)
nlevels(animals)

animals <- factor(x = animals, levels = c("gooose", "quail", "ducks"))
animals

year <- factor(c(1978, 1980, 1934, 1979))
year
class(year)
as.numeric(year)

as.numeric(animals)
