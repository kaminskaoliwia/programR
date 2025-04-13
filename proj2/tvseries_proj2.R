
library(rvest)
library(dplyr)

# Wczytanie strony
link <- "https://www.filmweb.pl/ranking/serial"
page <- read_html(link)

# Nazwa serialu
name <- page %>% html_nodes(".rankingType__title a") %>% html_text()

# Rok wydania serialu
year <- page %>% html_nodes(".rankingType__year") %>% html_text()

# Ocena
rating <- page %>% html_nodes(".rankingType__rate--value") %>% html_text()

# Iloœæ ocen
rating_number <- page %>% html_nodes(".rankingType__rate--count span:nth-child(1)") %>% html_text()

# Gatunek
genre <- page %>% html_nodes("strong+ .rankingGerne span") %>% html_text()

length(name)
length(year)
length(rating)
length(rating_number)
length(genre)

tvseries <- data.frame(
  name = name,
  year = year,
  rating = rating,
  rating_number = rating_number,
  genre = genre
)

write.csv(tvseries, "tvseries.csv", row.names = FALSE)
