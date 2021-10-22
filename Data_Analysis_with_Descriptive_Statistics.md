# Data Analysis With Descriptive Statistics

## From Top 100 Korean Drama Dataset

### 1) ในแต่ละปีมีซีรี่ย์ออกอากาศมากมาย แต่ปี2020กลับเป็นปีที่มีซีรี่ย์กว่า 20 เรื่องที่ติด top 100

```{R}
kdrama %>% select(Year.of.release) %>% count(Year.of.release)%>% arrange(desc(n)) %>% head(1)
```
Descriptive statistics Statement
```{R}
เป็นการหาว่าปีใดที่มีซีรี่ย์ติดtop 100 มากที่สุดและจำนวนเรื่อง โดยใช้ select 	เลือกปีที่ฉาย countเพื่อนับจำนวนซีรี่ย์แต่ละปี 
และ arrange เรียงจำนวนเรื่องจากมากไปน้อย และ head(1)เพื่อเลือกปีซึ่งมีจำนวนซีรี่ย์มากที่สุดซึ่งจะอยู่บนสุด
```

### 2) รู้หรือไม่ จำนวนตอนของซีรี่ย์เกาหลีแต่ละเรื่องไม่เท่ากัน โดยมีค่าเฉลี่ยอยู่ที่ 19.53 ตอน

```{R}
kdrama$Number.of.Episode %>% mean()
```
Descriptive statistics Statement
```{R}
เป็นการหาค่าเฉลี่ยว่าซีรี่ย์มีกี่ตอน โดยใช้ mean()เพื่อหาค่าเฉลี่ย
```

### 3) ในแต่ละปี ย่อมมีการสร้างซีรีย์ที่มีคุณภาพมากน้อยแตกต่างกัน แต่ว่าปีที่เรียกได้ว่าเป็นพัฒนาแบบการก้าวกระโดดในวงการผลิตสื่อโทรทัศน์เลยคือปี 2017 โดยสามารถดูได้จากข้อมูลที่เราแสดงจำนวนซีรีย์ที่ติดอันดับในแต่ละปี

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

### 4) จากการสำรวจdataset พบว่า เรตติ้งเฉลี่ยในแต่ละปีนั้น แทบไม่มีความต่างกันเลย นั่นหมายความว่าในการผลิตซีรีย์นั้น ก็เป็นกลุ่มคนฐานเดิม ที่คอยติดตามดูตลอด อาจมีบางเรื่องที่ทำแนวแปลกใหม่ เพื่อดึงดูดกลุ่มเป้าหมายใหม่ๆ แต่ก็ไม่ได้ช่วยเพิ่มเรตติ้งให้มีค่าเฉลี่ยสูงขึ้น อย่างมีนัยยะสำคัญ

```{R}
kdrama %>% group_by(Year.of.release) %>% dplyr::summarise(avg = mean(Rating, na.rm = TRUE))
```
ข้อมูลที่ได้
```{R}
    Year.of.release   avg
             <int>   <dbl>
   1          2003    8.6 
   2          2011    8.5 
   3          2012    8.6 
   4          2013    8.6 
   5          2014    8.7 
   6          2015    8.83
   7          2016    8.73
   8          2017    8.67
   9          2018    8.77
  10          2019    8.62
  11          2020    8.72
  12          2021    8.82
```

Descriptive statistics Statement
```{R}
ใช้คำสั่งgroup by(Year.of.release) เพื่อเป็นการgroupข้อมูลที่อยู่ในปีเดียวกัน และ ส่งข้อมูลที่ได้ไปsummarise 
หาค่าเฉลี่ยของเรตติ้งข้อมูลที่ได้ก็จะปรากฏตามปี
```

