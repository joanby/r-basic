### GRAFICOS EN R
x <- c(1,2,3,5)
y <- c(4,5,2,3)
plot(x,y,col='red',main='mi primer gráfico',xlab="Eje X",ylab="Eje Y")
z <- as.factor(c('si','no','si','si','no','si'))
plot(z,main="Gráfico de barras")

grid(lwd=2,col='blue')
par(new=TRUE)
plot(x,y,
     col='red',
     main='mi primer gráfico',
     sub='Mi primer subtítulo',
     xlab="Eje X",
     ylab="Eje Y",
     pch=16,
     type='b',
     lty=2,
     lwd=3,
     xlim=c(1.5,4.5),
     ylim=c(2.5,6))
## GRAFICANDO FUNCIONES
x <- seq(1,3,length=100)
plot(x,x^2,
     lwd=1,
     type='l',
     col='blue')
lines(x,x)


plot(iris$Species)

elementos <- table(iris$Species)
barplot(elementos,col='yellow')

hist(trees$Height,breaks=4)


boxplot(trees$Height)


boxplot(trees$Volume)

hist(trees$Volume)

## EXPORTANDO GRAFICOS

head(trees)

png(filename='grafico.png',height = 700,width = 700)
plot(x=trees$Height,y=trees$Volume,main="Volumen vs Altura",xlab="Altura",ylab="Volumen",col='blue')
dev.off()





