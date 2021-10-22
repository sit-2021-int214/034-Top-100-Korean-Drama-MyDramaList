# 034-Top-100-Korean-Drama-MyDramaList
Datasets from: https://www.kaggle.com/chanoncharuchinda/top-100-korean-drama-mydramalist

![image](https://i.pinimg.com/originals/fa/4b/87/fa4b87e6717efec7d4fe4fa1d77da506.jpg)

## About's Top100 Korean Drama
This dataset about ranking top 100 of Korean drama which collected from 2003 - 2021 that given by the users on the website "mydramalist.com", "MyDramaList.com is a community-based project which provides Asian drama & movie fans". On the website, fans can create their very own drama watchlists, rate dramas and films, write reviews and many more engaging activities.

### Contents
1. ```Rank```: Ranking on the website
2. ```Name```: Korean Drama name
3. ```Year of release```: Release year of the drama
4. ```Rating```: Rating by the users on the website out of ten
5. ```Aired On```: Aired on what day(s) of the week
6. ```Number of Episode```: How many episodes are there
7. ```Network```: What Network is the drama aired on
8. ```Duration```: How long is one episode approximately
9. ```Content Rating```: Content rate for appropriate audience
10. ```Cast```: Actors and Actresses in the drama
11. ```Type of Drama``` : Type the drama is listed in

## Overview
  เป็นการวิเคราะห์ข้อมูลเชิงสถิติเกี่ยวกับ Korean Drama ที่ถูกจัดอันดับ 100 เรื่องในปี 2003 ถึงปี 2021 โดยเป็นการวิเคราะห์ข้อมูลเกี่ยวกับกระแสนิยมของซีรีย์ที่ติดอันดับและประเภทของซีรีย์ที่ติดอันดับทั้งยังมีการวิเคราะห์ข้อมูลการจัดอันดับช่องทางการเผยแพร่เป็นวิเคราะห์สถิติในการปล่อยซีรีย์ในแต่ละปี โดยใช้โปรแกรม R Studio เพื่อนำมาทำความสะอาดและวิเคราะห์ด้วยภาษา R และใช้เครื่องมือ Google Studio ในการทำ Dashboard ของข้อมูล นอกจากนี้ได้มีการวิเคราะห์เพื่อหาความสัมพันธ์ของข้อมูลและตั้งสมมุติฐาน
  
### Inspiration
  เนื่องจากเพื่อนๆในกลุ่มส่วนใหญ่แล้วชอบดูซีรีย์เกาหลีกันอยู่แล้วเลยอยากใช้ข้อมูล Dataset ที่เป็นเกี่ยวกับการจัดอันดับซีรีย์เกาหลีที่คุ้นเคยกันอยู่แล้วเพื่อเพิ่มความสะดวกในการวิเคราะห์ข้อมูล และจากการที่ได้สำรวจข้อมูลก่อนที่จะเลือกใช้ Dataset ข้อมูลนี้ได้พบว่าข้อมูลมีการจัดอันดับที่น่าสนใจโดยมีการจัดแยกประเภทของซีรีย์ เรตติ้งของซีรีย์  เป็นต้น
  
## Steps
1. Explore the Top 100 Korean Drama Dataset
2. Data Cleaning and Data Transformation
3. Data Analysis with Descriptive Statistics

## Tools
- R Studio
- Google Studio

## Table of Contents
- [Data Cleaning and Data Transformation](data_cleaning_and_tranformation.md)
- [Data Analysis with Descriptive Statistics](Data_Analysis_with_Descriptive_Statistics.md)
- [Data Visualization]()

## Resources
- [top100_kdrama.csv](./top100_kdrama.csv) : Original Dataset
- [code_EDA.R](./code_EDA.R) : Data Cleaning and Data Transformation
- [top100_kdrama_clean_AirOn_network.csv](./top100_kdrama_clean_AirOn_network.csv) : Already cleaning Dataset
- [data_analysis.R]() : Data Analysis with Descriptive Statistics

## About Us
งานนี้เป็นส่วนของวิชา INT214 Statistics for Information technology <br/> ภาคเรียนที่ 1 ปีการศึกษา 2564 คณะเทคโนโลยีสารสนเทศ มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี
### Team: 034-แลคตาซอย เซเลกำมาทอย
1. ชื่อ นาย ภัทรดนัย นามสกุล ดีรักษา StudentID : ```63130500090```
2. ชื่อ นางสาว มณฑิรา  นามสกุล กองสันเทียะ StudentID : ```63130500095```
3. ชื่อ นางสาว รดากรณ์  นามสกุล ทองวิไล StudentID : ```63130500098```
4. ชื่อ นางสาว สุวพิชญ์ นามสกุล  โชติสวัสดิ์ StudentID : ```63130500126```
5. ชื่อ นาย ภูชิต นามสกุล อุปพันธ์เสฏฐี StudentID : ```63130500144```

### Instructor
- ATCHARA TRAN-U-RAIKUL
- JATAWAT XIE (Git: [safesit23](https://github.com/safesit23))



