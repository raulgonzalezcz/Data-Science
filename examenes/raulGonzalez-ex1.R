#Examen1-151211

simular <- function(ngames) {
  probGanarSolo <- 0
  probGanarCambiando <- 0
  resultados <- c()
  for(i in 1:ngames){
    premios <- c("premio" = "carro","fraude" = "balon","fraude"="sabritas")
    #Revolvemos los premios
    premios <- sample(premios, size = 3)
    premios
    
    #Posibles puertas que elige el usuario
    puertas <- c(1:3)
    #Usuario decide una puerta
    decision <- sample(puertas, 1)
    decision
    #Puertas restantes
    restantes <- puertas[-decision]
    restantes
    #Chabelo escoge puerta fraude
    puerta <- sample(restantes,1)
    puerta
    if(attributes(premios)$names[puerta] == "fraude"){
      puertaChabelo <- puerta
      puertasRestante <- restantes[which(restantes != puertaChabelo)]
    }else{
      puertasRestante <- puerta
      puertaChabelo <- restantes[which(restantes != puertasRestante)]
    }
    puertaChabelo
    puertasRestante
    if(attributes(premios)$names[puertasRestante] == "premio") probGanarCambiando <- probGanarCambiando+1
    if(attributes(premios)$names[decision] == "premio") probGanarSolo <- probGanarSolo+1
    sprintf("Primera vuelta: Puerta %i tiene %s", puertaChabelo, unname(premios[puertaChabelo]))
    sprintf("¿Cambias?")
    cambio <- sample(1:2, 1)
    cambio
    if(cambio == 1){#Usuario cambio premio. SU puerta ahora es "puertasRestante"
      if(attributes(premios)$names[puertasRestante] == "premio"){
        sprintf("Felicidades: Puerta %i tiene %s", puertasRestante, unname(premios[puertasRestante]))
        gano <- "GanoCambiando"
      }else{
        sprintf("Perdiste: Puerta %i tiene %s", puertasRestante, unname(premios[puertasRestante])) 
        gano <- "PerdioCambiando"
      }
    }else{ #Usuario no cambió
      if(attributes(premios)$names[decision] == "premio"){
        sprintf("Felicidades: Puerta %i tiene %s", decision, unname(premios[decision])) 
        gano <- "GanoSolo"
      }else{
        sprintf("Perdiste: Puerta %i tiene %s", decision, unname(premios[decision])) 
        gano <- "PerdioSolo"
      }
    }
    resultados[i] <- gano
  }
  
  print("Probabilidad de ganar al cambiar: ")
  print(probGanarCambiando/ngames)
  print("Probabilidad de ganar al NO cambiar: ")
  print(probGanarSolo/ngames)
  print("Porcentaje en el que se ganó al cambiar: ")
  print((sum(resultados == "GanoCambiando"))/ngames)
  print("Porcentaje en el que se ganó al NO cambiar: ")
  print((sum(resultados == "GanoSolo"))/ngames)
}

simular(10000)
