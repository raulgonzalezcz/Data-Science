
round(3.16, 1)

#Función
suma <- function(a, b){
  a+b
}

suma(3,4)
args(suma)

sumDice <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace=TRUE)
  sum(dice)
}

bb <- replicate(100, sumDice())

#Calcular de manera numérica la cantidad de 2,3,4...12
# NUmero de 3 / numero total

freqRel <- function(bb) {
  vectorCount <- vector(mode = "integer", length=11)
  noIndex <- 2
  cont <- 0
  item <-0
  bb <- sort(bb, decreasing = FALSE)
  for(i in bb){
    if(i == noIndex){
      cont <- cont +1
    }else{
      cat("Total de ",noIndex, ": ", cont, "\n")
      vectorCount[noIndex-1] <- cont/length(bb)
      noIndex <- noIndex + 1
      if(i == noIndex){
        cont <- 1
      }else{
        cont <- 0
      }
    }
    if(item == length(bb)-1){
      cat("Total de ",noIndex, ": ", cont, "\n")
      vectorCount[noIndex-1] <- cont/length(bb)
    }
    item <- item +1
    #print(i)
  }
  cat("Numeros analizados: ", item, "\n")
  vectorCount
}

#Solucion del profesor
bb <- replicate(1000, sumDice())
dfr <- as.data.frame(table(bb))
r <- dfr$Freq / length(bb)


#Importar un paquete
install.packages("ggplot2")

library(ggplot2)
x <- c(-1,0,1,2,3)
y <- x^3
qplot(x,y)

#Histograma de lanzamientos
qplot(bb, binwidth = 1)
