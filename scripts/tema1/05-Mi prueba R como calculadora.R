2*(3+5/2)
1+1 #Suma

2*3+1) #se debe completar los simbolos como ejemplo, falta el '(' de apertura.

5-3 #Resta
8*3 #Multiplicación

2^5 #Potencia

5/2 #Division
7%/%2 #Solo muestra la parte entera del cociente.
7%%2 #Muestra el residuo o módulo

30%%7
30%/%7
31%%7

pi #pi
pi*2
2*pi/2

Inf # Es el número más grande que existe
-Inf #-Infinito es el número más pequeño que existe

5/0 # El resultado es Inf
0/0 # El resultado es un NaN (Not a Number o Indeterminado)

NA #Valor desconocido (Not Available)

2^50 # = 1.1259e+15 Cantidades muy grande las muestra en notación científica en la consola 

sqrt(25) #Raiz cuadrada

log10(1000) #Logaritmo base 10 de 1,000

exp(1) #Inverso al logaritmo de base e (ln)

abs(-5) #Valor absoluto

factorial(7) #El factorial de un numero
factorial(0) #Factorial de 0 es 1


choose(6,3) #Combinación
n<-5
r<-2
nPr=factorial(n)/factorial(n-r)#formula permutación

nPr/2
#Otra forma de permutación con el paquete combinat:
set <- c(1, 2, 3)
permutations <- permn(set)
print(permutations)
permutations

arreglo <- c(1,2,3,4)
permutacion <- permn(arreglo)
permutacion

#Otro ejemplo de permutacion con el paquete gtools

set<-1:5
permutations(n=5, r=2, v=set)

#Funciones trigonométricas
sin(pi/2)
sinpi(1/2)
cos(60*pi/180)

#Redondeo y decimales
print(sqrt(2)) #Muestra el valor de una variable o expresión
floor(sqrt(2)) #Redondea hacia abajo cualquier decimal
ceiling(sqrt(2)) #Redondea hacia arriba cualquier decimal
trunc(sqrt(2)) #Deja la parte entera y corta la parte decimal
round(pi) #
print(pi,7) #Indicando que muestre 7 cifras decimales
ceiling(sqrt(3))
#------------------------------------------------------------------
#Variables
x=pi
y <- 2*pi
pi*3^2 ->z
sqrt(z)
sqrt(2)->a
a^2
#---------------------------------------------------------

#Funciones

x = function(x){sqrt(x)}
x(25)

#Formato identada
Emc2 = function(m){ #En este formato se ejecuta en esta línea de la función
  m*(3*10^8)^2 + ("J")
}

Emc2(2)
Emc2(60)
#--------------------------------------------------------------------

#OPERACIONES BASICAS

opBasic = function(a,b){
  
  print(paste(sprintf("La suma de %f + %f = ",a,b), a+b)) #"La suma de 6.350000 + 4.000000 =  10.35"
  print(paste(sprintf("La resta de %f - %f = ", a,b), a-b))
  print(paste(sprintf("El producto de %f * %f = ", a,b), a*b)) 
  print(a%/%b)
  print(a%%b)
  
}
opBasic(6.35,4) # Llamando la función con los argumentos
#Funciones de formateo de texto y numeros
paste0("Hola", "mundo") # "Holamundo"
paste("Hola","Mundo", sep = " ") # "Hola Mundo"
paste(1:3, collapse = "-") #"1-2-3"
sprintf("El hexadecimal es: %X", 1987) #"hex: b9"
formatC(42, width = 5, flag = "0") #00042 #FormatC formate numeros

n <- 1
mensaje <- ngettext(n, "There is one file", "There are %d files")
sprintf(mensaje, n)

# Conversion de números con strtoi()
hex_value <- "1A"  # Ejemplo en hexadecimal "1A"
decimal_value <- strtoi(hex_value, base = 16) #base 16 indica que hexadecimal
print(decimal_value)  # Resultado: 26

