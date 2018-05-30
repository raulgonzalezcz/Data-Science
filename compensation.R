
install.packages("tidyverse")
#install "tidyverse"

library(tidyverse)
library(dplyr)
library(ggplot2)
compensation <- read.csv("compensation.csv")
glimpse(compensation)

#dplyr verbs
head(compensation)
names(compensation)
select(compensation, Fruit)
select(compensation, Fruit, Grazing)
select(compensation, -Root)

slice(compensation, 2)
slice(compensation, 2:10)
slice(compensation, c(2,3,10))


#filter
filter(compensation, Fruit > 80)
dim(filter(compensation, Fruit > 80 | Fruit < 40))
dim(filter(compensation, Fruit > 80 & Grazing == "Grazed"))
dim(filter(compensation, Fruit < 20 | Grazing == "Ungrazed"))
summary(compensation)

#sorting
arrange(compensation, Fruit)
arrange(compensation, Root)
