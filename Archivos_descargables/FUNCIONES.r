## DEFINICION DE UNA FUNCION
suma <- function(n1,n2){
  return(n1+n2)
}

resta <- function(n1,n2) return(n1-n2)

suman <- function(n){
  s <- 0
  for(i in 1:n){
    s <- s+i
  }
  return(s)
}
## FUNCIONES APPLY

M1 <- matrix(1:9,nrow=3)
apply(M1,1,sum)

df <- data.frame(rojo = 1:3,azul =3:5)
M2 <- as.matrix(df)

promedio <- function(vector){
  N <- length(vector)
  s <- 0
  for ( i in 1:N){
    s <- s+vector[i]
  }
  return(s/N)
  }

## LISTAS Y FUNCION LAPPLY ##

L1 <- list("nombre" = "Pepito", "calificaciones" = c(7,4,8))

L2 <- list("quimica" =  c(7,4,8,10), "matematica" = c(7,4,8))

# apply (matrices) -> vector
# lapply (listas) ->  lista



