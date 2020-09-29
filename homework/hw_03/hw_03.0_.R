library("tidyverse")
install.packages("tidyverse")
##### HOMEWORK 2 #######

#### PART 1#######
class(TRUE,FALSE,FALSE)
class(c(TRUE,FALSE,FALSE))
class(c(1,2,3))
class(c(1.3, 2.4, 3.5))
class(c("a","b","c"))

###### PART 2 ######
class(c(1,2,"a") ### this would be a character vector because of the a 
class(c(TRUE,FALSE,2)) #### this is a numeric vector because booleans are stored as 0s and 1s, and 2 is a number as well

      
      