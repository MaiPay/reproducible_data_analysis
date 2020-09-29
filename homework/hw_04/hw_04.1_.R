########
# Script for Homework 4, Baby names data
########
library("tidyverse")
read_csv("chris_names_wide.csv")
d <- read_csv("chris_names_wide.csv")
d_long <- pivot_longer(d,
                       cols = -year,
                       names_to = "sex",
                       values_to = "n")
my_plot <- ggplot(data= d_long) + geom_point(mapping=aes(x=year,y=n,color=sex))
my_plot + ggtitle("Babies Named Chris")
print(my_plot) ### scatter plot
ggsave(filename= "my_plot/hwk_4_plot.png", plot=my_plot, height = 3, width = 4, units= "in", dpi = 300)

my_plot2 <- ggplot(data= d_long) + geom_smooth(mapping=aes(x=year,y=n,color=sex))
my_plot2 + ggtitle ("Babies Named Chris")
print(my_plot2) ### smooth line plot
ggsave(filename= "my_plot2/hwk_4_plot.png", plot=my_plot2, height = 3, width =4, units = "in", dpi = 300)

my_plot3 <- ggplot(data= d_long) + geom_boxplot(mapping=aes(x=sex,y=n,color=year))
my_plot3 + ggtitle("Babies Named Chris") ### Box Plot
ggsave(filename= "my_plot3/hwk_4_plot.png", plot=my_plot3, height = 3, width = 4, units= "in", dpi =300)
