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
install.packages("tidyr")

# Library
library(dplyr)
library(readr)
library(stringr)
library(tidyr)

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
#### Result :
```
Rows: 100
Columns: 14
$ Name              <chr> "Move to Heaven", "Hospital Playlist", "Flower of Evil", ~
$ Year.of.release   <int> 2021, 2020, 2020, 2018, 2017, 2020, 2015, 2016, 2021, 202~
$ Aired.Date        <chr> "May 14, 2021", "Mar 12, 2020 - May 28, 2020", "Jul 29, 2~
$ Aired.On          <chr> " Friday", " Thursday", " Wednesday, Thursday", " Wednesd~
$ Number.of.Episode <int> 10, 12, 16, 16, 16, 16, 20, 16, 12, 20, 16, 20, 20, 16, 6~
$ Network           <chr> "Netflix,  Netflix,  Netflix,  Netflix ", "tvN,  Netflix,~
$ Duration          <chr> "52 min.", "1 hr. 30 min.", "1 hr. 10 min.", "1 hr. 17 mi~
$ Content.Rating    <chr> "18+ Restricted (violence & profanity) ", "15+ - Teens 15~
$ Synopsis          <chr> "Geu Roo is a young autistic man. He works for his father~
$ Cast              <chr> "Lee Je Hoon, Tang Jun Sang, Hong Seung Hee, Jung Suk Yon~
$ Genre             <chr> "Life,  Drama,  Family ", "Friendship,  Romance,  Life,  ~
$ Tags              <chr> "Autism, Father-Son Relationship, Uncle-Nephew Relationsh~
$ Rank              <chr> "#1", "#2", "#3", "#4", "#5", "#6", "#7", "#8", "#9", "#1~
$ Rating            <dbl> 9.2, 9.1, 9.1, 9.1, 9.1, 9.0, 9.0, 9.0, 9.0, 9.0, 9.0, 9.~
```
## 2. Cleaning and Transformation dataset
### Our Steps 
1. Design and analyze to cleaning dataset
2. Cleaning and Transformation dataset

## 2.1 Design and analyze to cleaning dataset
```
1. Rank: Ranking on the website ****move to 1st,change type to int
2. Name: Korean Drama name
3. Year of release: Release year of the drama 
4. Aired Date: Aired Date (start) - (end) ****delete
5. Aired On: Aired on what day(s) of the week ****cleaning by excel (trim)
6. Number of Episode: How many episodes are there 
7. Network: What Network is the drama aired on ****cleaning by excel (distinct a data)
8. Duration: How long is one episode approximately
9. Content Rating: Content rate for appropriate audience
10. Synopsis: Short story of the drama ****delete
11. Cast: Actors and Actresses in the drama
12. Genre: Type the drama is listed in ****cleaning(change columnName)
13. Tags: Tags that the drama is listed in ****delete
14. Rating: Rating by the users on the website out of ten ****move to 4th
```

## 2.2 Cleaning and Transformation dataset
### Step 1 : Change ```Ranking``` by move to 1st column and change type to int and move ```Rating``` after column ```Year.of.release```(4th).
```
# Remove "#" then trim for remove a whitespace and change type charater to numeric 
kdrama$Rank <- kdrama$Rank %>% str_remove("#") %>% str_trim() %>% as.numeric()
# Check type 
is.numeric(kdrama$Rank)
# Relocate column Rank to first column then assign to kdrama 
kdrama <- kdrama %>% relocate(Rank,.before=Name)
# Relocate column Rank to fourth column then assign to kdrama 
kdrama <- kdrama %>% relocate(Rating,.after = Year.of.release)
```
### Step 2 : Delete ```Aired Date``` because Aired Date is unnecessary for our analyze.
```
# Delete column Aired.Date 
kdrama <- kdrama %>% select(-Aired.Date)
```
### Step 3 : ```Aired on``` and ```Network``` cleaning (remove duplicate data and trim a data)
```
# Cleaning data with Excel to distinct the infromation.
```
### Step 4 : Delete ```Synopsis``` (Short story of the drama) and ```Tags``` because it's unnecessary for our analyze.
```
# Delete column Synopsis
kdrama <- kdrama %>% select(-Synopsis)
# Delete column Tags
kdrama <- kdrama %>% select(-Tags)
```
### Step 5 : Rename column ```Genre``` to ```Type.of.drama``` for easier understanding.
```
# Rename column Genre to Type.of.drama
kdrama <- kdrama %>% rename(Type.of.drama = Genre)
```










