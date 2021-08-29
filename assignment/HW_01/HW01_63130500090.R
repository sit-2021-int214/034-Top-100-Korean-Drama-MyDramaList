#1. Exercise 1
ans1 <-c(10.4,5.6,3.1,6.4,21.7)
summary(ans1)
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#3.10    5.60    6.40    9.44   10.40   21.70 
mean(ans1)
#9.44
sum(ans1)
#47.2
median(ans1)
# 6.4
sd(ans1)
#7.33846
var(ans1)
#53.853
#-------------------------------------------------
#2.Exercise 2
names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")
years <- c(2008,2008,2010,2011,2011,2012,2013,2013,2014,2014,2015,2015,2016,2016,
           2017,2017,2017,2017,2018,2018,2019,2019,2019,2021,2021,2021,2021)
marvel_movies <-data.frame(marvelmovies = names,yearmovies = years)
View(marvel_movies)
#Choose the data structure as Dataframe because when the view comes out, the movie title and release year will match.
#-----------------------------------------------
#2.2 Exercise 2.2
length(names)
#27
print (names[19])
# "Avengers: Infinity War"
View(marvel_movies)
#The year with the most movies was 2017 and 2021.