?rbinom
# n = number of coin tosses
# size = 1 (tells R we are tossing a coin)
# prob = probability of success
rbinom(n = 1, size = 1, prob = 0.5)

#Q1a Simulate 1000 fair coin tosses and calculate the proportion of heads.
tosses1a <- rbinom(n = 1000, size = 1, prob = 0.5)
head(tosses1a) #first few obs.
tail(tosses1a)
heads1a <- sum(tosses1a)
proportion_heads1a <- heads1a/1000

#Q1b Simulate 1000 tosses of a coin that has probability of heads equal to 0.30. Calculate the proportion of heads
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
ball_drawn3 <- sample(c("red", "green" , "blue"), size=1, prob=c(3, 2, 2))
?rep

#Q2b 
A <- matrix(c(3, 1, -2, 4, 5, 3, -1, 2, -2), nrow = 3, ncol = 3)
probs <- numeric(length = ncol(A))
for(i in 1:ncol(A))
{
  Ai <- A[ ,i]
  probs[i] <- sqrt(sum(Ai^2))
}
probs <- probs/sum(probs)
choose_column <- sample(1:ncol(A), prob = probs)
A[ ,choose_column]


# drawing a random number between [a,b]
# n = number of random numbers
# min = a
# max = b
runif(n = 1, min = 0, max = 1)
#Q2c Suppose I throw a dart anywhere at random on a thread of length 5 cm (assume I will always
#throw the dart on the thread and never miss the thread – I am very good at throwing darts).
#Write an R code to simulate where the dart lands on the thread
runif(n=1, min=0, max=5)
