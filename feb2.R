prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52)
sum(prob)


get_symbols <- function(){
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE, prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}

get_symbols()

get_symbols()

play <- function(){
  symbols <- get_symbols()
  print(symbols)
  score(symbols)
}

play()


# Strategy

# 1. Beak complex tasks into
# simple subtasks

# 2. Use concrete examples

# Describe your solutins in English,
# then convert them to R.


# Sequential Steps

play <- function(){
  
  # step 1: generate symbols
  symbols <- get_symbols()
  
  # step 2: display the symbols
  print(symbols)
  
  # step 3: score the symbols
  score(symbols)
}

play()

# If Statements

num <- -7

if(num < 0){
  num <- num * -1
}

num

num <- -1

if(num < 0){
  print("num is negative.")
  print("don't worry, I'll fix it.")
  num <- num * -1
  print("Now num is positive.")
}

num

# Quiz A

x <- 1
if(3 == 3){
  x <- 2
}

x

# Quiz B

x <- 1
if(TRUE){
  x <- 2
}

x

# Quiz C

x <- 1
if(x == 1){
  x <- 2
  if(x == 1){
    x <- 3
  }
}

x


# else Statements

a <- 3.14
a

dec <- a - trunc(a)
dec

if(dec >= 0.5){
  a <- trunc(a) + 1
}else{
  a <- trunc(a)
}

a

a <- 1
b <- 1

if(a > b){
  print("A wins")
} else if(a < b){
  print("B wins")
} else{
  print("Tie")
}



"if( 1) Case 1: all the same){
2)  prize <- look up the prize
}
else if( 3) Case 2: all bars){
4) prize <- assign $5
}
else{
5) Count cherries
6) pize <- calculate a prize
}

7) count diamonds
8) double the prize if necessary"



score <- function(symbols){
  
  # calculate a prize
  
  prize
}

symbols <- c("7", "7", "7")
symbols

symbols <- c("B", "BB", "BBB")
symbols

symbols <- c("C", "DD", "0")
symbols





#
# A vector named symbols will contain three 
# of the same symbol if the first element of
# symbols is equal to the second element of
# symbols and the second element of symbols
# is equal to the third element of symbols.
#


#
# Exercise 
# page 128.
#
# Turn the preceeding statement into a
# logical test written in R.
# Use your knowledge of logical tests,
# Boolean operators, and subsetting.
# The test should work with the vector
# symbols and return a TRUE if and only if
# each element in symbols is the same.
# Be sure to test your code on symbols.
#

symbols <- c("7", "7", "7")
symbols


symbols[1] == symbols[2] & symbols[2] == symbols[3]


all(symbols == symbols[1])

length(unique(symbols)) == 1

same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
same

# if(same){
#   prize <- # look up the prize
# } else if(# Case 2: all bars){
#   prize <- # assign $5
# } else {
#   # count cherries
#   prize <- # calculate a prize
# }

# count diamonds 
# double the prize if necessary


symbols <- c("B", "BB", "BBB")
symbols

# Exercise
# page 130
# Use R's logical and Boolean operators
# to write a test that will determine
# whether a vector named symbols contains
# only symbols that are a type of bar.
# Check whether your test works with 
# our example symbols vector.
# Remember to describe how the test
# should work in English, and convert the
# solution to R.

symbols[1] == "B" | symbols[1] == "BB" | symbols[1] == "BBB" &
  symbols[2] == "B" | symbols[2] == "BB" | symbols[2] == "BBB" &
  symbols[3] == "B" | symbols[3] == "BB" | symbols[3] == "BBB" &
  
  
  all(symbols %in% c("B", "BB", "BBB"))

same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]

bars <- symbols %in% c("B", "BB", "BBB")

# if(same){
#   prize <- # look up the prize
# } else if(all(bars)){
#   prize <- # assign $5
# } else {
#   # count cherries
#   prize <- # calculate a prize
# }

# count diamonds 
# double the prize if necessary

if(same){
  symbol <- symbols[1]
  if(symbol == "DD"){
    prize <- 800
  } else if(symbol == "7"){
    prize <- 80
  } else if(symbol == "BBB"){
    prize <- 40
  } else if(symbol == "BB"){
    prize <- 5
  } else if(symbol == "B"){
    prize <- 10
  } else if(symbol == "C"){
    prize <- 10
  } else if(symbol == "0"){
    prize <- 0
  } 
}


# Lookup Tables
# page 132


payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)

payouts

payouts["DD"]

payouts["B"]

unname(payouts["DD"])

symbols <- c("7", "7", "7")
symbols

symbols[1]

payouts[symbols[1]]

unname(payouts[symbols[1]])

symbols <- c("7", "7", "7")

payouts[symbols[1]]

prize <- unname(payouts[symbols[1]])
prize

symbols <- c("C", "DD", "C")

symbols == "C"

sum(symbols == "C")

sum(symbols == "DD")


score <- function(symbols){
  
  # identify case
  same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
  bars <- symbols %in% c("B", "BB", "BBB")
  
  # get prize
  if(same){
    payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
    prize <- unname(payouts[symbols[1]])
  } else if(all(bars)){
    prize <- 5
  } else{
    cherries <- sum(symbols == "C")
    prize <- c(0, 2, 5)[cherries + 1]
  }
  
  # adjust for diamonds
  diamonds <- sum(symbols == "DD")
  prize * 2 ^ diamonds
}


play <- function(){
  symbols <- get_symbols()
  print(symbols)
  score(symbols)
}

play()


# Exercise
# page 134
# 
# How can you tell which elements of a vector
# named symbols are a C?
# Devise a test and try it out.


# Challenge
# page 134
# How might you count the number of Cs in a vector
# named symbols?
# Remember R's coercion rules. 

symbols <- c("C", "DD", "C")
symbols

symbols == "C"

sum(symbols == "C")

sum(symbols == "DD")

same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
bars <- symbols %in% c("B", "BB", "BBB")

if(same){
  payouts <- c("DD" = 100, "7" == 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  
  prize <- unname(payouts[symbols[1]])
} else if(all(bars)){
  prize <- 5
} else {
  cherries <- sum(symbols == "C")
  prize <- 0 # calculate a prize
}

diamonds <- sum(symbols == "DD")
# double the prize if necessary

c(0, 2, 5)

c(0, 2, 5)[1]

cherries + 1