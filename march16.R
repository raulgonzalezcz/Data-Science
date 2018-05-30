



rm(list = ls())

library(tidyverse)
library(ggplot2)

galton <- read.csv("galton.csv", check.names = FALSE)

head(galton)
tail(galton)
dim(galton)
n <- dim(galton)[1]
n
glimpse(galton)
summary(galton)

x <- galton$parent
x

xbar <- mean(x)
xbar

s2x <- sum((x - xbar)^2) / n
s2x


y <- galton$child
y

ybar <- mean(y)
ybar

cxy <- sum((x - xbar)*(y - ybar)) / n
cxy

cov(x, y)

b <- cxy / s2x
b

a <- ybar - b*xbar
a

child.parent <- lm(galton$child ~ galton$parent)
child.parent


ggplot(galton, aes(x = galton$parent, y = galton$child)) +
  geom_point(size = 0.3, colour = "blue") +
  xlab("Parent") +
  ylab("Child") +
  geom_smooth(method = "lm", se = TRUE, color = 'yellow') +
  theme_bw()

totalError <- function(x, y, a, b){
  yhat <- a + b*x
  e <- (yhat - y)^2
  err <- sum(e)
}

te <- totalError(x, y, ybar, 0)
te

te <- totalError(x, y, ybar-xbar, 1)
te

# linear regression
ar <- child.parent$coefficients[1]
ar

br <- child.parent$coefficients[2]
br

te <- totalError(x, y, ar, br)
te




