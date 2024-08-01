#Q1 Write a function in R to find 𝑛!. This function should have an argument n that can be used to call the function for a given integer. Verify your answer with factorial() function.
factorial <- function(n)
{
  answer <- 1
  for(i in 1:n)
    answer <- answer * i
  return(answer)
}

fact <- function(n)
{
  prod(1:n)
}


#Q2 Euler’s number, 𝑒, is accessed through exp(1) in R. Similarly 𝑒^3 is exp(3). Write a function in R that calculates the right hand side (without the limit) for a user-given value of𝑛.
exp <- function(n)
{
  euler <- (1 + 1/n)^n  
  return(euler^n)
}


#Q3 Load the seating dataset: seat <- read.csv("https://dvats.github.io/assets/course/mth208/seating.csv")
#Write R code to find your assigned seat using your roll number as reference. 
seat_df <- read.csv("https://dvats.github.io/assets/course/mth208/seating.csv")  
roll_numbers <- seat[,1]
my_seat_serial_number <- which(roll_numbers == 241080085)
seats <- seat_df[,3]
seats[my_seat_serial_number]

myrow <- seat_df$Roll.No ==241080085
myseat <- seat_df[myrow,3]
myseat <- seat_df[myrow,"Seat.Number"]


#Q4 The seating.csv dataset is also shared in the repository folder. Using read.csv() function, load the locally downloaded seating.csv into your R session. You will need to make sure you set the working directory to the folder where the csv file is.  
setwd("D:/COLLEGE/IIT Kanpur/Sem 1/Data Science Lab 1 MTH208/Worksheet 1") 
seating_csv <- read.csv(file.choose(), header=T)


#Q5 Recall the seating chart for this course: seat <- read.csv("https://dvats.github.io/assets/course/mth208/seating.csv") 
#MSc students have 9-digit roll numbers and BS students have 6-digit roll numbers. Write R code to calculate the number of MSc students enrolled in this course, and the number of BS students enrolled in this course.
seat_df <- read.csv("https://dvats.github.io/assets/course/mth208/seating.csv")  
str(seat_df)
typeof(seat_df$Roll.No)
check <- seat_df$Roll.No > 1e7
str(check)
msc <- sum(check)


