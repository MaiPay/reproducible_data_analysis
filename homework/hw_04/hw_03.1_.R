#### Payne Homework 3###
### all med enz activities.csv ###
getwd(~Documents/MICR490) ###  a bit confused with this
library("tidyverse")
read_csv("med_enz.csv")
med_enz <- "med_enz.csv"
read_csv("med_enz")
med_enz
med_enz <- read_csv("med_enz.csv") ### getting this to just be "med_enz" finally
med_enz ### ran this just to see if it works
class(c(med_enz)) ### list class
str(c(med_enz))### this is a list of 4 with number and character vectors, [1:324]
nrow(med_enz) ### there are 324 rows
glimpse(med_enz) 

med_plot <- ggplot(data= med_enz)+geom_histogram(aes(x= activity.nM.hr))
med_plot + ggtitle("Enzyme Activities in Sediments of the Mediterranean Sea")
print(med_plot) ### bar groaph saved and named
ggsave("med_plot", height = 3, width = 4, units = "in", dpi = 300)
rlang::last_error()
ggsave("med_plot", width = 5, height = 3) ### errors saving plots???, but the plots do show up in my plots on R
