topcombook <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
library(dplyr)
library(tidyr)
library(readr)
install.packages("ggplot2")
library(ggplot2)

glimpse(topcombook)
View(topcombook)

#top3 rating
topcombook %>% select(Rating,Book_title) %>% arrange(desc(Rating)) %>% head(3)
 #1 Your First App: Node.js
 #2 The Art of Computer Programming, Volumes 1-4a Boxed Set
 #3 Designing Data-Intensive Applications: The Big Ideas Behind Reliable, Scalable, and Maintainable Systems


#book have price <10.0
topcombook %>% select(Price,Book_title ) %>% filter(Price < 10.0)
 #1 9.323529 The Elements of Style


#how many ebook 
topcombook %>% select(Type) %>% count(Type) %>% filter(Type == "ebook")
  #Type  n
  #ebook 7



#max of Number_Of_Pages
topcombook %>% select(Book_title,Number_Of_Pages) %>% arrange(desc(Number_Of_Pages)) %>% head(1)
 # Book_title                                              Number_Of_Pages
 # The Art of Computer Programming, Volumes 1-4a Boxed Set            3168


#ชื่อหนังสือประเภท hardcoverที่มีRatingสูงที่สุด
topcombook %>% select(Book_title,Rating,Type) %>% filter(Type == "Hardcover") %>% arrange(desc(Rating)) %>% head(1) #%>% filter(Type == "Hardcover")
  # Book_title                                              Rating Type
  # The Art of Computer Programming, Volumes 1-4a Boxed Set   4.77 Hardcover


#ชื่อหนังสือที่มีRatingต่ำที่สุด
topcombook %>% select(Rating,Book_title) %>% arrange(desc(Rating)) %>% tail(1)
 #Rating Book_title
 #    3  Lambda-Calculus, Combinators and Functional Programming

#ค่าเฉลี่ยRatingและจำนวนหน้าของหนังสือแต่ละประเภท
topcombook %>% group_by(Type) %>% summarise(Number_Of_Pages = mean(Number_Of_Pages,na.rm = T),Rating = mean(Rating,na.rm=T))
#Type                  Number_Of_Pages Rating
#<chr>                           <dbl>  <dbl>
#1 Boxed Set - Hardcover            896    4.49
#2 ebook                            386    4.29
#3 Hardcover                        614.   4.06
#4 Kindle Edition                   283.   4.01
#6 Unknown Binding                  249    3.99 


#Scatter Plot
topbook_plot <- topcombook %>% select(Rating,Type,Price) %>% arrange(desc(Rating)) %>% head(50) %>% ggplot(aes(x=Price,y=Rating))+
  geom_point(aes(color=Type))

# Adding component
topbook_plot + ggtitle("Rating of Top 50 Computer Science/Programing Books") +
  xlab("Price book") + ylab("Rating") +geom_smooth(method="lm")

topbook_plot2 <- topcombook %>% select(Number_Of_Pages,Book_title,Rating )%>% arrange(desc(Rating)) %>% head(10) %>% ggplot(aes(x=Book_title ,y=Number_Of_Pages))+
  geom_point()
topbook_plot2 + ggtitle("Number_Of_Pages of Top 10 Computer Science/Programing Books") + xlab("book name") + ylab("Number_Of_Pages")

