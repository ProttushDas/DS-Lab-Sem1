#PRACTICE SET PROBLEMS
#Q1. Define an R vector of the first 1000 odd integers.
seq(from = 1,to = 1000, by = 2)

odd_numbers <- c()
i <- 1

# While loop to generate the first 1000 odd integers
while (length(odd_numbers) < 1000) 
  {
  if (i %% 2 != 0) {  # Check if the number is odd
    odd_numbers <- c(odd_numbers, i)
  }
  i <- i + 1
}

# Print the first few elements to verify
print(head(odd_numbers))


?seq

#Q2. Define an R vector of the first 500 Fibonacci numbers.
{
  fibo <- numeric(length = 500)
  fibo[1] <- 0
  fibo[2] <- 1
  for(i in 3:500)
  {
    fibo[i] <- fibo[i-1] + fibo[i-2]
  }
  fibo
}

?sample
?cat

#Q3. Write an R function that rolls a fair die and returns 1 if the die turns out to be even.
roll <- function()
{
  rolling <- sample(x = 1:6, size = 1)
  if (rolling %% 2 == 0)
  {
    return(1)
  }
}
roll()


#Q4. Write an R function that tosses a fair coin 15 times. The function should return "lose" if the number heads is less than 8 
#and "win"if the number of heads is more than or equal to 8.
roll <- function()
{
  tossing <- rbinom(n = 15, size = 1, prob = 0.5)
  if (sum(tossing)  < 8)
  {
    return("lose")
  }
  else
  {
    return("win")
  }
}
roll()

#Q5. Define a 5 × 5 matrix of all elements being 1.
matrix <- matrix(1, nrow = 5, ncol = 5 )
matrix <- matrix(c(rep(1,25)), nrow = 5, ncol = 5 )

#Q6. Define a 5 × 5 diagonal matrix with the diagonals being 1:5.
matrix <- matrix(0, nrow = 5, ncol = 5)
for(i in 1:5)
{
  matrix[i,i] <- i
}


#Q7. Define a 10 × 10 matrix where each entry is the result of a random roll of a fair die.
matrix <- matrix(0, nrow = 10, ncol = 10)
for(i in 1:10)
{
  for(j in 1:10)
  {
    matrix[i,j] <- sample(x = 1:6, size =1)
  }
}


#8. Write an R function that takes inputs n and rho. The function should return a matrix 
#with 1s on the diagonals and rho on the off-diagonals.

rmat <- function(n,rho)
{
  mat <- matrix(1, nrow = n, ncol = n)
  for(i in 1:n)
  {
    for(j in 1:n)
    {
      if(i != j)
      {
        mat[i,j] <- rho
      }
      else
        mat[i,j] <- 1
    }
  }
  return(mat)
}
rmat(5,7)

#Q9
rmat <- function(n,rho)
{
  mat <- matrix(1, nrow = n, ncol = n)
  for(i in 1:n)
  {
    for(j in 1:n)
    {
      mat[i,j] <- rho^abs(i-j)
    }
  }
  return(mat)
}
rmat(5,7)

#Q10 Write an R function that takes a matrix input and returns a smaller matrix 
#with only the odd columns of the original matrix.
 fx <- function(matrix_)  # Define the function to extract odd columns
  {
  odd_col_matrix <- matrix_[, seq(1, ncol(matrix_), by = 2)] # Select only the odd columns using seq to generate indices
  return(odd_col_matrix)
  }
sample_matrix <- matrix(1:20, nrow = 4, ncol = 5)  # Creating a sample matrix
result_matrix <- fx(sample_matrix) # Extracting the odd columns
result_matrix


#Q11. Define an 4 dimensional arrays with dimensions 10 × 4 × 6 × 5 where the entries are all 1s.
?array
array(data = 1, dim = c(10, 4, 6, 5))

#WORKSHEET BASED PROBLEMS
#Q1. Write an R function to calculate the area of a circle of radius for a user-given value of r.
area <- function(radius)
{
  area_of_circle <- pi*(radius)^2
  return(area_of_circle)
}
area(3)

#Q2. Write an R function that returns the larger of two inputs x and y.
larger_input <- function(a,b)
{
  if (a>b)
    return(a)
  else
    return(b)
}
larger_input(7,9)

#Q3. Write an R program that saves the output of 1000 rolls of a fair die and returns the number of times
#the output was an even number.
even_outputs <- function()
{
  rolls <- sample(1:6, size = 1000, replace = T )
  return( sum (rolls%%2==0))
}
even_outputs()

#Q4. Draw 1000 random number between [0, 1] and calculate the proportion of numbers between 0.1 and 0.2.
x <- runif( n = 1000, min = 0, max = 1)
prop <- sum (0.1<x & x<0.2)/1000

#Q5.
fn <- function()
{
  char <- c( "Harry", "Dumbledore", "Hermione", "Ron", "Neville", "Mcgonagall", "Dobby")
  packets <- c(0,0,0,0,0,0,0)
  probs <- c(0.25, 0.20, 0.20, 0.15, 0.10, 0.05, 0.05)
  while (min(packets)==0)
    {
      toy <- sample(char, size = 1, prob = probs)
      index <- which(char == toy)
      packets[index] <- packets[ index] + 1
    }
  return (sum(packets))
}

n <- integer (length = 1000)
for (i in 1:1000)
  {
    n[i] <- fn()
  }
mean (n)

#Q6.
fn <- function()
{
  full <- 100
  half <- 0
  day <- 1
  tab <- "full"
  while (tab!="half"){
    if (tab == "full"){
      full <- full - 1
      half <- half + 1}
    day <- day + 1
    tab <- sample ( c("full", "half"), size = 1, prob = c(full,half))
  }
  day
}

n <- integer( length = 1000)
for (i in 1:1000)
{
  n[i] <- fn()
}
mean(n)

#Q7.
#1
MontyHall <- function()
{
  choice <- sample( c("goat", "car"), size = 1, prob = c(2,1))
  if (choice == "goat")
  {
    return (1)
  }
  if (choice == "car") 
  {
    return (0)
  }
}
MontyHall()

#2
n <- integer (length = 1000)
for ( i in 1: 1000)
  {
    n[i]<- MontyHall()
  }
sum(n)/1000

#Q8.
library( imager)
prop.color <- function(img, col){
  count <- 0
  img.mat <- as.array(img[,,1,])
  for (i in 1:dim(img.mat)[1])
    {
    for (j in 1:dim(img.mat)[2])
      {
      dist <- norm(img.mat[i,j,]-col, type='2')
      if (dist<0.5){ count <- count + 1
      }
    }
  }
  prop <- count/(dim(img.mat)[1]*dim(img.mat)[2])
  return (prop)
}
img <- load.image("dog.jpeg")
col <- c(1,1,0)
prop.color(img,col)

#Q9.
img <- load.image("dog.jpeg")
img.mat <- as.array(img[,,1,])
mirror.mat <- array( dim = c(dim(img.mat)[1],dim(img.mat)[2],3))
x <- seq(dim(img.mat)[1],1,-1)
for (i in 1:dim(img.mat)[1])
  {
  for (j in 1:dim(img.mat)[2])
    {
      mirror.mat[x[i],j,] <- img.mat[i,j,]
    }
}
mirror <- as.cimg(mirror.mat)
plot(mirror)

#Q10.
A <- matrix( runif(1000*1000, min = 0, max = 1), nrow = 1000, ncol = 1000)
norm_ <- numeric (length = 1000)
for (i in 1:1000)
  {
     norm_[i] <- norm(A[,i], type = '2')
  }
sapply(A[,],norm)

