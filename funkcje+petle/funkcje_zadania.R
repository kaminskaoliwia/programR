# Napisz funkcj� do obliczania delty funkcji kwadratowej oraz wierzcho�ka. Wypisz je na ekranie.
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
  cat("Wierzcho�ek ma wsp�rz�dne: (", x0, ",", y0, ")\n")
}

delta(1,2,1)
delta(3,-2,0)

# 2. Napisz funkcj� do obliczenia �redniej wa�onej z 2 liczb, jako argumenty poda�: 2 liczby oraz 2 wagi. Wypisz wynik.

weightedMean <- function(l1, w1, l2, w2)
{
  return((l1*w1+l2*w2)/(w1+w2))
}

weightedMean(2,2,2,2)
weightedMean(1,2,4,4)

# 3. Napisz funkcj� do obliczenia �redniej oraz sumy z 2 liczb. Wy�wietl wynik. 

meanSum <- function(a,b)
{
  sum <- a+b
  mean <- sum/2
  
  cat("Suma wynosi", sum, "\n�rednia wynosi", mean)
}

meanSum(2,2)
meanSum(1,3)
meanSum(10,20)

# 4. Stw�rz funkcje obliczaj�c� warto�� funkcji liniowej w punkcie x o podanych parametrach a,b , a
# nast�pnie wy�wietl wprowadzon� funkcje. Wy�wietl funkcj� z warto�ciami domy�lnymi oraz z
# warto�ciami x = 1, a = 2, b= 3.

funkcja <- function(x, a, b)
{
  y <- a*x+b
  cat("f(x) =", a,"* x +", b, "\n")
  cat("f(",x,") =", y)
}

funkcja(1, 2, 3)
