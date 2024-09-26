library(ggplot2)
library(tidyverse)

#putting in data and mapping in the ggplot function
ggplot(mpg, aes(cty, hwy)) +
  #takes the mapped data & determine how the data is displayed as -
  # 1) geometry - points, lines or rectangles
  # 2) position adjustment - determines where the piece of data is displayed
  geom_point(mapping = aes(colour = displ)) +
  # to fit and overlay a trendline
  geom_smooth(formula = y ~ x, method = "lm") +
  
  scale_colour_viridis_c() +
  #separates subsets of the data
  facet_grid(year ~ drv) +
  #displays a plot with a fixed aspect ratio
  coord_fixed() +
  #controls almost any visuals of the plot that are not controlled by the data
  theme_minimal() +
  theme(panel.grid.minor = element_blank())


setwd("D:/COLLEGE/IIT Kanpur/Sem 1/Data Science Lab 1 MTH208/Worksheet 12 ggplot")
load("IMDB_movies.Rdata")
#One variable plots
#Histogram
ggplot(dat, aes(x = rating)) +
  geom_histogram()
#Boxplot
ggplot(dat, aes(x = rating)) +
  geom_boxplot()
#Barplot
ggplot(dat, aes(x = rating)) +
  geom_bar()
#Scatter plot
ggplot(dat, aes(x = year, y = over.votes)) +
  geom_point()

#Limiting the coordinates
ggplot(dat, aes(x = year, y = over.votes)) +
  geom_point() +
  coord_cartesian(xlim = c(1996, 2025))



Year <- dat$year < 2000
Year <- as.factor(Year) #to convert a variable into a factor(a data type used for categorical variables)
levels(Year) <- c("After 2000", "Before 2000") #stating the levels of the categorical data

ggplot(dat, aes(x = over.votes, y = rating)) +
  geom_point(aes(shape = Year, col = Year)) +
  labs(title = "Votes vs Rating", y = "Rating", x = "Number of Votes")

#Q1
load("covid.Rdata")
ls()
#data is stored in the list india_covid
names(india_covid) #gives the colnames of the list

#Q2
india_covid %>% ggplot(aes(x = `State/UT`, y = `Confirmed Cases`, colour = `Active Cases`)) +
  geom_point() +
  labs(title = "Confirmed COVID-19 Cases by State/UT",
       x = "State/UT", y = "Confirmed Cases") 

india_covid %>% ggplot(aes(x = `State/UT`, y = `Confirmed Cases`, size = `Active Cases`)) +
  geom_point() +
  labs(title = "Confirmed COVID-19 Cases by State/UT",
       x = "State/UT", y = "Confirmed Cases") 
             
