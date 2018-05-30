
# hands-on programming with R
# garrett grolemund

# chapter 4

# R notation


deck

deck[,]



# positive integers

head(deck)

deck[1, 1]

deck[1, c(2, 3, 1)]

new <- deck[1, c(1, 2, 3)]

new

# repetition

deck[c(1, 1), c(1, 2, 3)]


vec <- c(6, 1, 3, 6, 10, 5)

vec

length(vec)

vec[2:5]

deck[1:2, 1:2]

deck[1:2, 1]

deck[1:2, 1, drop = FALSE]


# negative integers

vec

vec[5]

vec[2:5]

vec[-3]

vec[-c(3, 1, 2)]

deck[-(2:52), 1:3]

deck[-1, 1]


# blank space

deck[1, ]

deck[, 2]


# logical values

deck[1, c(TRUE, TRUE, FALSE)]

rows <- c(TRUE, F, F, F, F)

rows

deck[rows, ]

vec


indices <- c(FALSE, TRUE, FALSE, TRUE, FALSE, TRUE)

indices

vec[indices]

days <- c("monday", "tuesday", "wednesday", "thursday", "friday")

days

masktt <- c(FALSE, TRUE, FALSE, TRUE, FALSE)

days[masktt]

maskmwf <- c(TRUE, FALSE, TRUE, FALSE, TRUE)

days[maskmwf]

# names

deck[1, c("face", "suit", "value")]

# the entire value column
deck[, "value"]


deal <- function(cards){
  cards[1, ]
}

deal(cards = deck)

deal(deck)


# shuffle the deck

deck2 <- deck[1:52,]

deck2


deck3 <- deck[c(2, 1, 3:52), ]

deck3





deck <- DECK

deck[1, c(TRUE, TRUE, FALSE)]

rows <- c(TRUE, FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE, 
          FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE, 
          FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE, 
          FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE, 
          FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE, FALSE)

length(rows)

deck[rows, ]


# names

deck[1, c("face", "suit", "value")]


# deal a card

deal <- function(d){
  d[1, ]
}

deal(deck)

# shuffle the deck

deck2 <- deck[1:52, ]

deck2

deck3 <- deck[c(2, 1, 3:52), ]

deck3

random <- sample(1:52, size = 52)

random

deck4 <- deck[random, ]

deck4

shuffle <- function(cards){
  random <- sample(1:52, size = 52)
  cards[random, ]
}

deck2 <- shuffle(deck)
deal(deck2)

# dollar sign and double brackets

deck$value

deck$face

deck$suit


mean(deck$value)

median(deck$value)

sd(deck$value)

lista <- list(numbers = c(1, 2), logical = TRUE, strings = c("a", "b", "c"))

lista

lista[1]

typeof(lista[1])

sum(lista[1])


lista$numbers

sum(lista$numbers)

lista[[1]]

sum(lista[[1]])

lista

lista["numbers"]

sum(lista["numbers"])

lista[["numbers"]]

sum(lista[["numbers"]])




















