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
