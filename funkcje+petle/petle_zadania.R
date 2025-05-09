
install.packages("MASS")
library(MASS)
data(state)
head(state.x77)

# 2. Sprawd� typ cech zawartych w zborze oraz informacji o zbiorze danych tak by oceni� z jakich funkcji
# b�dziemy korzysta�.

str(state.x77) # struktura danych
class(state.x77) # typ danych
colnames(state.x77) # nazwy zmiennych

# 3. Obliczy� podstawowe statystyki, informacj� o danych by pozna� rozmieszczenie danych (tendencj�) oraz
# ich rozproszenie.

apply(state.x77, 2, mean)   
apply(state.x77, 2, sd)      
apply(state.x77, 2, range)   
apply(state.x77, 2, quantile)

# 8. Napisz p�tl�, kt�ra wy�wietli napis R jest (tu wstaw dowolne s�owo�) 100 razy.

for (i in 1:100) {
  print("R jest fajny")
}

# 9. Napisz p�tl�, kt�ra za pomoc� funkcji sample() �pu�ci kupon totolotka� 10 razy (6 cyfr).
# Je�li brakuje wyniku postaraj si� wymusi� wy�wietlenie stworzonej instrukcji za pomoc�
# funkcji print().

for (i in 1:10) {
  print(sample(1:49, 6))
}

