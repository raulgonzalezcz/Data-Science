#Use la biblioteca dplyr
library(dplyr)
#Use ggplot
library(ggplot2)
#Lea el archivo msleep
setwd("C:/Users/Raúl/Desktop/TSIII-Data Science")
msleep <- read.csv("msleep.csv")
msleep
#Cual es el numero de columnas, cual es el numero de filas,
print(paste("Filas, columnas:", toString(dim(msleep))))
#nombre de columnas
names(msleep)
#tipo de cada columna
str(msleep)
typeof(names(msleep))
#De un resumen de cada columna.
summary(msleep)
#Muestre las columnas name, sleep_rem
col <- c("name", "sleep_rem")
msleep[,col]
#Muestre todas las columnas excepto awake y bodywt
msleep[, !names(msleep) %in% c("awake", "bodywt")]
#dim(msleep[, !names(msleep) %in% c("awake", "bodywt")] )
#Muestre todas las columnas cuyo nombre inicie con "sl"
select(msleep, starts_with("sl"))
msleep[ , grepl( "sl" , names( msleep ) ) ]
#Muestre todas las columnas cuyo nombre inicie con "b"
select(msleep, starts_with("b"))
#Muestre todas las columnas cuyo nombre sea "name" o contengan "wt"
select(msleep, matches("name"), contains("wt"))
#Muestre todos los animales que duerman en total menos de 16
filter(msleep, sleep_total < 16)
#Muestre los animales que duerman en total al menos 16 y pesen al menos 1
filter(msleep, sleep_total >= 16, bodywt >= 1)
#Muestre todos los primates o Perissodactyla
filter(msleep, order %in% c("Perissodactyla", "Primates"))
#Que son estos ultimos en lenguaje coloquial?: Mamíferos
#Use el operador pipe en todo lo que sigue.
#Muestre las columnas name y sleep_total, solo las primeras 5 filas
msleep %>% 
  select(name, sleep_total) %>% 
  head(5)
#Ordene por la columna "order" (muestre solo los primeros 5 elementos).
msleep %>% arrange(order) %>% head(5)
#Ordene por columna sleep_total
msleep %>% arrange(sleep_total)
#Cual es el animal que duerme menos?: Giraffe
msleep %>% arrange(sleep_total) %>% head(1)
  #Cual es el animal que duerme mas?: Little brown bat
msleep %>% arrange(sleep_total) %>% tail(1)
#Muestre las columnas name, order, sleep_total ordenadas en forma descendente de acuerdo a la columna order, cuando duerman por lo menos 10 (use el operador pipe).
msleep %>% 
  select(name, order, sleep_total) %>%
  arrange(order, desc(sleep_total)) %>% 
  filter(sleep_total >= 10)
#Agregar una columna al data frame con la proporcion de sleep_rem del total sleep_total.
msleep %>% 
  mutate(rem_proportion = sleep_rem / sleep_total) %>%
  head
#Agregar una columna con el peso en gramos
msleep %>% 
  mutate(rem_proportion = sleep_rem / sleep_total, 
         bodywt_grams = bodywt * 1000) %>%
  head
#Cual es el promedio del total de sueno?
msleep %>% 
  summarise(avg_sleep = mean(sleep_total))
  #Que animales se acercan mas a ese promedio?
msleep %>% 
  group_by(order) %>%
  summarise(avg_sleep = mean(sleep_total), 
            min_sleep = min(sleep_total), 
            max_sleep = max(sleep_total),
            total = n()) %>%
  arrange(avg_sleep)
  #Halle el promedio del total de sueno asi como el minimo y el maximo de los animales agrupados por orden.
msleep %>% 
  group_by(order) %>%
  summarise(avg_sleep = mean(sleep_total), 
            min_sleep = min(sleep_total), 
            max_sleep = max(sleep_total),
            total = n()) %>%
  arrange(avg_sleep)
#Que orden es el que duerme mas en promedio? 
msleep %>% 
  group_by(order) %>%
  summarise(avg_sleep = mean(sleep_total), 
            min_sleep = min(sleep_total), 
            max_sleep = max(sleep_total),
            total = n()) %>%
  arrange(avg_sleep) %>% tail(1)
#El que duerme menos?
msleep %>% 
  group_by(order) %>%
  summarise(avg_sleep = mean(sleep_total), 
            min_sleep = min(sleep_total), 
            max_sleep = max(sleep_total),
            total = n()) %>%
  arrange(avg_sleep) %>% head(1)
#Grafique sleep_total contra cada una de las demas variables, muestre cada uno de los ordenes en diferente color (use ggplot).
msleep
ggplot(msleep, aes(x = bodywt, y = sleep_total)) + geom_point()
#Encuentre que tan fuerte es la relacion lineal entre sleep_total y cada una de las demas variable. Ordene las variable de acuerdo a este valor.
sleepcat = ggplot(msleep, aes(x = vore, y = sleep_total, color = conservation))
sleepcat + geom_point()
#Que variable es la que mas determina el sueno total?: Bodywieght
#La variable que menos determina el sueno total?: Vore
