#Installimg the package
install.packages("imager")
library(imager)

#Setting the working directory
setwd("C:/Users/MTH/Downloads/worksheet-4")

#Loading the image
dog <- load.image("dog.jpeg")
dim(dog) # stored as RGB
plot(dog) # plot image
dog[220,5,1,] #color details of the pixel at this point

#loading the grayscale version of the image
graydog <- grayscale(dog)
plot(graydog)
dim(graydog)

#Q1. Find the “purest green” part of the image and mark that with a red point on the dog image. You may have to use the which( …, arr.ind = TRUE) command and the points() function.
?points #adds points to a plot
?which

mat.dog <- as.array(dog[ , ,1, ]) #extracts the 3d array
dim(mat.dog)

?norm
compare <- c(0,1,0)
norm(mat.dog[500, 1, ] - c(0,1,0),"2") #dist of purest green from 500,1
dist <- matrix(0, nrow = dim(mat.dog)[1], ncol = dim(mat.dog)[2]) 
dist
for(i in 1:dim(dist)[1])
{
  for(j in 1:dim(dist)[2])
  {
    dist[i,j] <- norm(mat.dog[i,j, ] - compare, "2")
  }
}

location <- which(dist == min(dist), arr.ind = TRUE)
plot(location[1,], location[ ,2],col="red" )

foo <- as.cimg(dist)
plot(foo)

which()
points()
