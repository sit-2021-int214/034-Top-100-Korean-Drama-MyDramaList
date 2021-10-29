# Part 1 

# Library
library(dplyr)
library(readr)
library(ggplot2)
library(DescTools)

# Dataset
Progbook <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

View(Progbook)
Glimpse(Progbook)

# Part 2 Tidyverse
Progbook %>% slice_max(Number_Of_Pages)

# Part 3 
# [1] หนังสือที่มีราคาน้อยที่สุด มีการรีวิวอยู่ที่เท่าไหร่
Progbook %>% select(Book_title, Price, Reviews) %>% slice_min(Price)

# [2] หนังสือเล่มใดมีจำนวนหน้ามากที่สุด 5 อันดับ
Progbook %>% select(Book_title, Number_Of_Pages) %>% slice_max(Number_Of_Pages, n=5)

# [3] หนังสือที่มีการรีวิวมากกว่า 1000 เล่มใดมีราคามากที่สุด
Progbook %>% select(Book_title, Reviews, Price) %>% filter(Reviews > 1000) %>% slice_max(Price)

# [4] ค่าเฉลี่ยราคาของหนังสือประเภท ebook อยู่ที่เท่าไหร่
Progbook %>% filter(Type == 'ebook') %>% summarise(avg = mean(Price, na.rm = TRUE)) 

# [5] หนังสือที่มีราคามากที่สุดโดยมี Rating มากกว่า 4
Progbook %>% select(Book_title, Price, Rating) %>% filter(Rating > 4) %>% slice_max(Price)

# [6] หนังสือแต่ละประเภทมีอะไรบ้าง
Progbook %>% count(Type)



#Part 4 Graph

# กราฟความสัมพันธ์ระหว่าง Reviews และ Rating
scat_plot <- Progbook %>% ggplot(aes(x=Rating,y=Reviews))+geom_point(aes(color=Type))
scat_plot

# แผนภูมิแท่งแสดงประเภทของหนังสือต่างๆ
scat_plot1 <- Progbook %>% ggplot(aes(x=Type)) + geom_bar(aes(color=Type))
scat_plot1
                                                         


