#Loading working directory
setwd("C:/Users/Raúl/Desktop/TSIII-Data Science")

#Reading a csv file
deck <- read.table("deck.csv", sep = ",", header = TRUE)

#First/ last 6 items
head(deck)
tail(deck)

#Assign number of items to show
head(deck, -1)
tail(deck, 10)

#Función que obtiene tres cartas aleatorias
blackyack <- function(deck) {
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

corridas <- replicate(100, blackyack(deck))
dfr <- as.data.frame(table(corridas))
cont <- 0
for(i in 1:nrow(dfr)){
  row <- dfr[i,]
  if(as.integer(row$corridas) == 21){
    print("Frecuencia relativa que ganó:")
    print(row$Freq / length(corridas))
  }
  if(as.integer(row$corridas) > 21) cont <- cont + as.integer(row$Freq)
}
print("Frecuencia relativa que perdió:")
print(cont/length(corridas))