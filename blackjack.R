#Función que obtiene tres cartas aleatorias
blackjack <- function(deck) {
  numbers <- 1:52
  dice <- sample(numbers, size = 3, replace=TRUE)
  sum <- deck[dice[1], "value"] + deck[dice[2], "value"] + deck[dice[3], "value"]
  if (sum > 21){
    print("Perdiste")
  }else if (sum == 21){
    print("Ganaste")
  }else{
    print("Te quedaste a")
    print(21-sum)
  }
  sum
}

simulateGame <- function(dfr) {
  #Contador para saber el porcentaje perdido
  contLose <- 0
  contUncertain <- 0
  for(i in 1:nrow(dfr)){
    
    if( as.numeric(as.character(dfr$corridas[i])) == 21){
      print("Frecuencia relativa que ganó (suma igual a 21):")
      print(as.numeric(as.character(dfr$Freq[i])) / length(corridas))
    }else if(as.numeric(as.character(dfr$corridas[i])) > 21) {
      contLose <- contLose + as.numeric(as.character(dfr$Freq[i]))
    }else {
      contUncertain <- contUncertain + as.numeric(as.character(dfr$Freq[i]))
    }
  }
  #Mostramos porcentaje perdido
  print("Frecuencia relativa que perdió (suma mayor que 21):")
  print(contLose/length(corridas))
  print("Frecuencia relativa que no sabemos resultado (suma menor que 21):")
  print(contUncertain/length(corridas))
}

##-- Main -- ##
#Loading working directory
setwd("C:/Users/Raúl/Desktop/TSIII-Data Science")
#Reading a csv file
deck <- read.table("deck.csv", sep = ",", header = TRUE)
#Inicia blackjack, replicando el juego nPlays veces
corridas <- replicate(10000, blackjack(deck))
#Agrupamos resultados
dfr <- as.data.frame(table(corridas))
#Ejecutamos la simulación
simulateGame(dfr)
