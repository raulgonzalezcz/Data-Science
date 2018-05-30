install.packages("fivethirtyeight")
# Using the fivethirtyeight package

library(fivethirtyeight)
library(tidyr)
library(tibble)
library(dplyr)
murder_2015_final

# See names of columns 

names(murder_2015_final)

# Load murder_2015_final package and gather into a tibble

murders_gathered <- murder_2015_final %>% 
  gather(
    murder_year,
    murders,
    murders_2014:murders_2015,
    na.rm = TRUE)
murders_gathered

# Arrange alphabetically by state and city

murders_arranged <- murders_gathered %>% 
  arrange(
    state, 
    city)
murders_arranged

# Separate murder_year into murder and year

murders_separate <- murders_arranged %>%
  separate(
    murder_year,
    into = c("text", 
             "year")
  )
murders_separate

# Use spread and arrange to put year into two columns

murders_spread <- murders_separate %>% 
  spread(
    year,
    murders
  ) %>% 
  arrange(
    state,
    city)
murders_spread

# Use unite to paste one column into another

murders_final <- murders_spread %>%
  unite(
    city_state, 
    city, 
    state) %>% 
  arrange(
    city_state
  ) %>% 
  select(
    -(text)
  )
murders_final

# Write this tibble to a csv

write.csv(murders_final, file = "murders_final.csv",row.names=FALSE, na="")
 #quick barplot of the change in murders by city.
barplot(murders_final$change)

#Arrange it

murders_final_sort <- murders_final %>% 
  arrange(
    change)
murders_final_sort


barplot(murders_final_sort$change,
        ylim = c(-20, 120))

midpts <- barplot(murders_final_sort$change,
                  cex.axis = 1.0, cex.names = 0.6,
                  ylim = c(-20, 120), main = "Change in murders from 2014 to 2015"
)

text(murders_final_sort$city_state,
     x = midpts,
     offset = -0.1,
     y = -20,
     cex = 0.5,
     srt = 60,
     xpd = TRUE,
     pos = 2
) 
