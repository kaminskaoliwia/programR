
# Prawdopodobieñstwo wylosowania normalnego 
pnorm(50,-1.6)

rnorm(50,-14:15)

round(rnorm(50,-15:15))

round(rnorm(50,3),3)

rnorm(50, 1.5:2.25)

round(rnorm(30, mean = 15),2)

# Jak wylosowaæ liczby na podstawie 
# gêstoœci rozk³adu normalnego w punktach miêdzy 30 a 100

set.seed(1313)
x <- rnorm(100, 65, 10)
x <- x[x >= 30 & x <= 100]
x <- x[1:100]
print(x)

# wektory
wek1 <- sample(1:10,4,T)
print(wek1)

wek2 <- c(1, 0, -1, -2)
print(wek2)

wek3 <- c(2, 2, 2, 2)
print(wek3)

result <- (wek1+wek3) %% wek2 * wek2[3] - wek1
print(result)

# macierze
mat1 <- matrix(1:12, nrow = 3, ncol = 4)
mat2 <- matrix(NA, nrow = 3, ncol = 4)

mat2[,1] <- mat1[,1] + 3       
mat2[,2] <- -mat1[,3]
mat2[,3] <- mat1[,2] / 2      
mat2[,4] <- mat1[,4]          

print(mat1)
print(mat2)

mat3 <- mat1%*%t(mat2)
print(mat3)

print(diag(mat3))

# matematyka
a <-  3*sqrt(2)*15 /sqrt(2)*7517 
print(a)

# liczby zespolone
b <- complex(real = -1, imaginary = 3)
print(b)

c <- complex(real=2, imaginary = -2)
print(c)

d <- b-c
print(d)


# (3-???3i)^2 (???2+2i)^3
e <- complex(real = 3, imaginary = -sqrt(3))
e <- e^2
e <- Mod(e)

print(e) 

f <- complex(real = sqrt(2), imaginary = 2)
f <- f^3
f <- Mod(f)
print(f) 

euler <- exp(1i * pi)
print(euler)

# geometria
r = 6.32

pole = pi*r^2
print(pole)

obwod = 2*pi*r
print(obwod)

kulapole = 4*pi*r*r
print(kulapole)

kulaobj = 4/3*pi*r^3
print(kulaobj)
