


# 
# Data Management, Manipulation, and
# Exploration with dplyr
# 

# mtcars

rm(list = ls())

library(tidyverse)
library(ggplot2)

head(mtcars)

tail(mtcars)

names(mtcars)

dim(mtcars)

str(mtcars)

tbl_df(mtcars)

glimpse(mtcars)



head(mtcars)

names(mtcars)

dim(mtcars)

str(mtcars)

glimpse(mtcars)

summary(mtcars)


# slice

slice(mtcars, 2)

slice(mtcars, 2:10)

slice(mtcars, c(2, 5, 12))

slice(mtcars, -(3:20))


# filter()

with(mtcars, mpg > 15)

with(mtcars, cyl == 4)

with(mtcars, mpg > 12 & cyl == 4)

filter(mtcars, mpg > 20)

filter(mtcars, cyl == 4)

filter(mtcars, mpg > 20 & cyl == 6)

filter(mtcars, mpg > 25 | mpg < 15)

low_hi <- filter(mtcars, mpg > 25 | mpg < 15)

low_hi


# mutate

head(mtcars)

mutate(mtcars, log_hp = log(hp))

# Sorting

arrange(mtcars, mpg)

filter(mtcars, mpg > 30) # mas eficientes

filter(mtcars, mpg < 15) # menos eficientes

select(filter(mtcars, mpg > 20), cyl)

# pipes
#----------------------------------

mtcars %>% filter(cyl == 6) 
filter(mpg > 20)

ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(size = 2) +
  xlab("potencia") +
  ylab("rendimiento")+
  theme_bw() +

# x = hp, y= mpg
# y = a+bx, graficar en ggplot


#----------------------------------

filter(mtcars, mpg > 20) %>%
  select(hp)

mtcars %>%
  filter(mpg > 20)

mtcars %>%
  filter(mpg > 20) %>%
  select(cyl)



mtcars %>%
  filter(mpg > 25) %>%
  select(hp)


# groups

summarise(
  group_by(mtcars, cyl), 
  meanMpg = mean(mpg)
)

mean.mpg <- summarise(
  group_by(mtcars, cyl), 
  meanMpg = mean(mpg)
)

mean.mpg


mtcars %>%
  group_by(cyl) %>%
  summarise(
    meanMpg = mean(mpg),
    sdMpg = sd(mpg)
  )



mpg_mean_centered <- mtcars %>%
  group_by(cyl) %>%
  mutate(mpg_minus_mean = mpg - mean(mpg))

head(mpg_mean_centered)


library(broom)

mpg_lms <- mtcars %>%
  group_by(cyl) %>%
  do(tidy(lm(mpg ~ disp, data = .)))

mpg_lms

ggplot(mtcars, aes(x = hp, y = mpg, colour = cyl)) +
  geom_point(size = 3) +
  xlab("Horse Power") + 
  ylab("Miles per Gallon") +
  theme_bw()


# box-and-whiskers plots
mtcars
hist(mtcars$mpg)
matrix[, c("mpg")]
plot(density(mtcars$mpg))
 ggplot(mtcars, aes(x = mpg, y = disp)) +
  geom_boxplot() +
  xlab("mpg") +
  ylab("size") +
  theme_bw()

ggplot(mtcars, aes(x = mpg, y = disp)) +
  geom_boxplot() +
  geom_point(size = 3, colour = 'lightgray', alpha = 0.3) +
  xlab("mpg") +
  ylab("size") +
  theme_bw()

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(bins = 10)

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 15)

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 15) + 
  facet_wrap(~cyl)

# ---------------------------------------------------------------------- VIERNES 02/MARZO
library(foreign)

carros <- mtcars
len <- dim(mtcars)
X <- mtcars$hp
Y <- mtcars$mpg
XP <- sum(X)/len[1]
YP <- sum(Y)/len[1]

a <- YP - b * XP
b <- sum( ((X-XP)*(Y-YP)) ) / sum( ( (X-XP)^2) )

Y <- a + (b * X)
lm.hp <- lm(mtcars$mpg ~ mtcars$hp)
lm.hp

ggplot(mtcars, aes(x = hp, y = mpg, colour = cyl)) +
  geom_point(size = 3) +
  xlab("Horse Power") + 
  ylab("Miles per Gallon") +
  theme_bw()

grafico <- ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(size = 2) +
  xlab("potencia") +
  ylab("rendimiento") + 
  geom_smooth(method=lm)

linea <- ggplot(mtcars, aes(x = hp, y = Y)) + geom_line() 

# Mostrar gráficas
###Gráfica con etiqueta de variables##
grafico
linea

#Nombres de coches
mtcars
#Opcion1
mtcars[with(mtcars, mpg > 20 & cyl == 6),]
rownames(mtcars[with(mtcars, mpg > 20 & cyl == 6),])
#Opcion2
library(tibble)  # for `rownames_to_column` and `column_to_rownames`
mtcars %>% rownames_to_column('gene') %>% filter(cyl == 6, mpg > 20)  %>% column_to_rownames('gene')
rownames(mtcars %>% rownames_to_column('gene') %>% filter(cyl == 6, mpg > 20)  %>% column_to_rownames('gene'))

#Estatura-Peso
###Cargamos los datos###
BaseIntPol <- read.csv("estatura-peso.csv")
BaseIntPol
###Mostramos las variables###
names(BaseIntPol)
###Gráfica con etiqueta de variables###
plot(Peso ~ Estatura, data = BaseIntPol, xlab = "Estatura", ylab = "Peso", main="Gráfica: Diagrama de Dispersión")
MLatin <- lm(Peso ~ Estatura, data = BaseIntPol)
abline(MLatin, col = "red")

###Gráfica con Packages ggplot2###
###Además de la línea de regresión se puede apreciar los intervalos de confianza###
# http://rstudio-pubs-static.s3.amazonaws.com/97848_cda6939060334a83b0e53b222b1e4b52.html
library(ggplot2)
pointdata <- data.frame(
  xname = 179, 
  ypos = 65,
  ptyname = c("myData")
) 
ggplot(BaseIntPol, aes(x=Estatura, y=Peso)) + geom_point(size = 2) + ggtitle("Gráfica: Diagrama de Dispersión") + xlab("Estatura") + ylab("Peso") + geom_smooth(method=lm) +
  geom_point(data = pointdata, aes(xname, ypos), color='darkblue', size = 2)

#Ref https://stackoverflow.com/questions/1249548/side-by-side-plots-with-ggplot2
