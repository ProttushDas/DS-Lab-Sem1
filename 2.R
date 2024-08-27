## paste your function below 
## make sure to paste ONLY your function
## and no other line of code!

install.packages("imager")
library(imager)
setwd("C:/Users/MTH/Downloads/assignment-2-ProttushDas-main/assignment-2-ProttushDas-main")
# img = imager image
# bright = positive or negative number indicating "m"

img <- load.image("campus.jpeg")
change_brightness <- function(img, m)
{
  img.mat <- as.array(img[ , ,1, ])
#  for(i in 1:dim(img.mat)[1])
#  {
#    for(j in 1:dim(img.mat)[2])
#    {
      if(m<0)
      {
        img.mat <- img.mat
      }
      else
        if(m>1)
        {
          img.mat <- img.mat + c(1, 1, 1)
        }
        else
        {
          img.mat <- img.mat + c(m, m, m)
        }
 #   }
 # }
  changed_img <- as.cimg(img.mat) # make sure to return imager image object
  return(changed_img)
}
