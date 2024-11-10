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

# paste: Concatena vectores de texto, permitiendo un separador personalizado.
paste("Hola","Mundo", sep = " ") # "Hola Mundo"

#paste0: Similar a paste, pero sin separador (equivalente a paste(..., sep = "")).
paste0("Hola", "mundo") # "Holamundo"

#collapse: Concatena todos los elementos en una sola cadena.
paste(1:3, collapse = "-") #"1-2-3"

#sprintf tiene diferentes codigos para insertar textos o numeros
#%s: cadena, %d o %i: entero DEC, %f: flotante DEC, %e o %E: Notac. Cient.,
#Otros codigos: %g o G, x o X, o, %3d: ancho minimo 3 char, %05d: ancho min 5 char relleno de 0 si no se alcanza
sprintf("Número: %05d", 42) #El resultado es "Número: 00042"
z<-48 #variable de ejemplo
sprintf("El hexadecimal de %i es: %X", z, z) #"El hexadecimal de 48 es: 30"
paste(sprintf("El Octal de %i es: %o", z, z)) #El Octal de 48 es: 60"

formatC(42, width = 5, flag = "0") #00042 #FormatC formatea numeros, width es el ancho

n <- 1
mensaje <- ngettext(n, "There is one file", "There are %d files")
sprintf(mensaje, n)

# Conversion de números con strtoi()
#Tomando el ejemplo con el numero hexadecimal "1A"
variable_Hex <- "1A"  # Ejemplo de un hexadecimal "1A"

#Se convierte a decimal: base 16 indica que "1A" es un hexadecimal
conversion_Decimal <- strtoi(variable_Hex, base = 16)
print(conversion_Decimal)  # Se imprime la variable con resultado: 26

#Ahora se convierte desde un octal
variable_Octal <- 32
octal_a_decimal <- strtoi(variable_Octal, base = 8)
print(octal_a_decimal)

#NUMEROS COMPLEJOS EN R
#Los complejos tienen una parte real y una imaginaria. Ejemplos:
z <- 5+3i
w <- 2-4i
Re(z) #Parte real de z: "5"
Im(z) #parte imaginaria de z: 3
Mod(z) #el modulo es 5.830952: Es la "distancia" desde el origen en el plano complejo
Arg(z) #El argumento es 0.5404195: es el ángulo que forma el número con el eje real, se expresa en radianes (0.5404195 radianes)
#El conjugado: cambia el signo de la parte imaginaria
Conj(z) #Resultado: 5-3i

#La clave de i es la propiedad: i^2 = −1 | i = sqrt(-1)
#Ej. sqrt(-4) = sqrt(4*(-1)) = 2i
sqrt(-4) #Resultado: NaN | Las calculadoras no calculan la raiz cuadrada 
#de números negativos por eso se usan los números imaginarios

#suma de complejos
z+w #Resultado: "7-1i"
#resta
z-w #Resultado: 3+7i
#multiplicación
z*w #Resultado: 22-14i
#División
z/w #Resultado: -0.1+1.3i 