#Execise 1
 e1 <- c(10.4, 5.6, 3.1, 6.4, 21.7)
 mean(e1)    # = 9.44
 sum(e1)     # = 47.2
 median(e1)  # = 6.4
 sd(e1)      # = 7.33846
 var(e1)     # = 53.853
 
#Exercise 2
 names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
            "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
            "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
            "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
            "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
            "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")
 years <- c(2008,2008,2010,2011,2011,2012,2013,2013,2014,2014,2015,2015,2016,2016,
            2017,2017,2017,2017,2018,2018,2019,2019,2019,2021,2021,2021,2021)
 marvel_movie <- data.frame(names, years)
 View(marvel_movie)
 #2.1
 #use data frame because it's in the table form so that so easy to view the information
 
 #2.2
 #Find numbers of movies
 length(names) # = 27
 #Finding the 19th movies name
 print(names[19]) #= "Avengers: Infinity War"
 #Which years is most released movie
 # the years that have the most released movie are 2017 and 2021