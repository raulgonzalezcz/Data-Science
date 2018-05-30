
# Chapter 5

# Modifying Values


# Changing Values in Place

vec <-c(0, 0, 0, 0, 0, 0)

vec

vec[1]

vec[1] <- 1000

vec

vec[c(1, 3, 5)] <- c(1, 1, 1)

vec
vec[9] <- 9

vec

deck

deck2 <- deck 

deck2

head(deck2, 13)

# aces
deck2[c(13, 26, 39, 52), ]

deck2[c(13, 26, 39, 52), 3]

deck2$value[c(13, 26, 39, 52)]

deck2$value[c(13, 26, 39, 52)] <- c(14, 14, 14, 14)

deck2

head(deck2, 13)


# logical subsetting

vec

values <- vec[c(FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE)]

values

vec[values]

# logical tests

1 > 2

1 > c(0, 1, 2)

c(1, 2, 3) == c(3, 2, 1)

1 %in% c(3, 4, 5)

c(1, 2) %in% c(3, 4, 5)

c(1, 2, 3) %in% c(3, 4, 5)

c(1, 2, 3, 4) %in% c(3, 4, 5)


deck2$face

deck2$face == "ace"

sum(deck2$face == "ace")


deck3$face == "ace"

deck3$value[deck3$face == "ace"]

deck3$value[deck3$face == "ace"] <- 14

# aces
deck3[deck3$face == "ace", ]

# hearts

deck4 <- deck

deck4$value <- 0

deck4

head(deck4, 13)

deck4$suit == "hearts"

deck4$value[deck4$suit == "hearts"]

deck4$value[deck4$suit == "hearts"] <- 1

tail(deck4, 13)

deck4[deck4$face == "queen" & deck4$suit == "spades", 3] <- 13

deck4

a <- c(1, 2, 3)

a

b <- c(1, 2, 3)

b

c <- c(1, 2, 4)

a == b

b == c

a == b & b == c

deck4$face == "queen" & deck4$suit == "spades"

queenSpades <- deck4$face == "queen" & deck4$suit == "spades"

queenSpades

deck4[queenSpades, ]


# Exercise page 87

w <- c(-1, 0, 1)
w

x <- c(5, 15)

x

y <- "February"
y

z <- c("Monday", "Tuesday", "Friday")
z


# is w positive ?
w > 0

# is x grater than 10 and less than 20 ?
x > 10 & x < 20

# Is object y the word February ?
y == "February"

# Is every value in z a day of the week?

week <- c("Monday", "Tuesday", "Wednesday", "Tursday", "Friday", "Saturday", "Sunday")
week

all(z %in% week)

#
# Blackjack
# 
# Each  number card has a  value equal to its face value.
#
# Each face card (king, queen, or jack) has a value of 10
#
# Each ace has a value of 11 or 1, depending on the
# final result of the game.
#

##-- Main -- ##
#Loading working directory
setwd("C:/Users/Raúl/Desktop/TSIII-Data Science")
#Reading a csv file
deck <- read.table("deck.csv", sep = ",", header = TRUE)

deck5 <- deck
deck5

facecard <- deck5$face %in% c("king", "queen", "jack")
facecard

deck5[facecard, ]

deck5$value[facecard] <- 10
deck5

head(deck5, 13)

# Missing Information

1 + NA

NA == 1

# na.rm

valores <- c(NA, 1:50)
valores

mean(valores)

mean(valores, na.rm = TRUE)


# is.na

NA == NA

c(1, 2, 3, NA) == NA

is.na(NA)

vec <- c(1, 2, 3, NA)
vec

is.na(vec)

deck5$face

deck5$face == "ace"

deck5$value[deck5$face == "ace"] <- NA


head(deck5, 13)


# let's play

shuffle <- function(cards){
  random <- sample(1:52, size = 52)
  cards[random, ]
}

play <- function(deck) {
  mazo <- shuffle(deck)
  values <- mazo$value[c(1, 2, 3)]
  sum(values)
}

play(deck)

replicate(10, play(deck))


# proportion of losses
mean(replicate(10000, play(deck)) > 21)

# proportion of wins
mean(replicate(10000, play(deck)) == 21)

# others
mean(replicate(10000, play(deck)) < 21)

















