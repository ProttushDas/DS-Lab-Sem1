?rbinom
# n = number of coin tosses
# size = 1 (tells R we are tossing 1 coin only in 1 toss)
# prob = probability of success
rbinom(n = 1, size = 1, prob = 0.5)

#Q1a Simulate 1000 fair coin tosses and calculate the proportion of heads.
tosses1a <- rbinom(n = 1000, size = 1, prob = 0.5)
head(tosses1a) #first few obs.
tail(tosses1a)
heads1a <- sum(tosses1a)
proportion_heads1a <- heads1a/1000

#Q1b Simulate 1000 tosses of a coin that has probability of heads equal to 0.30. Calculate the proportion of heads.
tosses1b <- rbinom(n = 1000, size = 1, prob = 0.3)
heads1b <- sum(tosses1b)
proportion_heads1b <-heads1b/1000


# Rolling a die
sample(x = 1:6, size = 1)
# Rolling an unfair die
sample(x = 1:6, size = 1, prob = c(.1, .2, .1, .1, .3, .2))
?sample

#Q2a In a bag, there are 7 balls of 3 different colors: 3 are red, 2 are green, 2 are blue. Write a code to randomly draw a ball from the bag.
ball_drawn <- sample(c(rep("red",3), rep("green",2), rep("blue",2), size=1))
balls <- c("red", "red", "red", "green", "green", "blue", "blue")
ball_drawn2 <- sample(balls, size=1)
ball_drawn3 <- sample(c("red", "green" , "blue"), size=1, prob=c(3/7, 2/7, 2/7))
?rep

#Q2b 
A <- matrix(c(3, 1, -2, 4, 5, 3, -1, 2, -2), nrow = 3, ncol = 3)
?numeric
probs <- numeric(length = ncol(A))
for(i in 1:ncol(A))
{
  Ai <- A[ ,i]
  probs[i] <- sqrt(sum(Ai^2))
}
probs <- probs/sum(probs)
choose_column <- sample(1:ncol(A), prob = probs, size = 1)
A[ ,choose_column]

?runif
#  drawing a random number between [a,b]
# n =number of random numbers
# min = a
# max = b
runif(n = 1, min = 0, max = 1)

#Q2c Suppose I throw a dart anywhere at random on a thread of length 5 cm (assume I will always
#throw the dart on the thread and never miss the thread – I am very good at throwing darts).
#Write an R code to simulate where the dart lands on the thread
runif(n=1, min=0, max=5)


#Q3 We will try to run a simulation whose answer should be close to exp(1). You will need to use a few
#new commands in this. Note that, to define a vector of length 1000, you can use command
new <- numeric(length = 1000)
#Also, we have learned for() loops, which can be used to implement a loop when the number of loopings
#are known. However, when the number loops are unknown and based on some condition, we can use the 
#while(condition){---} loop. This runs the loop as long as the condition within the while command is satisfied.

#Q3a Write an R function called exceed() to count the number of random [0,1] draws it takes for their
#sum to exceed 1. The function should have no inputs and should return just one numeric output.
#The syntax will look like:
exceed <- function()
{
  count <- 0
  while(...)
  {
    ...
  }
  return(count)
}


exceed <- function()
{
  count <- 0
  sum <- 0
  while (sum <= 1) 
  {
    random = runif(n=1, min = 0, max = 1)
    sum = sum + random
    count = count + 1
  }
  return(count)
}
exceed()

#Q3b Write an R program to call the above function 1000 times and store all 1000 outputs in a numeric
#vector. The code will look like:
store <- numeric(length = 1000)
for(r in 1:1000)
{
  store[r] <- ...
}


store <- numeric(length = 1000)
for(r in 1:1000)
{
  store[r] <- exceed()
}
store


#Q3c Return the average of the 1000 outputs. This should be close to exp(1).
mean(store)


##Q4 It’s your 25th birthday, and your friends bought you a cake with 25 candles on it. You make a wish
#and try to blow them out. Every time, you blow out a random number of candles between one and
#the number that remain.

#Q4a Write an R function that age as an input and returns the number of attempts it takes to blow out
#all the candles. You may need the break command to write this function or use the while loop.

func <- function(age)
{ 
  attempts <- 0
  while (age > 0) 
  {
    blown <- sample(1:age, size = 1)
    age <- age - blown
    attempts <- attempts + 1
  }
return(attempts)
}
func(25)

#Q4b Write an R program to call the above function 1000 times and store all 1000 outputs in a numeric
#vector. You now have 1000 simulated candle blowing experiments.
vect <- numeric(length = 1000)
for (i in 1:1000) 
{
  
  vect[i] <- func(25)
}
vect

#Q4c How many times, on average, do you need to blow at the cake until all the candles are extinguished?
mean(vect)

#Q4d Repeat the above for you 30th birthday.
candle <- function(age)
{ 
  count1 <- 0
  while(age > 0)
  {
      blown1 = sample(1:age, size = 1)
      age = age - blown1
      count1 = count1 + 1
  }
  return(count1)
}
candle(30)

keep <- numeric(length = 1000)
for(i in 1:1000)
{
  keep[i] = candle(30)
}
keep
mean(keep)