### 5) ซีรี่ย์เกาหลีส่วนใหญ่จะผลิตเนื้อหาสำหรับผู้ชมที่มีอายุ15ปีขึ้นไปแต่ยังมีซีรี่ย์ที่มีเนื้อหารุนแรงเหมาะสำหรับอายุ18ปีได้แก่ Move to Heaven,Kingdom,Sweet Home,The Guest,Taxi Driver,Mouse,Bad Guys,The World of the Married,Extracurricular

```{R}
new_kdrama <- kdrama %>% mutate(
  Content.Rating= lapply(Content.Rating,gsub,pattern = " ",replacement = ""))
new_kdrama %>% select(Name,Content.Rating,Year.of.release,Rating) %>% filter(Content.Rating == "18+Restricted(violence&profanity)")
```
Descriptive statistics Statement
```{R}
เป็นการหาว่ามีซีรี่ย์เรื่องใดที่มีเนื้อหารุนแรงเหมาะกับอายุ 18ปีขึ้นไป โดยมีการใช้ new_kdrama <- kdrama เพื่อจำลองทุกอย่างของ kdrama ลงใน new_kdrama , ใช้ mutateเพื่อเพิ่มค่าตัวแปรใหม่ของ 
คำสั่ง lapply(Content.Rating,gsub,pattern = " ",replacement = "")) ที่ทำให้ข้อมูลในคอลัมContent.Ratingแยกกันตรงเครื่องหมาย “,” จากนั้นใช้ selectเพื่อแสดงชื่อและContent.Ratin 
โดยมีfilterเลือกเนื้อหา18+Restricted(violence&profanity) เฉพาะ
```

### 6) จากการอ้างอิงซีรีย์ที่มีcontent 18+ ในปี2020ที่ใกล้เคียงปัจจุบันที่สุดที่จะวัดได้ พบว่า ซีรีย์แนวนี้เป็นซีรีย์ที่ค่อนข้างมาแรง โดยมีค่าเฉลี่ยของเรตติ้งที่ค่อนข้างสูงอยู่ที่ 8.675 

```{R}
kdrama %>% filter(Content.Rating == '18+ Restricted (violence & profanity) ', Year.of.release == '2020') %>% dplyr::summarise(avg = mean(Rating,na.rm = TRUE))
```
Descriptive statistics Statement
```{R}
ใช้คำสั่งfilter เพื่อเป็นการกำหนดเงื่อนไขให้เลือกเฉพาะ content ratingที่เป็น 18+ และกำหนดให้ปีที่ฉายคือ 2020 เมื่อได้ข้อมูลออกมาแล้ว 
ก็นำไปsummarise หาค่าเฉลี่ยของเรตติ้ง
```

### 7) ซีรีย์เกาหลีนั้นจะแบ่งออกcontentเป็น 3 ช่วงอายุหลักๆ คือ 13+, 15+ และ 18+ โดยค่าเฉลี่ยของเรตติ้งนั้น หมวดที่ได้รับความนิยมน้อยสุดก็คือ เรต13+ ที่มีค่าเฉลี่ยเรตติ้งเพียง 8.6 ถัดขึ้นมาคือ เรต15+ มีค่าเฉลี่ยอยู่ที่ 8.7 และสุดท้ายที่ได้รับความนิยมมากสุดคือ เรต18+โดยมีค่าเฉลี่ยอยู่ที่ 8.76  ซึ่งก็สามารถทำการประเมินกลุ่มเป้าหมายที่ดูคร่าวๆได้ ในเรื่องของกลุ่มอายุ และ แนวของซีรีย์

```{R}
kdrama %>% group_by(Content.Rating) %>% dplyr::summarise(avg = mean(Rating,na.rm = TRUE))
```
Descriptive statistics Statement
```{R}
ใช้คำสั่งgroup by เพื่อทำการgroupแยกcontent rating และนำข้อมูลที่ได้ไปหาค่าเฉลี่ยเรตติ้งของแต่ละหมวด ด้วยsummarise(avg = mean(Rating,na.rm = TRUE))
```

