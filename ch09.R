
#
# Hands-On Programming with R 
# Garret Grolemund
# 

# Chapter 9
# Loops

# for Loops 
# while Loops 
# repeat Loops


# Expected Values
# E(X) = Sum[ x * p(x) ]

die <- c(1, 2, 3, 4, 5, 6)
die

# 
# 1. Listed out all of the possible outcomes 
# 2. Determined the value of each outcome
# (here just the value of the die)
# 3. Calculate the probability that each outcome occurred
#

pr <- 1/6 * c(1, 1, 1, 1, 1, 1)
pr

ev <- sum(die * pr)
ev

# expand.grid
# write out every combination
# of the elements in n vectors.

rolls <- expand.grid(die, die)
rolls

expand.grid(die, die, die)

rolls$value <- rolls$Var1 + rolls$Var2
rolls

head(rolls, 3)
tail(rolls, 3)

#
# The probability that n independent, random events 
# all occur is equal to the product of the probability
# that each random event occurs.
# 

prob <- c("1" = 1/8, "2" = 1/8, "3" = 1/8, "4" = 1/8, "5" = 1/8, "6" = 3/8)
prob

sum(prob)

rolls$Var1

prob[rolls$Var1]

rolls$prob1 <- prob[rolls$Var1]

rolls

head(rolls, 3)
tail(rolls, 3)

head(rolls, 7)
tail(rolls, 7)

rolls$prob2 <- prob[rolls$Var2]

rolls

head(rolls, 3)
tail(rolls, 3)

rolls$prob <- rolls$prob1 * rolls$prob2

rolls

head(rolls, 3)
tail(rolls, 3)

ev <- sum(rolls$value * rolls$prob)

ev

# Expected value of the slot machine prize 
# 
# 1. We will list out every possible outcome
# of playing the machine.
# This will be a list of every combination
# of three slot symbols.
# 2. We will calculate the probability
# of getting each combination when you play
# play the machine.
# We will determine the prize that we would
# win for each combination.
#


# Exercise 
# page 162
# 
# Use expand.grid to make a data frame
# that contains every possible combination
# of three symbols from the wheel vector: 
# 
# wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
# 
# Be sure to add the argument stringAsFactors = FALSE
# to your expand.grid call;
# otherwise, expand.grid will save the combinations
# as factors, an unfortunate choice that will
# disrupt the score function.
#

wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
wheel

combos <- expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)

head(combos, 10)
tail(combos, 10)


get_symbols <- function(){
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE, 
         prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}

get_symbols()

# Exercise 
# page 163
# 
# Isolate the previous probabilities in
# a look up table.
# What name will you use in your table?

prob <- c("DD" = 0.03, "7" = 0.03, "BBB" = 0.06, "BB" = 0.1, "B" = 0.25, "C" = 0.01, "0" = 0.52)
prob

sum(prob)

prob["DD"]
unname(prob["DD"])

# Exercise 
# page 163
# 
# Look up the probabilities of
# getting the values in Var1.
# Then add them to combos as a column named prob1. 
# Then do the same for Var2 (prob2) and Var3 (prob3).
# 

head(combos)

combos$prob1 <- prob[combos$Var1]
head(combos)

combos$prob2 <- prob[combos$Var2]
head(combos)

combos$prob3 <- prob[combos$Var3]
head(combos)


# Exercise 
# page 164
# 
# Calculate the overall probabilities for each combination.
# Save them as a column named prob in combos, then check your work.
# You can check that the math worked by summing the probabilities.
# The probabilities should add up to one, because one of the
# combinations must appear when you play the slot machine.
# In other words, a combination will appear, with probability of one.
#

combos$prob <- combos$prob1 * combos$prob2 * combos$prob3

head(combos)
tail(combos)

sum(combos$prob)


symbols <- c(combos[1, 1], combos[1, 2], combos[1, 3])
symbols

sc <- score(symbols)
sc

#
# for Loops
#
# for(value in sequence){
#   do this
# }

for (i in c(3, 9, 2)) {
  print(i)
}

for (value in c("my", "first", "for", "loop")) {
  print(value)
}

chars <- vector(length = 4)
chars

words <- c("my", "second", "for", "loop")
words

for (i in 1:4) {
  chars[i] <- words[i]
}

chars



combos$prize <- NA

head(combos)
tail(combos)

# Exercise 
# page 168
# 
#  Construct a for loop that will run score
# on all 343 rows of combos.
# The loop should run score on the first
# three entries of the ith row of combos
# and should store the results in the
# ith entry of combos$prize
#

for (i in 1:nrow(combos)) {
  symbols <- c(combos[i, 1], combos[i, 2], combos[i, 3])
  combos$prize[i] <- score(symbols)
}

head(combos, 20)
tail(combos, 20)

sum(combos$prize * combos$prob)

# Challenge 
# page 169
# 
# There are many ways to modify score that
# would count DD as wild.
# If you would like to test your skill as
# an R programmer, try to write your own
# version of score that correctly handles diamonds.
# If you would like a more modest challege,
# study the following score code.
# It accounts for wild diamonds in a way
# that I find elegant and succinct.
# See if you can undestand each step in the code
# and how it achieves its result.
#


score <- function(symbols){
  
  diamonds <- sum(symbols == "DD")
  cherries <- sum(symbols == "C")
  
  # identify case
  # since diamonds are wild, only nondiamonds
  # matter for three of a kind and all bars
  
  slots <- symbols[symbols != "DD"]
  print(slots)
  same <- length(unique(slots)) == 1
  bars <- slots %in% c("B", "BB", "BBB")
  
  # assign prize
  
  if(diamonds == 3){
    prize <- 100
  } else if(same){
    payouts <- c("7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
    prize <- unname(payouts[slots[1]])
    print(prize)
  } else if(all(bars)){
    prize <- 5
  } else if(cherries > 0){
    # diamonds count as cherries
    # so long as there is one real cherry
    prize <- c(0, 2, 5)[cherries + diamonds + 1]
  } else {
    prize <- 0
  }
  
  # double for each diamond
  prize * 2^diamonds
}

symbols <- get_symbols()
symbols
score(symbols)



# Exercise
# page 170
# Calculate the expected value of the slot machine
# when it uses the new score function.
# You can use the existing combos data frame,
# but you will need to build a for loop to
# recalculate combos$prize
#

head(combos)
tail(combos)

for (i in 1:nrow(combos)) {
  symbols <- c(combos[i,1], combos[i, 2], combos[i, 3])
  print(score(symbols))
}

nrow(combos)

for (i in 1:nrow(combos)) {
  symbols <- c(combos[i,1], combos[i, 2], combos[i, 3])
  combos$prize[i] <- score(symbols)
}

combos$prize

head(combos, 20)
tail(combos, 20)

ev <- sum(combos$prize * combos$prob)
ev


#
# while Loops
# page 170
#
# while(condition){
#   code
# }
#

value <- 0
while(value < 10){
  print(value)
  value <- value + 1
}

plays_till_broke <- function(start_with){
  cash <- start_with
  n <- 0
  while (cash > 0) {
    cash <- cash - 1 + play()
    n <- n + 1
  }
  n
}

plays_till_broke(100)


#
# repeat Loops
#

plays_till_broke <- function(start_with){
  cash <- start_with
  n <- 0
  repeat{
    cash <- cash - 1 + play()
    n <- n + 1
    if(cash <= 0){
      break
    }
  }
  n
}

plays_till_broke(100)

