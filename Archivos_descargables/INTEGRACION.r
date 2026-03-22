head(iris)
summary(iris)
lapply(iris,class)

hist(iris$Petal.Length)
hist(iris$Petal.Width)

plot(iris)

plot(y=iris$Petal.Length,x=iris$Petal.Width)


modelo <- lm(Petal.Length~Petal.Width,data=iris)

modelo

#longitud = 2.230*ancho+1.084

names(modelo)

modelo$fitted.values

summary(modelo)


plot(y=iris$Petal.Length,x=iris$Petal.Width,col='red')
X <- seq(0,3,length=1000)
lines(X,2.230*X+1.084,col='green')

