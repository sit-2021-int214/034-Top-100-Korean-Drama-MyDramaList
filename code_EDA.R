library(readr)
library(dplyr)
library(tidyr)
library(stringr)
kdrama <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/034-Top-100-Korean-Drama-MyDramaList/main/top100_kdrama.csv")
View(kdrama)

glimpse(kdrama)

#step1 Rank: Ranking on the website****move,change type to int and move Rating after Year.of.release 
kdrama$Rank <- kdrama$Rank %>% str_remove("#") %>% str_trim() %>% as.numeric()
is.numeric(kdrama$Rank)
kdrama <- kdrama %>% relocate(Rank,.before=Name)
kdrama <- kdrama %>% relocate(Rating,.after = Year.of.release)

#step2 Aired Date: Aired Date (start) - (end)****delete
kdrama <- kdrama %>% select(-Aired.Date)

#step3 Network: What Network is the drama aired on****cleaning
x <- kdrama %>%  select(Network) %>% unnest
f <- data.frame()
View(x)

#step4 Synopsis: Short story of the drama****delete and Tags: Tags that the drama is listed in****delete
kdrama <- kdrama %>% select(-Synopsis)
kdrama <- kdrama %>% select(-Tags)

#step5 Rename Genre to Type.of.drama
kdrama <- kdrama %>% rename(Type.of.drama = Genre)


