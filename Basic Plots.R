# 3.3 Basic Plots
# library(dplyr)
library(dslabs)
data("murders")
library(tidyverse)
#.................plot.................

# let us create a simple scatterplot of total murders versus population
x <- murders$population /10^6
y <- murders$total
plot(x, y)
# For a quick plot that avoids accessing variables twice, 
# we can use the with function:
with(murders, plot(population, total))
# The function with lets us use the murders column names in the plot function. 
# It also works with any data frames and any function.

#.................hist.................

# to plot a histogram of murder rates
# remember that we used mutate function to create murder rate on the murders dataset
murders <- mutate(murders, rate = total / population * 100000)
z <- mutate(murders, rate = total / population * 100000)
B<- mutate(murders, B = total / population * 100000)
view(murders)
view(B)
# we can simply use the hist function to plot the histogram
hist(murders$rate)
# we can also use the function with to plot the hist
with(murders, hist(total/population ))
# looking at the histogram, We can see that there is a wide range of values 
# with most of them between 2 and 3 and one very extreme case with 
# a murder rate of more than 15:
# To identify which state has the maximum murder rate use the function max 
max(murders$rate)
# we can subset the state column by the output of which.max

which.max(murders$rate)
# the index of the maximum of murders$rate is 9
murders$state[9]
# the state at the index 9 
# (the state with maximum murder rate) is"District of Columbia"
# we can also use a function in a function to do the same thing
murders$state[which.max(murders$rate)]

#.................boxplots.................

# boxplots of murder rates by region


boxplot(rate~region, data = murders)

# Beyond the basics
install.packages(tidyverse)
## using packages 
library(tidyverse)
#library(dplyr)
library(ggplot2)
# to create a bar chart showing Number of Sates by Region
ggplot(murders,aes(x=region)) + geom_bar() +ggtitle("Number of Sates by Region")
# to create a bar chart showing Total Number Of Murder By Region
ggplot(murders,aes(x=region,y=total))+ geom_bar(stat ="identity")+ggtitle("Total Number Of Murder By Region")
# to create a bar chart showing Murder Rate By Region
ggplot(murders,aes(x=region,y=rate,fill=region))+ geom_bar(stat ="identity")+ggtitle("Murder Rate By Region") 
# to create a bar chart showing Murder Rate By Region(switch x& y values)
ggplot(murders,aes(x=rate,y=region,fill=region))+ geom_bar(stat ="identity")+ggtitle("Murder Rate By Region") 
