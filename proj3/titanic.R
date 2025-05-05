
library(dplyr)

# Wczytanie danych
titanic <- read.csv("C:\\Users\\kamin\\Desktop\\studia_repo\\programR\\proj3\\titanic_new.csv")
head(titanic)
names(titanic)

# Usuniêcie danych nieistotnych
titanic1 = subset(titanic, select = -c(Passenger.Id, Name, Fare, Cabin, Ticket, SibSp, Parch))
View(titanic1)

# Znalezienie b³êdnych danych AGE
table(titanic$Survived)
titanic1 <- titanic1 %>% filter(Survived %in% c(0,1))
View(titanic1 %>% filter(is.na(Age)))

# Szukanie outlierów
boxplot(titanic1$Age)
summary(titanic1$Age)

# Obliczamy œredni¹ wieku osobno dla kobiet i mê¿czyzn
femaleAge <- mean(titanic1 %>% filter(Sex == "female") %>% pull(Age), na.rm = TRUE)
maleAge <- mean(titanic1 %>% filter(Sex == "male") %>% pull(Age), na.rm = TRUE)

# Zastêpujemy brak wartoœci œredni¹
titanic1 <- titanic1 %>%
  mutate(Age = ifelse(is.na(Age) & Sex == "male", maleAge,
                      ifelse(is.na(Age) & Sex == "female", femaleAge, Age)))
View(titanic1)

# EMBARKED
table(titanic1$Embarked)
titanic1 <- titanic1 %>% mutate(Embarked = toupper(Embarked))
titanic1 <- titanic %>% filter(Embarked %in% c("S", "Q", "C"))
View(titanic1)

# SEX
table(titanic1$Sex)
titanic1 <- titanic %>%
  mutate(Sex = recode(Sex, 
                      "f2emale" = "female",
                      "feemale" = "female",
                      "mal3e" = "male",
                      "mal4e" = "male",
                      "malle" = "male",
                      "malwe" = "male"))
table(titanic1$Sex)
