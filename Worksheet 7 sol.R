library(tidyverse)
library(rvest)

html <- read_html("https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now/")
website <- html %>% html_elements(".article_movie_title a") %>% html_attr("href")
website
num_websites <- length(website)
num_websites


for (i in 1:num_websites)
{
  html_movie <- read_html(website[i])
  html_movie
  
  num_reviews <- html_elements("rt-link[slot = criticsReviews]") %>% html_text()
  num_reviews
  
  tomatometer <- html_elements("rt-link[slot = criticsScore]") %>% html_text()
  tomatometer
  
  popcornmeter <- html_elements("rt-link[slot = criticsReviews]") %>% html_text()
  popcornmeter
  
  num_ratings <- html_elements("rt-link[slot = audienceReviews]") %>% html_text()
  num_ratings
}