### 8) รู้หรือไม่ว่า ซีรีย์ที่มีตอนเยอะที่สุดในdatasetนี้มีตอนยาวถึง 100 ตอน และนั่นคือเรื่องOnce Again ซีรีย์ที่ออกอากาศปี2020 และมีเรตติ้งอยู่ที่ 8.5 ซึ่งค่อนข้างต่ำ จึงอาจนำมาเก็บเป็นข้อมูลทางสถิติเพื่อประกอบการวิเคราะห์เรื่องของการกำหนดจำนวนตอนได้
 
```{R}
kdrama %>%dplyr::summarise(NumOfEp = max(Number.of.Episode, na.rm = TRUE))
kdrama %>%select(Name,Number.of.Episode,Year.of.release,Rating) %>% filter(Number.of.Episode == '100')
```
Descriptive statistics Statement
```{R}
เนื่องจากในตารางเราไม่รู้ว่าซีรีย์เรื่องไหนจำนวนตอนเยอะที่สุด statementแรก จึงทำการsummarise ใช้คำสั่งmaxของNumber.of.Episode 
เพื่อหาจำนวนตอนที่มากที่สุดในตาราง เมื่อได้มาก็ทำการselect ชื่อ จำนวนตอน ปีที่ฉาย และ เรตติ้ง โดยfilterเป็นเงื่อนไขว่า
ให้ตอนเท่ากับข้อมูลที่หามาในstatementแรก  
```

### 9) เรื่องที่ได้รับความนิยมมากที่สุดในปี2020 คือ Hospital playlist ซึ่งเป็นซีรีย์เกี่ยวกับชีวิตหมอที่เรื่องเน้นเรื่องความสัมพันธ์เพื่อนไม่ใช่แบบพระเอก-นางเอกรักโรแมนติกซึ่งเรื่องนี้เป็นเรื่องที่มีเรตติ้งมากถึง 9.1 ซึ่งถือว่าสูงมากๆ บางทีนี่อาจจะเป็นยุคใหม่ของซีรีย์ที่ไม่ต้องสร้างมาเพื่อให้มีความรักระหว่างคนสองคนอีกต่อไป
 
```{R}
kdrama %>% select(Name,Year.of.release,Genre,Rating) %>% filter(Year.of.release == '2020')%>% dplyr::arrange(desc(Rating)) %>% head(1)   
```
Descriptive statistics Statement
```{R}
ใช้คำสั่ง select เพื่อเลือกข้อมูลที่จะแสดงคือ ชื่อเรื่อง ปีที่ฉาย แนวของซีรีย์ และ เรตติ้ง โดยfilter เงื่อนไขเป็นปี 2020 
และเรียงจากมากไปน้อยตามเรตติ้ง แล้วจึงตัดเอาข้อมูลตัวแรกที่เรตติ้งมากที่สุดแสดงเพียงค่าเดียว
```

### 10)

```{R}
kdrama %>% count(Year.of.release) %>% filter(Year.of.release=="2017"|Year.of.release=="2020")
```
Descriptive statistics Statement
```{R}
----
```

### 11)

```{R}
kdrama  %>% filter(Year.of.release=="2018") %>% summarise(avg = mean(Rating, na.rm = TRUE))
```
Descriptive statistics Statement
```{R}
----
```

### 12) ในช่วงวันหยุดสุดสัปดาห์ อย่างวันเสาร์ อาทิตย์ คนจะดูซีรีย์กันเยอะมั้ยนะ จากการสำรวจพบว่าค่าเฉลี่ยเรตติ้งของซีรีย์ที่ฉายในวันเสาร์และอาทิตย์ อยู่ที่ 8.726 ซึ่งถือว่าสูงทีเดียว บางทีการได้ดูซีรีย์ในวันหยุดอาจะะเป็นการผ่อนคลายที่ดีจากการเรียนหรือทำงานตลอดทั้งสัปดาห์ก็ได้

