
# Oblicz statystyki opisowe dla 2 cech hp - horsepower,
# oraz drat - wspó³czynnik przek³adni w zbiorze danych mtcars
library(datasets)
head(mtcars)

summary(mtcars$hp)
summary(mtcars$drat)

kurtosis(mtcars$hp)
kurtosis(mtcars$drat)

skewness(mtcars$hp)
skewness(mtcars$drat)

var(mtcars$hp)
var(mtcars$drat)

sd(mtcars$hp)
sd(mtcars$drat)

max(mtcars$hp)-min(mtcars$hp)
max(mtcars$drat)-min(mtcars$drat)

hist(mtcars$hp,
     xlab = "number of horsepower",
     ylab = "number of cars",
     main = "Horsepower (Number of cars)",
     border = "magenta",
     col = "thistle2")

hist(mtcars$hp,
        xlab = "number of horsepower",
        main = "Horsepower (Density)",
        col = "thistle1",
        breaks = 14,
     freq = FALSE)

curve(dnorm(x, mean = mean(mtcars$hp), sd = sd(mtcars$hp)),
      col = "thistle4",
      lwd = 2,
      add = TRUE,
      from = min(mtcars$hp),
      to = max(mtcars$hp))

lines(density(mtcars$hp), col = "blue", lwd = 2)
rug(mtcars$hp, lwd =2, col = "gray")

hist(mtcars$drat,
     xlab = "number of spins",
     ylab = "number of cars",
     main = "Rear axle ratio (Number of cars)",
     border = "magenta",
     col = "thistle2")

hist(mtcars$drat,
     xlab = "number of spins",
     main = "Rear axle ratio (Density)",
     col = "thistle1",
     breaks = 14,
     freq = FALSE)

curve(dnorm(x, mean = mean(mtcars$drat), sd = sd(mtcars$drat)),
      col = "thistle4",
      lwd = 2,
      add = TRUE,
      from = min(mtcars$drat),
      to = max(mtcars$drat))

lines(density(mtcars$drat), col = "blue", lwd = 2)
rug(mtcars$drat, lwd =2, col = "gray")

plot(mtcars$drat, mtcars$hp,
     pch = 19,
     cex = 1.3,
     col = "red",
     main = "HP as a Function of rear axle ratio",
     ylab = "number of horsepower",
     xlab = "number of spins")

plot(mtcars$hp, mtcars$drat,
     pch = 19,
     cex = 1.3,
     col = "red",
     main = "RAR as a Function of horsepower",
     ylab = "number of spins",
     xlab = "number of horsepower")

cor.test(mtcars$hp, mtcars$drat)

# Zadanie 2

install.packages("gapminder")
install.packages("dplyr")
library(gapminder) 
library(dplyr)

View(gapminder)
gap_1987 <- filter(gapminder, year == 1987)

plot(gap_1987$lifeExp, gap_1987$pop,
     main = "Zale¿noœæ miêdzy d³ugoœci¹ ¿ycia a populacj¹ (1987)", 
     xlab = "Œrednia d³ugoœæ ¿ycia", 
     ylab = "Populacja", 
     pch = 19, col = "blue")

asia <- filter(gap_1987, continent == "Asia")
plot(asia$lifeExp, asia$pop,
     main = "Azja", 
     xlab = "Œrednia d³ugoœæ ¿ycia", 
     ylab = "Populacja", 
     pch = 19, col = "red")

europe <- filter(gap_1987, continent == "Europe")
plot(europe$lifeExp, europe$pop,
     main = "Europa", 
     xlab = "Œrednia d³ugoœæ ¿ycia", 
     ylab = "Populacja", 
     pch = 19, col = "blue")

africa <- filter(gap_1987, continent == "Africa")
plot(africa$lifeExp, africa$pop,
     main = "Afryka", 
     xlab = "Œrednia d³ugoœæ ¿ycia", 
     ylab = "Populacja", 
     pch = 19, col = "green")

americas <- filter(gap_1987, continent == "Americas")
plot(americas$lifeExp, americas$pop,
     main = "Ameryki", 
     xlab = "Œrednia d³ugoœæ ¿ycia", 
     ylab = "Populacja", 
     pch = 19, col = "pink")

oceania <- filter(gap_1987, continent == "Oceania")
plot(oceania$lifeExp, oceania$pop,
     main = "Oceania", 
     xlab = "Œrednia d³ugoœæ ¿ycia", 
     ylab = "Populacja", 
     pch = 19, col = "brown")

cor.test(gap_1987$lifeExp, gap_1987$pop)
