

rm(list = ls())

library(tidyverse)
library(ggplot2)

galton <- read.csv("galton.csv", check.names = FALSE)

head(galton)
tail(galton)
dim(galton)
glimpse(galton)
summary(galton)


nombres <- colnames(galton)
nombres <- nombres[-1]
nombres

medias <- colMeans(galton)
medias <- medias[-1]
medias


ggplot(galton, aes(x = galton$parent, y = galton$child)) +
  geom_point(size = 0.3, colour = "blue") +
  xlab("Parent") +
  ylab("Child") +
  theme_bw()


child.parent <- lm(galton$child ~ galton$parent)

child.parent


ggplot(galton, aes(x = galton$parent, y = galton$child)) +
  geom_point(size = 0.3, colour = "blue") +
  xlab("Parent") +
  ylab("Child") +
  geom_smooth(method = "lm", se = TRUE, color = 'yellow') +
  theme_bw()












