library(dplyr)
library(tidyr)

kdrama <- read.csv("../Dataset/top100_kdrama_clean_AirOn_network.csv")
View(kdrama)
str(kdrama)

#1 Show year of the most released series in dataset
kdrama %>% select(Year.of.release) %>% count(Year.of.release)%>% arrange(desc(n)) %>% head(1)

#2 Show mean of number of episodes
kdrama$Number.of.Episode %>% mean()

#3 count number of series each year orderby last year
kdrama %>% group_by(Year.of.release) %>% count()%>%dplyr::arrange(desc(Year.of.release))

#4 find average of rating each year
kdrama %>% group_by(Year.of.release) %>% dplyr::summarise(avg = mean(Rating, na.rm = TRUE))

#5 series in 18+Restricted(violence&profanity) content
new_kdrama <- kdrama %>% mutate(
  Content.Rating= lapply(Content.Rating,gsub,pattern = " ",replacement = ""))
new_kdrama %>% select(Name,Content.Rating,Year.of.release,Rating) %>% filter(Content.Rating == "18+Restricted(violence&profanity)")

#6 show avg of series that content 18+ in 2020
kdrama %>% filter(Content.Rating == '18+ Restricted (violence & profanity) ', Year.of.release == '2020') %>% dplyr::summarise(avg = mean(Rating,na.rm = TRUE))

#7 show avg of series group by content rate
kdrama %>% group_by(Content.Rating) %>% dplyr::summarise(avg = mean(Rating,na.rm = TRUE))

#8 Series have the most episode
kdrama %>%dplyr::summarise(NumOfEp = max(Number.of.Episode, na.rm = TRUE))
kdrama %>%select(Name,Number.of.Episode,Year.of.release,Rating) %>% filter(Number.of.Episode == '100')

#9 show the most rating series in 2020
kdrama %>% select(Name,Year.of.release,Genre,Rating) %>% filter(Year.of.release == '2020')%>% dplyr::arrange(desc(Rating)) %>% head(1)   

#10 Show all series that aired on 2017 and 2020
kdrama %>% count(Year.of.release) %>% filter(Year.of.release=="2017"|Year.of.release=="2020")

#11 Show the average rating of series that aired on 2018
kdrama  %>% filter(Year.of.release=="2018") %>% summarise(avg = mean(Rating, na.rm = TRUE))

#12 show avg of series that air on saturday and sunday
kdrama %>% filter(Aired.On == ' Saturday,Sunday') %>% dplyr::summarise(Ratingmean = mean(Rating, na.rm = TRUE)) 

#13 Show series that aired on friday
new_kdrama <- kdrama %>% mutate(Aired.On = strsplit(Aired.On,","),
                                Aired.On = lapply(Aired.On,gsub,pattern = " ",replacement = ""),
                                Aired.On = lapply(Aired.On,tolower))

new_kdrama %>% select(Aired.On) %>% unnest(Aired.On) 

new_kdrama  %>% select(Name,Aired.On) %>% filter(Aired.On == "friday")


#14 exclusive seires on tvN and show avg
kdrama %>% filter(Network == 'tvN ') %>% count
kdrama %>% filter(Network == 'tvN ') %>% dplyr::summarise(avgRating = mean(Rating, na.rm = TRUE))

