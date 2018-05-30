# ------------------------------------------------------------------------------
#                                 SLOT MACHINE
# ------------------------------------------------------------------------------

# OBTENER LOS SÍMBOLOS POR CADA TIRO
get_symbols <- function(){
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE, prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}

"n <- 100
prize <- 0
plays <- replicate (n, get_symbols())
dim(plays) <- c(n,3)
plays"

prize <- 0 # INICIAL
symbols <- get_symbols()
symbols

# COMPROBACION DE SÍMBOLOS DE ACUERDO A LAS POSICIONES
sameAll <- symbols[1] == symbols[2] && symbols[2] == symbols[3]

sameTwo <-symbols[1] == symbols[2] && symbols[1] == "C" || 
          symbols[1] == symbols[3] && symbols[1] == "C" || 
          symbols[2] == symbols[3] && symbols[2] == "C"
  
oneC <- symbols[1] == "C" && symbols[2] != "C" && symbols[3] != "C" ||
        symbols[2] == "C" && symbols[1] != "C" && symbols[3] != "C" ||
        symbols[3] == "C" && symbols[1] != "C" && symbols[2] != "C"

comBars <- (symbols[1] == "B" || symbols[1] == "BB" || symbols[1] == "BBB") &&
           (symbols[2] == "B" || symbols[2] == "BB" || symbols[2] == "BBB") &&
           (symbols[3] == "B" || symbols[3] == "BB" || symbols[3] == "BBB")

  
if (sameAll == TRUE){
  # SIMBOLOS IGUALES
  if(symbols[1] == "DD"){
    prize <- prize + 100
  } else if (symbols[1] == "7"){
    prize <- prize + 80
  } else if (symbols[1] == "BBB"){
    prize <- prize + 40
  } else if (symbols[1] == "BB"){
    prize <- prize + 25
  } else if (symbols[1] == "B"){
      prize <- prize + 10
  } else if (symbols[1] == "C"){
    prize <- prize + 5
  }
} else if (sameTwo == TRUE){
  # COMPROBACIÓN DE DOS CHERRIES
  if(symbols[3] == "DD" || symbols[2] == "DD" || symbols[1]=="DD"){
    prize <- prize * 2
  } else {
    prize <- prize + 5
  }
} else if (oneC == TRUE){
  # COMPROBACIÓN PARA UNA CHERRY
  if(symbols[2] == "DD" && symbols[3] == "DD" || 
     symbols[1] == "DD" && symbols[3] == "DD" || 
     symbols[1] == "DD" && symbols[2] == "DD"){
      prize <- prize * 4
  } else{
    prize <- prize + 2
  }
} else if (comBars == TRUE){
  # CUALQUIER COMBINACIÓN DE BARRAS
  prize <- prize + 5
} else {
  # CUALQUIER CASO DIREFERENTE A LOS QUE APARECEN EN LA IMÁGEN
  prize <- prize + 0
}

#RESULTADO FINAL
cat("Premio acumulado: ", prize)





