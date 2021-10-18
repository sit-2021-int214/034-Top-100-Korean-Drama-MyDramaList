setwd("D:/1-64/Git/INT214_Stat")
getwd()
dir()

superstore <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")
library(dplyr)
library(readr)
library(ggplot2)
library(stringr)


View(superstore)
glimpse(superstore)

##part 2

install.packages("lubridate")
library(lubridate, warn.conflicts = FALSE)
ymd(20101215)
#> [1] "2010-12-15"
mdy("4/1/17")
#> [1] "2017-04-01"


##part 3

#1. Find the customer name that bought the category furniture.
Furniture <- superstore  %>% filter(superstore$Category == "Furniture" )
Furniture %>% distinct(Furniture$Customer.Name) 
# This is the all name of customer that bought the category furniture and total customer that bought the category furniture is 705.

#2. How many city of customer are there. And where is the most place that customer has buy the stuff?
city <- superstore %>% select(City) %>% count(City) %>% rename(number = n)
city
max_cus <- max(city$number, na.rm = TRUE)
city %>% filter(city$number == max_cus )
#They has 500 city that customer has lived but New York City has a most customer. 

#3. Find the total customer that just a normal person who had bought the stuff.
superstore %>% count(Segment) %>% filter(Segment == "Consumer") %>% rename(total_cus = n)
# The number of customer that is just consumer  are 5101 people

#4. How many total sales in 2015?
superstore %>% mutate(year = year(dmy(superstore$Order.Date))) %>% filter(year==2015) %>% count() %>% rename(total_sale = n)
# Amount of order in 2015 is 1953 orders.

#5. From 4. how much the Super store got a money in 2015 ?
order2015 <- superstore %>% mutate(year = year(dmy(superstore$Order.Date))) %>% filter(year==2015) 
sum(order2015$Sales)
# The money they've got from sale the product in 2015 is 479856.2 .

#6. Find the product name that have a most sold in this dataset.
#year = year(dmy(superstore$Order.Date))
max_sale <- superstore %>% group_by(Product.Name) %>% summarise(total_sale = sum(Sales)) 
max_sale %>% select(Product.Name,total_sale) %>% filter(total_sale == max(max_sales$total_sales,na.rm=TRUE))

# Canon imageCLASS 2200 Advanced Copier is the most sold in this dataset.

#part4

##pie chart
# Create Data
group = c(superstore %>% distinct(Segment))
value = c(superstore %>% count(Segment) %>% select(n))
group <- as.character(unlist(group)) 
value <- as.numeric(unlist(value)) 
data <- data.frame(group,value)
head(data)
typeof(group)
typeof(data)

## Basic pie chart
# create bar plot
bp <- ggplot(data, aes(x="", y=value, fill=group))+ geom_bar(width = 1, stat = "identity")
bp
# put bar plot to pie
pie <- bp + coord_polar("y", start=0)
pie

## Scatter plot
superstore %>% ggplot(aes(x=Row.ID,y=Sales))+geom_point()
superstore %>% filter(Sales>1000) %>% ggplot(aes(x=Row.ID,y=Sales)) + geom_point()
scat_plot <- superstore %>% filter(Sales>1000) %>% ggplot(aes(x=Row.ID,y=Sales))+
  geom_point(aes(color= Category))
scat_plot
scat_plot+geom_smooth()




