library(tidyverse)
library(ggplot2)
L <- 1 # length of needle
x <- 1 # distance between lines
n <- 10000 # number of dropped needles

buffon_experiment <- function(n, L, a) {
  hit <- 0
  for(i in 1:n) {
    x <- runif(1,0,1)
    y <- runif(1,0,1)
    while(x^2 + y^2 > 1) { # no points outside of unit circle
      x <- runif(1,0,1)
      y <- runif(1,0,1)
    }	
    theta <- atan(y/x) # the random angle
    d <- runif(1,0,(L/2)) # distance of needle midpoint to nearest line
    if(d <= (a/2)*sin(theta)) {
      hit <- hit + 1
    } 
  }
  hit
}

B = buffon_experiment(n, x, L)
print("# touching or crossing a line:")
B = B / n
B
print("# not touching a line:")
print(1-B)
print("Pi estimation:")
pi.est <- (2)/(B)
pi.est

sec <- seq(100, 5000, 50)

pi_aprox <- function(n){
  
  B = buffon_experiment(n, x, L)
  #print("# touching or crossing a line:")
  B = B / n
  B
  #print("# not touching a line:")
  #print(1-B)
  #print("Pi estimation:")
  pi.est <- (2)/(B)
  pi.est
}

pies <- lapply(sec, pi_aprox)  

plot(sec, pies)
#Check PI value
abline(h=pi, col="blue")
