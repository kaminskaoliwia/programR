
# Przygotowanie modelu zale¿noœci sprzeda¿y od  zale¿noœci od liczby klientów.
# Ile wynosi teoretyczna sprzeda¿ w dniach, w których liczba klientów bêdzie wynosi³a 599,616.

library(dplyr)
library(corrplot)
library(readxl)

# Wczytanie danych
sklep <- read_excel("sklep77.xlsx")
head(sklep)
names(sklep)

# Preprocessing
# Jedyne dane, które s¹ nam potrzebne to te odnosz¹ce siê do liczby klientów
# oraz iloœci sprzeda¿y, warto te¿ usun¹æ dni w których sklep by³ zamkniêty
# dodatkowo takie dane jak data, dzien tyogodnia, wystepowanie swieta sa dla nas nieistotne
# a sklep id niepotrzebne bo omawiamy tylko jeden sklep

sklep = subset(sklep, select = -c(sklep_id, data, czy_promocja, czy_swieto_szkolne,
                                  sklep_asort, dzien_tyg, czy_swieto, sklep_typ, sklep_konkurencja))

names(sklep)

# Czy otwarty
table(sklep$czy_otwarty)
sklep <- sklep %>% filter(czy_otwarty %in% c("Tak"))
table(sklep$czy_otwarty)

# Liczba klientów
boxplot(sklep$liczba_klientow,
        main = "Klienci",
        col = "thistle",
        ylab = "Liczba klientów")

# Usuniêcie outlierów
Q1_lk <- quantile(sklep$liczba_klientow, 0.25, na.rm = TRUE)
Q3_lk <- quantile(sklep$liczba_klientow, 0.75, na.rm = TRUE)
IQR_lk <- Q3_lk - Q1_lk
lower_lk <- Q1_lk - 1.5 * IQR_lk
upper_lk <- Q3_lk + 1.5 * IQR_lk

sklep1 <- sklep %>% filter(sklep$liczba_klientow >= lower_lk & sklep$liczba_klientow<= upper_lk)

hist(sklep$liczba_klientow,
     main = "Liczba klientów - przed usuniêciem outlierów",
     col = "thistle1",
     ylab = "Liczba klientów")

hist(sklep1$liczba_klientow,
     main = "Liczba klientów - po usuniêciu outlierów",
     col = "thistle1",
     ylab = "Liczba klientów")

# Sprzeda¿
boxplot(sklep$sprzedaz,
        main = "Sprzeda¿",
        col = "thistle",
        ylab = "Przychód")

# Usuniêcie outlierów
Q1_s <- quantile(sklep1$sprzedaz, 0.25, na.rm = TRUE)
Q3_s <- quantile(sklep1$sprzedaz, 0.75, na.rm = TRUE)
IQR_s <- Q3_s - Q1_s
lower_s <- Q1_s - 1.5 * IQR_s
upper_s <- Q3_s + 1.5 * IQR_s

sklep2 <- sklep1 %>% filter(sprzedaz >= lower_s & sprzedaz <= upper_s)


hist(sklep$sprzedaz,
     main = "Sprzeda¿ - przed usuniêciem outlierów",
     col = "thistle1",
     ylab = "Przychód")

hist(sklep2$sprzedaz,
     main = "Sprzeda¿ - po usuniêciu outlierów",
     col = "thistle1",
     ylab = "Przychód")

# Statystyki 
summary(sklep2$liczba_klientow)
summary(sklep2$sprzedaz)

# Regresja liniowa
model <- lm(sprzedaz ~ liczba_klientow, data = sklep2)
summary(model)

# Wykres
plot(sklep2$liczba_klientow, sklep2$sprzedaz, pch = 16, col = "skyblue",
     xlab = "Liczba klientów", ylab = "Sprzeda¿")
abline(model, col = "red", lwd = 2)

# Przewidzenie wyników dla liczby klientów = 599 oraz = 616
przewidywanie <- data.frame(liczba_klientow = c(599, 616))
predict(model, newdata = przewidywanie)
