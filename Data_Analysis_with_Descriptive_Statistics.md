# Data Analysis With Descriptive Statistics

## From Top 100 Korean Drama Dataset

1) ในแต่ละปีมีซีรี่ย์ออกอาศมากมาย แต่ปี2020กลับเป็นปีที่มีซีรี่ย์กว่า 20 เรื่องที่ติด top 100
```{R}
kdrama %>% select(Year.of.release) %>% count(Year.of.release)%>% arrange(desc(n)) %>% head(1)
```
Descriptive statistics Statement
```{R}
เป็นการหาว่าปีใดที่มีซีรี่ย์ติดtop 100 มากที่สุดและจำนวนเรื่อง โดยใช้ select 	เลือกปีที่ฉาย countเพื่อนับจำนวนซีรี่ย์แต่ละปี และ arrange เรียงจำนวนเรื่องจากมากไปน้อย และ head(1)เพื่อเลือกปีซึ่งมีจำนวนซีรี่ย์มากที่สุดซึ่งจะอยู่บนสุด
```
2) รู้หรือไม่ จำนวนตอนของซีรี่ย์เกาหลีแต่ละเรื่องไม่เท่ากัน โดยมีค่าเฉลี่ยอยู่ที่ 19.53 ตอน
```{R}
kdrama$Number.of.Episode %>% mean()
```
Descriptive statistics Statement
```{R}
เป็นการหาค่าเฉลี่ยว่าซีรี่ย์มีกี่ตอน โดยใช้ mean()เพื่อหาค่าเฉลี่ย
```

3) ในแต่ละปี ย่อมมีการสร้างซีรีย์ที่มีคุณภาพมากน้อยแตกต่างกัน แต่ว่าปีที่เรียกได้ว่าเป็นพัฒนาแบบการก้าวกระโดดในวงการผลิตสื่อโทรทัศน์เลยคือปี 2017 
โดยสามารถดูได้จากข้อมูลที่เราแสดงจำนวนซีรีย์ที่ติดอันดับในแต่ละปี
```{R}
kdrama %>% group_by(Year.of.release) %>% count()%>%dplyr::arrange(desc(Year.of.release))
```
ข้อมูลที่ได้
```{R}
Year.of.release         n
             <int>    <int>
 1            2021     10
 2            2020     20
 3            2019     17
 4            2018     11
 5            2017     17
 6            2016      9
 7            2015      3
 8            2014      4
 9            2013      5
10            2012      2
11            2011      1
12            2003      1
```

Descriptive statistics Statement
```{R}
ใช้คำสั่งgroup by(Year.of.release) เพื่อเป็นการgroupข้อมูลที่อยู่ในปีเดียวกัน และทำการcount() เพื่อนับจำนวน 
สุดท้ายarrange(desc(Year.of.release)) เป็นการเรียงปีให้เห็นถึงปีปัจจุบันก่อนแล้วไล่ลงไปตามลำดั
```

4)
```{R}
kdrama %>% group_by(Year.of.release) %>% dplyr::summarise(avg = mean(Rating, na.rm = TRUE))
```
Descriptive statistics Statement
```{R}
------
```

5)ซีรี่ย์เกาหลีส่วนใหญ่จะผลิตเนื้อหาสำหรับผู้ชมที่มีอายุ15ปีขึ้นไปแต่ยังมีซีรี่ย์ที่มีเนื้อหารุนแรงเหมาะสำหรับอายุ18ปีได้แก่ Move to Heaven,Kingdom,Sweet Home,The Guest,Taxi Driver,Mouse,Bad Guys,The World of the Married,Extracurricular
```{R}
new_kdrama <- kdrama %>% mutate(
  Content.Rating= lapply(Content.Rating,gsub,pattern = " ",replacement = ""))
new_kdrama %>% select(Name,Content.Rating,Year.of.release,Rating) %>% filter(Content.Rating == "18+Restricted(violence&profanity)")

```
Descriptive statistics Statement
```{R}
เป็นการหาว่ามีซีรี่ย์เรื่องใดที่มีเนื้อหารุนแรงเหมาะกับอายุ 18ปีขึ้นไป โดยมีการใช้ new_kdrama <- kdrama เพื่อจำลองทุกอย่างของ kdrama ลงใน new_kdrama , ใช้ mutateเพื่อเพิ่มค่าตัวแปรใหม่ของ คำสั่ง lapply(Content.Rating,gsub,pattern = " ",replacement = "")) ที่ทำให้ข้อมูลในคอลัมContent.Ratingแยกกันตรงเครื่องหมาย “,” จากนั้นใช้ selectเพื่อแสดงชื่อและContent.Ratin โดยมีfilterเลือกเนื้อหา18+Restricted(violence&profanity) เฉพาะ
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

13) Friday night กับซีรี่ย์ที่ออกอากาศวันศุกร์
```{R}
new_kdrama <- kdrama %>% mutate(Aired.On = strsplit(Aired.On,","),
                                Aired.On = lapply(Aired.On,gsub,pattern = " ",replacement = ""),
                                Aired.On = lapply(Aired.On,tolower))

new_kdrama %>% select(Aired.On) %>% unnest(Aired.On) 

new_kdrama  %>% select(Name,Aired.On) %>% filter(Aired.On == "friday")
```
Descriptive statistics Statement
```{R}
เป็นการหาซีรี่ย์ที่ออกอากาศเฉพาะวันศุกร์ โดยมีการใช้ new_kdrama <- kdrama เพื่อจำลองทุกอย่างของ kdrama ลงใน new_kdrama , ใช้ mutateเพื่อเพิ่มค่าตัวแปรใหม่ของ คำสั่ง strsplit(Aired.On,”,”) ที่ทำให้ข้อมูลในคอลัมAired.Onแยกกันตรงเครื่องหมาย “,” และ lapply(Aired.On,gsub,pattern = " ",replacement = "") เป็นการตัดช่องว่างของคำ และ Aired.On = lapply(Aired.On,tolower) ทำให้ทุกตัวอักษรในคอลัมเป็นตัวพิมพ์เล็ก จากนั้นใช้selectเลือกข้อมูลในAired.Onและunnest(Aired.On)เพื่อเรียงข้อมูลเป็นแถวเดี่ยว แล้วช้selectเลือกชื่อเรื่องและข้อมูลในAired.Onโดยใช้filterแยกวันออกอากาศเป็นfridayเท่านั้น

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
