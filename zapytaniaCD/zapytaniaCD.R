
# 3. Wybierz wszystkie kolumny zawieraj¹ce ci¹g znaków "arr"

library(dplyr)
flights <- read.csv("\zapytaniaCD\nycflights.csv")
flights_arr <- flights %>% select(contains("arr"))
names(flights_arr)
