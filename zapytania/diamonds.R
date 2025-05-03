
install.packages("readxl")

nycflights <- read.csv("C:/Users/kamin/Desktop/studia_repo/programR/zapytania/nycflights.csv", header = TRUE)
View(nycflights)

library(readxl)
diamonds <- read_excel("C:/Users/kamin/Desktop/studia_repo/programR/zapytania/diamonds.xlsx")

str(diamonds)

View(subset(diamonds, color=="E"))
View(subset(diamonds, ))

View(subset(diamonds, carat>0.25 & carat<=0.30))

zad4 <- diamonds %>% 
  
  filter(
    
    (price > 350 & carat > 0.25) | 
      
      (color != "I" & cut %in% c("Premium", "Ideal"))
    
  )











