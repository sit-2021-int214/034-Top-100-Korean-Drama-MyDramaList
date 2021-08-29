# Assignment 2 (Group)
Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.

### Answer

1) ในจำนวนคนที่ถูก survey มีคนสูบบุหรี่หนักมาก11คน สูบเป็นประจำทั้งหมด19คน สูบบ้าง17คน
```{R}
summary(survey$Smoke)
```
Descriptive statistics Statement
```{R}
คำสั่ง summary(survey$Smoke)
เพื่อให้แสดงผลลัพธ์ว่ามีคนจำนวนเท่าไหร่ที่สูบบุหรี่หนัก สูบเป็นประจำ และ สูบบ้าง
```
2) แมวตัวที่มีน้ำหนักมากที่สุดคือ 3.9 kg
```{R}
max(cats$Bwt)
```
Descriptive statistics Statement
```{R}
code here
```

3) จากนักเรียนที่สำรวจมาเฉลี่ยแล้วมีความสูงอยู่ที่ 172.4 cm โดยส่วนสูงที่น้อยที่สุดคือ 150 cm และส่วนสูงที่สูงที่สุดคือ 200 cm
```{R}
mean(survey$Height,na.rm = TRUE)
max(survey$Height,na.rm = TRUE)
min(survey$Height,na.rm = TRUE)
```

Descriptive statistics Statement
```{R}
ใช้meanเพื่อหาค่าเฉลี่ยความสูงของนักศึกษา
ใช้max,min เพื่อหาความสูงที่สูงที่น้อยที่สุดและมากที่สุด
โดย survey$Height เป็นการเรียกข้อมูลความสูงของ dataset survey
และ na.rm คือการคำนวณโดยที่ไม่นับรวมกับคนที่ไม่ระบุ
```

4)statement here
```{R}
Code here
```
Descriptive statistics Statement
```{R}
code here
```

4)statement here
```{R}
Code here
```
Descriptive statistics Statement
```{R}
code here
```

### Team: 034-แลคตาซอย เซเลกำมาทอย
1. ชื่อ นาย ภัทรดนัย นามสกุล ดีรักษา StudentID: 63130500090
2. ชื่อ นางสาว มณฑิรา นามสกุล กองสันเทียะ StudentID: 63130500095
3. ชื่อ นางสาว รดากรณ์ นามสกุล ทองวิไล StudentID: 63130500098
4. ชื่อ นางสาว สุวพิชญ์ นามสกุล โชติสวัสดิ์ StudentID: 63130500126
5. ชื่อ นาย ภูชิต นามสกุล อุปพันธ์เสฏฐี StudentID: 63130500144
