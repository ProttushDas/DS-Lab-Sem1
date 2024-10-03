#Worksheet 15 sol


#Q1
num1 <- numeric(length = 1e3)
8*1e3
object.size(num1)

num2 <- numeric(length = 1e6)
8*1e6
object.size(num2)

mat1 <- matrix(runif(100*1000), nrow = 100, ncol = 1000)
8*100*1000
object.size(mat1)

mat2 <- matrix(0, nrow = 100, ncol = 1000)
8*100*1000
object.size(mat2)

arr <- array(0, dim = c(100,100,100))
8*100*100*1000
object.size(arr)


#Q2
n <- 1e4
p <- 1e2
# generating arbitrary data
dat <- matrix(runif(n*p), nrow = n, ncol = p)
# making csv file from data
write.csv(dat, file = "bigData.csv", row.names = FALSE)
getwd()
temp <- read.csv("bigData.csv")
# save dat
save(dat, file = "largeData.Rdata")
load("largeData.Rdata")

#Q5
fraction <- function(n)
{
  e <- 2.71
  answer <- factorial(n)/((n^n)/exp(n)*((2*pi*n)^(1/2)))
  return(answer)
}

test <- 1:1e6
plot(test, fraction(test), type="b", ylim = c(0,1.2))
obline(h=1, lty = 2)


fraction(10)
fraction(1e2)
fraction(1e3)
fraction(1e4)
fraction(1e5)
fraction(1e6)

fraction_log <- function(n)
{
  ans <- lfactorial(n) - n*log(n) + n - 2*pi*n
  return(exp(ans))
}
test <- 10^(1:6)
plot(test, fraction_log(test), type="b", ylim = c(0.95,1.05))
obline(h=1, lty = 2)


#Q3
?norm()
library(rbenchmark)
vector <- c(1:100)
a <- norm(vector, "2")
b <- sqrt(sum(vector^2))
?rbenchmark()
benchmark()

#Q6
func1 <- function(n = 1e3)
{
  nums <- 1:(n^2)
  mat <- matrix(nums, nrow = n, ncol = 2)
  means <- apply(mat, 2, mean)
  norm.means <- sqrt(sum(means^2))
  return(norm.means)
}
func2 <- function(n = 1e3)
{
  nums <- 1:(n^2)
  mat <- matrix(nums, nrow = n, ncol = 2)
  means <- colMeans(mat)
  norm.means <- norm(means, "2")  #sqrt(sum(means^2))
  return(norm.means)
}
benchmark(func1(),func2(), replications = 10)
