library(tidyverse)
library(rvest)
html <- read_html("https://www.iitk.ac.in/math/faculty")
html
class(html)
# extracting all tags with class = head3. The
# "." indicates class.
name <- html_elements(html, ".head3")
name

# From all the head3 class, extracting all link tags
name <- html_elements(name, "a")
name
# Extracting the text associated with the links
name <- html_text(name)
name
## A faster way
name <- html_elements(html, ".head3 a")
name
name <- html_text(name)
name
?html_text()
name <- html %>% html_elements(".head3 a") %>% html_text()
name

#Q1. Write an R program to obtain the list of post doctoral fellows in the Department of Mathematics and Statistics at IIT Kanpur.
html1 <- read_html("https://www.iitk.ac.in/math/visitors-post-doctoral-fellow")
name1 <- html_elements(html1, ".head2")
name1 <- html_text(name1)
#OR
name1 <- html1 %>% html_elements(".head2") %>% html_text()
name1

#Q2.  Write an R code to obtain the following information about the best 100 movies on Netflix right now
html2 <- read_html("https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now/")

movie_name <- html2 %>% html_elements(".article_movie_title a") %>% html_text()
movie_name

ranking <- html2 %>% html_elements(".countdown-index") %>% html_text()
?substring
ranking <- 
ranking

tomato_score <- html2 %>% html_elements(".tMeterScore") %>% html_text()
tomato_score <- strsplit(tomato_score, split= "%")
tomato_score

year_of_the_movie <- html2 %>% html_elements(".subtle.start-year") %>% html_text()
year_of_the_movie <- strsplit(year_of_the_movie, split= "()")
