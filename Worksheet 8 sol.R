library(dplyr)
library(rvest)

#Q1,2
html1 <- read_html("https://www.relianceiccrankings.com/ranking/womenodi/batting/")
data <- html1 %>% html_table
data
#Data is a list of tables. But, only 1 table is there in this case in the first element of list.
batting <- data[[1]]
batting
#Giving column names to 1st and 4th columns
colnames(batting)[1] <- "Ranking"
colnames(batting)[4] <- "Country"
batting
#Getting the flag names
flag <- html1 %>% html_elements("tr img") %>% html_attr("alt")
flag
#Updating the data frame(tibble)
batting[,4] <- flag
batting

#Q3
starwars
#filter, arrange and slice work on rows

#filter() function - filters out and makes a new tibble selecting rows where the expression is true
starwars %>% filter(skin_color == "light", eye_color == "brown")

#arrange() function - reorders the tibble according to given column values(second column is used in case of breaking ties) 
starwars %>% arrange(height, mass)
starwars %>% arrange(desc(height)) #descending order

#slice() function - slices out the given number of rows
starwars %>% slice(5:10) #Gives tibble from row 5 to 10
starwars %>% slice_head(n = 3) #Gives tibble of first 3 rows
starwars %>% slice_tail(n = 3) #Gives tibble of last 3 rows
starwars %>% slice_sample(n = 5) #Randomly chooses 5 rows
starwars %>% slice_sample(prop = 0.25) #Randomly chooses 0.25 proportion of the rows

#select, rename, mutate & relocate work on columns

#select() function - Selects given columns
starwars %>% select(hair_color, skin_color, eye_color)
starwars %>% select(hair_color:eye_color)
starwars %>% select(!(hair_color:eye_color)) #Select all columns except those from hair_color to eye_color
starwars %>% select(ends_with("color")) #Select all columns ending with color

#rename() function - Renames the column
starwars %>% rename(home_world = homeworld)

#mutate() function - 


#as.data.frame#Q4
mtcars

#Q5
