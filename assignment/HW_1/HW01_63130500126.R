#Exercise 1
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)

sum(x) #47.2

median(x) #6.40
sd(x) #7.33846
length(x) #5
var(x) #53.853
mean(x) #9.44
summary(x) # Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
           #3.10    5.60    6.40    9.44   10.40   21.70 

#Exercise 2
names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

years <- c(2008,2008,2010,2011,2011,2012,rep(2013:2016,each=2),
           rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))

#2.1
marvel_movies <- data.frame(names,years)
marvel_movies #Use data.frame because of data in "names" have a relation with data in "years".So, It's easy to stored.

#2.2
#The number of movies
length(names) #27
#Finding the 19th movies name
print(names[19]) #"Avengers: Infinity War"
#Which year is most released movies
View(marvel_movies)
#2017,2021