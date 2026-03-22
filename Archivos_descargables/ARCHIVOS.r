# https://vincentarelbundock.github.io/Rdatasets/datasets.html
# https://archive.ics.uci.edu/ml/machine-learning-databases/

download.file(url="https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data",
              destfile = "iris.data")

file.show("iris.data")

names <- c("nombre1","nombre2","nombre3","nombre4","tipo")

datairis <- read.table("iris.data",sep=",",col.names = names)

head(datairis)

download.file(url="https://vincentarelbundock.github.io/Rdatasets/csv/AER/Affairs.csv",
              destfile = "affairs1.csv")
file.show("affairs1.csv")

affairs1 <- read.table("affairs1.csv",sep=",",header = FALSE)

head(affairs1)

affairs2 <- read.csv("affairs1.csv")

head(affairs2)


argentinaCPI <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/AER/ArgentinaCPI.csv")


head(argentinaCPI)

### EXPORTANDO DATOS

write.table(x=datairis,file="datairis.txt",sep=";",row.names=FALSE,col.names = TRUE)


listaA <- list(
  "a" = c(1,2,3,4),
  "b" = matrix(1:6,ncol=2),
  "c" = "Prueba"
)

saveRDS(object=listaA,file="lista.rds")

listaB <- readRDS("lista.rds")

listaB

## ARCHIVOS EXCEL

install.packages("readxl")
library(readxl)

hojas <- excel_sheets("prueba.xlsx")

hoja1 <- read_excel(path="prueba.xlsx",sheet = hojas[2],range="A2:B4",col_names=c("col1","col2"))

### OTROS TIPOS DE ARCHIVOS

install.packages("haven")
library(haven)

datospss <- read_spss("spss.sav")

head(datospss)

datostata <- read_stata("stata.DTA")

class(datostata)

head(datostata)













