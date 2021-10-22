# Data Analysis With Descriptive Statistics

## From Top 100 Korean Drama Dataset

1) 
```{R}
kdrama %>% select(Year.of.release) %>% count(Year.of.release)%>% arrange(desc(n)) %>% head(1)
```
Descriptive statistics Statement
```{R}
---
```
2) 
```{R}
kdrama$Number.of.Episode %>% mean()
```
Descriptive statistics Statement
```{R}
-----
```

3) 
```{R}
kdrama %>% group_by(Year.of.release) %>% count()%>%dplyr::arrange(desc(Year.of.release))
```

Descriptive statistics Statement
```{R}
-----
```

4)
```{R}
kdrama %>% group_by(Year.of.release) %>% dplyr::summarise(avg = mean(Rating, na.rm = TRUE))
```
Descriptive statistics Statement
```{R}
------
```

5)
```{R}
new_kdrama <- kdrama %>% mutate(
  Content.Rating= lapply(Content.Rating,gsub,pattern = " ",replacement = ""))
new_kdrama %>% select(Name,Content.Rating,Year.of.release,Rating) %>% filter(Content.Rating == "18+Restricted(violence&profanity)")

```
Descriptive statistics Statement
```{R}
----
```

6)
```{R}
kdrama %>% filter(Content.Rating == '18+ Restricted (violence & profanity) ', Year.of.release == '2020') %>% dplyr::summarise(avg = mean(Rating,na.rm = TRUE))
```
Descriptive statistics Statement
```{R}
----
```

7)
```{R}
kdrama %>% group_by(Content.Rating) %>% dplyr::summarise(avg = mean(Rating,na.rm = TRUE))
```
Descriptive statistics Statement
```{R}
----
```

8)
```{R}
kdrama %>%dplyr::summarise(NumOfEp = max(Number.of.Episode, na.rm = TRUE))
kdrama %>%select(Name,Number.of.Episode,Year.of.release,Rating) %>% filter(Number.of.Episode == '100')
```
Descriptive statistics Statement
```{R}
----
```

9)
```{R}
kdrama %>% select(Name,Year.of.release,Genre,Rating) %>% filter(Year.of.release == '2020')%>% dplyr::arrange(desc(Rating)) %>% head(1)   
```
Descriptive statistics Statement
```{R}
----
```

10)
```{R}
kdrama %>% count(Year.of.release) %>% filter(Year.of.release=="2017"|Year.of.release=="2020")
```
Descriptive statistics Statement
```{R}
----
```

11)
```{R}
kdrama  %>% filter(Year.of.release=="2018") %>% summarise(avg = mean(Rating, na.rm = TRUE))
```
Descriptive statistics Statement
```{R}
----
```

12)
```{R}
kdrama %>% filter(Aired.On == ' Saturday,Sunday') %>% dplyr::summarise(Ratingmean = mean(Rating, na.rm = TRUE)) 
```
Descriptive statistics Statement
```{R}
----
```

13)
```{R}
new_kdrama <- kdrama %>% mutate(Aired.On = strsplit(Aired.On,","),
                                Aired.On = lapply(Aired.On,gsub,pattern = " ",replacement = ""),
                                Aired.On = lapply(Aired.On,tolower))

new_kdrama %>% select(Aired.On) %>% unnest(Aired.On) 

new_kdrama  %>% select(Name,Aired.On) %>% filter(Aired.On == "friday")
```
Descriptive statistics Statement
```{R}
----
```

14)
```{R}
kdrama %>% filter(Network == 'tvN ') %>% count
kdrama %>% filter(Network == 'tvN ') %>% dplyr::summarise(avgRating = mean(Rating, na.rm = TRUE))
```
Descriptive statistics Statement
```{R}
----
```
