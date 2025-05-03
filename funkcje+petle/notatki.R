
# funkcja znajdywania œredniej dwóch liczb
mean_2_numbers <- function(num1,num2)
{
  mean <- (num1 + num2)/ 2
  return(mean)
}

mean_2_numbers(1,5)

# funkcja obliczania drugiej i trzeciej potêgi na dwa sposoby
count_2_3 <- function(a)
{
  a2 <- a^2
  a3 <- a^3
  return(list(a2,a3))
}
count_2_3(5)

count_2_3_new <- function(a)
{
  return(list(a2<-a^2,a3<-a^3))
}
count_2_3_new(5)
