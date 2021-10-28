superstore <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")

library(dplyr)
library(assertive)
library(readr)
library(ggplot2)
library(stringr)
library(tidyr)

glimpse(superstore)
View(superstore)

# 1
superstore %>% filter(Category == 'Furniture', City == 'Los Angeles') %>% dplyr::summarise(avg = mean(Sales, na.rm = TRUE))
# 2
superstore %>% filter(Category == 'Furniture') %>% group_by(Region) %>% count(Category) 
# 3
superstore %>% filter(Ship.Mode == 'First Class', Sub.Category == 'Phones', City == 'Springfield') %>% select(Customer.Name,Segment)
# 4
superstore %>% filter(Sub.Category == 'Art') %>% group_by(City) %>% dplyr::summarise(Sum = sum(Sales, na.rm = TRUE)) %>% arrange(desc(Sum))
# 5
customer <- superstore %>% group_by(Customer.Name)%>% select(Customer.Name) %>%count() 
customer %>% filter(n > 25) %>% arrange(desc(n))
# 6
Home_office <- superstore %>% filter(Segment == 'Home Office', Category == 'Office Supplies') %>% select(Order.Date, City, Customer.Name)
Home_office %>% distinct()

#graph 1
New_YorkCat <- superstore %>% filter(City == 'New York City') 
CategoryNW <- table(New_YorkCat$Category)
barplot(CategoryNW)
barplot(CategoryNW,main = "Amount of sales each Category in New York City", xlab = "category", ylab = "Count",)

#graph 2
pie(table(superstore %>% select(Sub.Category) %>% filter(superstore$Category == 'Furniture', superstore$Region == 'Central')))
