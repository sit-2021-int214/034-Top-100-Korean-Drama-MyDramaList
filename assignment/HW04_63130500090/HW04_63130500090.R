setwd("C:\Users\Administrator\034-Top-100-Korean-Drama-MyDramaList\assignment\HW04_63130500090")
getwd()
dir()

install.packages("dplyr")
install.packages("readr")
install.packages("ggplot2")
install.packages("stringr")
install.packages("lubridate")

library(dplyr)
library(readr)
library(ggplot2)
library(stringr)
library(lubridate)


superstore <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")

glimpse(superstore)
View(superstore)


install.packages("lubridate")
library(lubridate, warn.conflicts = FALSE)
mdy(281101)
#[1] "2001-11-28"

mystring <- ("63130500090 Pataradanai Deeruksa Tle")
word(mystring,3)
#[1] "Deeruksa"
word(mystring,-1:-2)
#[1] "Tle"      "Deeruksa"
word()

#1.Find the customer name that bought the state Kentucky.
Kentucky <- superstore %>% filter(superstore$State == "Kentucky" )
Kentucky %>% distinct(Kentucky$Customer.Name)

#2.Find the customer name,order date,ship date and sale at sales less than 10.
#And the sum of customers with less than 10 sales.
sum(superstore$Sales < 10)
superstore %>% select(Customer.Name, Order.Date , Ship.Date , Sales) %>% filter(superstore$Sales < 10)

#3.Find the maximum and minimum values of sales and show product name.
maxsale <- max(superstore$Sales)
minsale <- min(superstore$Sales)

superstore %>% select(Product.Name,Sales) %>% filter(superstore$Sales == maxsale)
superstore %>% select(Product.Name,Sales) %>% filter(superstore$Sales == minsale)

#4.Find the total sales in 2018.
superstore %>% mutate(year = year(dmy(superstore$Order.Date))) %>% filter(year==2018) %>% count() %>% rename(totalsales = n)

#5.Find the total sales of each city. How much  can you sell?
superstore %>% group_by(City) %>% summarise(sum(Sales)) %>% rename(Total_Amount = `sum(Sales)`)

#6.Unique search for the first 10 customer names.
superstore %>% distinct(Customer.Name) %>% head(10)


#part GGplot
#1
bar_plot <- ggplot(superstore,aes(x=Category)) + geom_bar(color="skyblue",fill="green",alpha=0.5)
bar_plot

# Adding component
bar_plot + ggtitle("Number of total sales in each category") +
  xlab("Category") + ylab("Number of sales")
#2
# Create test data.
group = c(superstore %>% distinct(Region))
value = c(superstore %>% count(Region) %>% select(n))
group <- as.character(unlist(group)) 
value <- as.numeric(unlist(value)) 
data <- data.frame(group,value)

# Create bar plot
bp <- ggplot(data, aes(x="", y=value, fill=group))+ geom_bar(width = 1, stat = "identity")
# put bar plot to pie
pie <- bp + coord_polar("y", start=0)
pie

