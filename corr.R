library(ggplot2)
library(tidyverse)
slope <- function(x, y){
  sum((x - mx)*(y - my)) / sum((x-mx)^2)
}

intersection <- function(x, y){
  b <- slope(x, y)
  mean(y) - b * mean(x)
}

head(mtcars)

tail(mtcars)

dim(mtcars)

y <- mtcars$mpg

head(y)

my <- mean(mtcars$mpg)

x <- mtcars$hp

head(x)

mx <- mean(mtcars$hp)
mx

cxy <- cov(x, y)

cxy

b <- slope(x, y)

b

a <- intersection(x, y)

a

lm.hp <- lm(mtcars$mpg ~ mtcars$hp)

lm.hp

ggplot(data = mtcars, aes(x = mpg, y = hp)) + 
  geom_point(color='blue') +
  geom_smooth(method = "lm", se = FALSE, color = 'red')

ggplot(data = mtcars, aes(x = mpg, y = hp)) + 
  geom_point(color='blue') +
  geom_smooth(method = "lm", color = 'red')

#Apply to HW: Estatura-Peso
###Cargamos los datos###
BaseIntPol <- read.csv("estatura-peso.csv")
BaseIntPol
###Mostramos las variables###
names(BaseIntPol)

#Axis Y
y <- BaseIntPol$Peso
head(y)
my <- mean(BaseIntPol$Peso)

#Axis X
x <- BaseIntPol$Estatura
head(x)
mx <- mean(BaseIntPol$Estatura)
mx

#Varianza
cxy <- cov(x, y)
cxy


b <- slope(x, y)
b

a <- intersection(x, y)
a

lm.hp <- lm(BaseIntPol$Peso ~ BaseIntPol$Estatura)

lm.hp

ggplot(data = BaseIntPol, aes(x = Estatura, y = Peso)) + 
  geom_point(color='blue') +
  geom_smooth(method = "lm", se = FALSE, color = 'red')

ggplot(data = BaseIntPol, aes(x = Estatura, y = Peso)) + 
  geom_point(color='blue') +
  geom_smooth(method = "lm", color = 'red')


datos <- read.csv("peso.csv")
datos
datos[,"14"]
mean(datos, 1)













