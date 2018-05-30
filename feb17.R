
# 
# The Monty Hall Problem
# Simulation
# 

stick_door <- function() {
  prizes <- c("car", "goat", "goat")
  prizes
  
  set_prizes <- sample(prizes, 3, replace = FALSE)
  set_prizes
  
  doors <- c(1, 2, 3)
  choose_door <- sample(doors, 1, replace = FALSE)
  choose_door
  
  set_prizes[choose_door] == "car"
}

plays <- replicate(1000000, stick_door())
head(plays)

mean(plays)



switch_door <- function() {
    
  prizes <- c("car", "goat", "goat")
  prizes
      
  set_prizes <- sample(prizes, 3, replace = FALSE)
  set_prizes
      
  doors <- c(1, 2, 3)
  choose_door <- sample(doors, 1, replace = FALSE)
  choose_door
      
  goat_doors <- doors[set_prizes == "goat"]
  goat_doors
      
  available_doors <- setdiff(goat_doors, choose_door)
  available_doors
      
  if(length(available_doors) == 1){
    door_open <- available_doors    
  } else{
    door_open <- sample(available_doors, 1, replace = TRUE) 
    door_open
  }
  door_open
      
  new_door <- setdiff(doors, union(choose_door, door_open))
  new_door
      
  set_prizes[new_door] == "car"
}

    
f <- replicate(1000000, switch_door())
head(f)

mean(f)




