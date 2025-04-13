# install.packages("rvest")
# install.packages("dplyr")

library(rvest)
library(dplyr)

link <- "https://www.imdb.com/search/title/?title_type=feature&num_votes=25000&genres=adventure&sort=user_rating,desc"
page <- read_html(link)

# Nazwa filmu
name <- page %>% html_nodes(".lister-item-header a") %>% html_text()

# Rok wydania filmu
year_raw <- page %>% html_nodes(".lister-item-year") %>% html_text()
year <- gsub("[^0-9]", "", year_raw)

# Ocena
rating <- page %>% html_nodes(".ratings-imdb-rating strong") %>% html_text()

# Opis
synopsis <- page %>% html_nodes(".ratings-bar + .text-muted") %>% html_text(trim = TRUE)

movies <- data.frame(
  name = name,
  year = year,
  rating = rating,
  synopsis = synopsis,
  stringsAsFactors = FALSE
)

# Zapis do pliku
write.csv(movies, "movies.csv", row.names = FALSE)

