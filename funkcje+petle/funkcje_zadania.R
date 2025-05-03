# Napisz funkcjê do obliczania delty funkcji kwadratowej oraz wierzcho³ka. Wypisz je na ekranie.
delta <- function(a,b,c)
{
  if (a == 0) {
    cat("Funkcja nie jest kwadratowa.\n")
    return(NULL)
  }
  
  delta <- b^2 - 4*a*c
  x0 <- -b / (2 * a)
  y0 <- -delta / (4 * a)
  
  cat("Delta =", delta, "\n")
  cat("Wierzcho³ek ma wspó³rzêdne: (", x0, ",", y0, ")\n")
}

delta(1,2,1)
delta(3,-2,0)

# 2. Napisz funkcjê do obliczenia œredniej wa¿onej z 2 liczb, jako argumenty podaæ: 2 liczby oraz 2 wagi. Wypisz wynik.

weightedMean <- function(l1, w1, l2, w2)
{
  return((l1*w1+l2*w2)/(w1+w2))
}

weightedMean(2,2,2,2)
weightedMean(1,2,4,4)

# 3. Napisz funkcjê do obliczenia œredniej oraz sumy z 2 liczb. Wyœwietl wynik. 

meanSum <- function(a,b)
{
  sum <- a+b
  mean <- sum/2
  
  cat("Suma wynosi", sum, "\nŒrednia wynosi", mean)
}

meanSum(2,2)
meanSum(1,3)
meanSum(10,20)

# 4. Stwórz funkcje obliczaj¹c¹ wartoœæ funkcji liniowej w punkcie x o podanych parametrach a,b , a
# nastêpnie wyœwietl wprowadzon¹ funkcje. Wyœwietl funkcjê z wartoœciami domyœlnymi oraz z
# wartoœciami x = 1, a = 2, b= 3.

funkcja <- function(x, a, b)
{
  y <- a*x+b
  cat("f(x) =", a,"* x +", b, "\n")
  cat("f(",x,") =", y)
}

funkcja(1, 2, 3)