```{R}
kdrama %>% filter(Aired.On == ' Saturday,Sunday') %>% dplyr::summarise(Ratingmean = mean(Rating, na.rm = TRUE)) 
```
Descriptive statistics Statement
```{R}
ในการหาเรตติ้งเฉลี่ยของซีรีย์ที่ฉายในวันเสาร์ อาทิตย์ อย่างแรกคือ filterข้อมูล เพื่อกำหนดเงื่อนไขให้เอาซีรีย์ที่ Aired.On == 'Saturday,Sunday'เท่านั้น 
แล้วจึงส่งข้อมูลไปsummarise คำสั่งmeanเพื่อหาค่าเฉลี่ยของข้อมูลที่ได้อีกที
```

### 13) Friday night กับซีรี่ย์ที่ออกอากาศวันศุกร์

```{R}
new_kdrama <- kdrama %>% mutate(Aired.On = strsplit(Aired.On,","),
                                Aired.On = lapply(Aired.On,gsub,pattern = " ",replacement = ""),
                                Aired.On = lapply(Aired.On,tolower))

new_kdrama %>% select(Aired.On) %>% unnest(Aired.On) 

new_kdrama  %>% select(Name,Aired.On) %>% filter(Aired.On == "friday")
```
Descriptive statistics Statement
```{R}
เป็นการหาซีรี่ย์ที่ออกอากาศเฉพาะวันศุกร์ โดยมีการใช้ new_kdrama <- kdrama เพื่อจำลองทุกอย่างของ kdrama ลงใน new_kdrama , ใช้ mutateเพื่อ
เพิ่มค่าตัวแปรใหม่ของ คำสั่ง strsplit(Aired.On,”,”) ที่ทำให้ข้อมูลในคอลัมAired.Onแยกกันตรงเครื่องหมาย “,” และ 
lapply(Aired.On,gsub,pattern = " ",replacement = "") เป็นการตัดช่องว่างของคำ และ Aired.On = lapply(Aired.On,tolower) 
ทำให้ทุกตัวอักษรในคอลัมเป็นตัวพิมพ์เล็ก จากนั้นใช้selectเลือกข้อมูลในAired.Onและunnest(Aired.On)เพื่อเรียงข้อมูลเป็นแถวเดี่ยว
แล้วใช้selectเลือกชื่อเรื่องและข้อมูลในAired.Onโดยใช้filterแยกวันออกอากาศเป็นfridayเท่านั้น
```

### 14) สงสัยมั้ยว่าช่องชื่อดังอย่างtvN จะผลิตซีรีย์ที่มีคุณภาพออกมาเยอะแค่ไหน และเป็นที่นิยมหรือเปล่า ซึ่งจากข้อมูลที่เราหาโดยเลือกซีรีย์ที่เป็นexclusive content(เรื่องที่ดูได้เฉพาะในช่องนั้นๆ) พบว่ามีเรื่องทั้งหมดถึง 18 เรื่องที่ติดอันดับ และค่าเฉลี่ยเรตติ้งสูงถึง 8.77 ถือว่าเป็นอีกช่องที่ผลิตสื่อคุณภาพออกมาจำนวนมาก

```{R}
kdrama %>% filter(Network == 'tvN ') %>% count
kdrama %>% filter(Network == 'tvN ') %>% dplyr::summarise(avgRating = mean(Rating, na.rm = TRUE))
```
Descriptive statistics Statement
```{R}
ในstatementแรกคือ การfilterหาข้อมูลที่ network เป็น tvNเท่านั้น และทำการ count เพื่อให้แสดงจำนวนข้อมูลทั้งหมดที่มี
ในstatementที่2 คือ การหาค่าเฉลี่ยของช่องtvN โดยใช้filterข้อมูลที่network = tvNเท่านั้น และส่งข้อมูลมาsummarise คำสั่งmean 
เพื่อหาค่าเฉลี่ยข้อมูลที่ส่งมา เพื่อให้ได้ค่าที่ต้องการ
```
