
install.packages("MASS")
library(MASS)
data(state)
head(state.x77)

# 2. SprawdŸ typ cech zawartych w zborze oraz informacji o zbiorze danych tak by oceniæ z jakich funkcji
# bêdziemy korzystaæ.

str(state.x77) # struktura danych
class(state.x77) # typ danych
colnames(state.x77) # nazwy zmiennych

# 3. Obliczyæ podstawowe statystyki, informacjê o danych by poznaæ rozmieszczenie danych (tendencjê) oraz
# ich rozproszenie.

apply(state.x77, 2, mean)   
apply(state.x77, 2, sd)      
apply(state.x77, 2, range)   
apply(state.x77, 2, quantile)

# 8. Napisz pêtlê, która wyœwietli napis R jest (tu wstaw dowolne s³owo…) 100 razy.

for (i in 1:100) {
  print("R jest fajny")
}

# 9. Napisz pêtlê, która za pomoc¹ funkcji sample() “puœci kupon totolotka” 10 razy (6 cyfr).
# Jeœli brakuje wyniku postaraj siê wymusiæ wyœwietlenie stworzonej instrukcji za pomoc¹
# funkcji print().

for (i in 1:10) {
  print(sample(1:49, 6))
}

