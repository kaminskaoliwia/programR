install.packages("corrplot")

library(dplyr)
library(corrplot)
library(tidyverse)
library(summarytools)
library(corrplot)

# Wczytanie danych
titanic <- read.csv("C:\\Users\\kamin\\Desktop\\studia_repo\\programR\\proj3\\titanic_new.csv")
head(titanic)
names(titanic)

# Usuniêcie danych nieistotnych
titanic1 = subset(titanic, select = -c(Passenger.Id, Name, Fare, Cabin, Ticket, SibSp, Parch))
names(titanic1)

# SEX
table(titanic1$Sex)
titanic1 <- titanic1 %>%
  mutate(Sex = recode(Sex, 
                      "f2emale" = "female",
                      "feemale" = "female",
                      "mal3e" = "male",
                      "mal4e" = "male",
                      "malle" = "male",
                      "malwe" = "male"))
table(titanic1$Sex)

# Znalezienie b³êdnych danych SURVIVED
table(titanic1$Survived)
titanic1 <- titanic1 %>% filter(Survived %in% c(0,1))

# EMBARKED
table(titanic1$Embarked)
titanic1 <- titanic1 %>% mutate(Embarked = toupper(Embarked))
titanic1 <- titanic1 %>% filter(Embarked %in% c("S", "Q", "C"))
table(titanic1$Embarked)

# AGE
View(titanic1 %>% filter(is.na(Age)))
names(titanic1)

# Szukanie outlierów
boxplot(titanic1$Age,
        main = "Czêstotliwoœæ wystêpowania wieku",
        ylab = "Wiek pasa¿erów",
        col = "thistle1")

hist(titanic1$Age,
     breaks = 20,
     col = "thistle1",
     main = "Czêstotliwoœæ wystêpowania wieku",
     xlab = "Wiek pasa¿erów")
summary(titanic1$Age)

Q1 <- quantile(titanic1$Age, 0.25, na.rm = TRUE)
Q3 <- quantile(titanic1$Age, 0.75, na.rm = TRUE)

IQR <- Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

titanic1_nO <- titanic1 %>% filter(titanic1$Age >= lower_bound & titanic1$Age<= upper_bound)
names(titanic1)

# TITANIC1 Obliczamy œredni¹ wieku osobno dla kobiet i mê¿czyzn
femaleAge <- mean(titanic1 %>% filter(Sex == "female") %>% pull(Age), na.rm = TRUE)
maleAge <- mean(titanic1 %>% filter(Sex == "male") %>% pull(Age), na.rm = TRUE)

# Zastêpujemy brak wartoœci œredni¹
titanic1 <- titanic1 %>%
  mutate(Age = ifelse(is.na(Age) & Sex == "male", maleAge,
                      ifelse(is.na(Age) & Sex == "female", femaleAge, Age)))

# TITANIC1_NO
femaleAge_nO <- mean(titanic1_nO %>% filter(Sex == "female") %>% pull(Age), na.rm = TRUE)
maleAge_nO <- mean(titanic1_nO %>% filter(Sex == "male") %>% pull(Age), na.rm = TRUE)

# Zastêpujemy brak wartoœci œredni¹
titanic1_nO <- titanic1_nO %>%
  mutate(Age = ifelse(is.na(Age) & Sex == "male", maleAge,
                      ifelse(is.na(Age) & Sex == "female", femaleAge, Age)))

# Porównujemy œrednie dla zawartoœci z outlierami i bez
print(femaleAge)
print(maleAge)
print(femaleAge_nO)
print(maleAge_nO)


# PCLASS
table(titanic2$Pclass)

# ANALIZA DANYCH

# Statystyki opisowe
summary(titanic2$Age)

shapiro.test(titanic2$Age)
cor.test(titanic2$Age, titanic2$Survived, method = "spearman")
cor.test(titanic2$Age, titanic2$Pclass, method = "spearman")
cor.test(titanic2$Survived, titanic2$Pclass, method = "spearman")


