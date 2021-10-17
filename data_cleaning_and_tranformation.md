# Data Cleaning and Data Transformation 
## from Top100 Korean Drama Dataset

## Overviews
1. Explore the Top 100 Korean Drama Dataset
2. Cleaning and Transformation dataset

## 1. Explore the Top 100 Korean Drama Dataset
### Our Steps
1. Loading Library and dataset
2. Explore the dataset

### Loading library and dataset
```
# Install package(for first time)
install.packages("dplyr")
install.packages("readr")
install.packages("stringr")

# Library
library(dplyr)
library(readr)
library(stringr)

# Dataset
kdrama <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/034-Top-100-Korean-Drama-MyDramaList/main/top100_kdrama.csv")
```
### Explore the dataset
```
# Explore the data set
View(kdrama) 
# or
glimpse(kdrama)
```

## 2. Cleaning and Transformation dataset
### Our Steps 
1. Design and analyze to cleaning dataset
2. Cleaning and Transformation dataset

## 2.1 Design and analyze to cleaning dataset
```
1. Rank: Ranking on the website****move to 1st,change type to int
2. Name: Korean Drama name
3. Year of release: Release year of the drama****graph
4. Aired Date: Aired Date (start) - (end)****delete
5. Aired On: Aired on what day(s) of the week
6. Number of Episode: How many episodes are there****graph
7. Network: What Network is the drama aired on****cleaning
8. Duration: How long is one episode approximately
9. Content Rating: Content rate for appropriate audience
10. Synopsis: Short story of the drama****delete
11. Cast: Actors and Actresses in the drama
12. Genre: Type the drama is listed in****cleaning(change columnName)
13. Tags: Tags that the drama is listed in****delete
14. Rating: Rating by the users on the website out of ten****move to 4th
```

## 2.2 Cleaning and Transformation dataset
### Step 1 : Ranking on the website move and change type to int and move Rating after Year.of.release 
```
# Remove "#" then trim for remove a whitespace and change type charater to numeric 
kdrama$Rank <- kdrama$Rank %>% str_remove("#") %>% str_trim() %>% as.numeric()
# Check type 
is.numeric(kdrama$Rank)
# Relocate colum Rank to first column then assign to kdrama 
kdrama <- kdrama %>% relocate(Rank,.before=Name)
# Relocate colum Rank to fourth column then assign to kdrama 
kdrama <- kdrama %>% relocate(Rating,.after = Year.of.release)
```
### Step 2 : Delete Aired Date because Aired Date it unnecessary for our analyze..
```
# Delete column Aired.Date 
kdrama <- kdrama %>% select(-Aired.Date)
```
### Step 3 : Network cleaning (remove duplicate data)
```

```
### Step 4 : Delete Synopsis (Short story of the drama) and Tags because it unnecessary for our analyze.
```
# Delete column Synopsis
kdrama <- kdrama %>% select(-Synopsis)
# Delete column Tags
kdrama <- kdrama %>% select(-Tags)
```
### Step 5 : Rename column Genre to Type.of.drama for easier understanding.
```
# Rename column Genre to Type.of.drama
kdrama <- kdrama %>% rename(Type.of.drama = Genre)
```










