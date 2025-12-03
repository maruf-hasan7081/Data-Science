library(rvest)
library(httr)
url <- "https://www.imdb.com/chart/top/"
page <- GET(
  url,
  add_headers(
    "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
  )
)
webpage <- read_html(content(page, "text"))
library(stringr)

titles_raw <- webpage %>%
  html_elements("h3.ipc-title__text") %>%
  html_text2()
titles <- titles_raw[2:26] # The first element is "IMDb Charts", so we skip it

years <- webpage %>%
  html_elements(".cli-title-metadata-item:nth-child(1)") %>%
  html_text2()

ratings <- webpage %>%
  html_elements(".ipc-rating-star--rating") %>%
  html_text2()

movies_df <- data.frame(
  Rank = 1:25,
  Title = titles,
  Year = as.integer(years), 
  Rating = as.numeric(ratings) 
)

head(movies_df)