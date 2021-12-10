# 🎬 Hypothesis testing 🎬
## from [034-Top-100-Korean-Drama-MyDramaList](./top100_kdrama_clean_AirOn_network.csv)

## Overviews
1. Explore data from [034-Top-100-Korean-Drama-MyDramaList](./top100_kdrama_clean_AirOn_network.csv)
2. State the hypothesis
3. Assign variables that is 
   - μ0 or p0
   - x̄ or P̅
   - n
   - sd (or sigma σ)
   - alpha α (default is 0.05)
4. Select Level of significance (alpha α)
5. Select Test statistic (This formula for one population)
   - z/t <- (xbar - u0) / (sd/sqrt(n))
   - z <- (pbar-p0) / sqrt((p0\*(1-p0))/n)
6. Finding P-value approach or Critical Value approach
   - P-value for Z: `pvalue <- pnorm(z)`
   - Critical Value for Z: `zalpha <- qnorm(alpha)`
   or
   - P-value for T: `pvalue <- pt(q, df,lower.tail = TRUE)`
   - tα for T: `talpha <- qt(p, df, lower.tail = TRUE)`
7. Compare P-value with alpha or z/t with zα/tα
8. Conclusion

## 1. Explore the Top 100 Korean Drama Dataset
From the dataset, We interesting about number of episode in this dataset.So, Hypothesis testing is a method of statistical inference. An alternative hypothesis is proposed for the probability distribution of this data.

## 2. State the hypothesis 
```
Ho: μ <= 20
Ha: μ > 20
 ```
 
## 3. Assign variable 
```
n <- 100
sd <- sd(kdrama $Number.of.Episode) //12.30788
xbar <- mean(kdrama $Number.of.Episode) //19.53
u0 <- 20
```

## 4. Level of significance
``` alpha <- 0.05 ```

## 5. Test statistic
``` 
z <- (xbar - u0) / (sd/sqrt(n));z //-0.3818691
```

## 6. Finding P-value approach or Critical Value approach
```
# P-value approach
pvalue <- pnorm(z); pvalue //0.3512792

# Critical Value approach
zalpha <- qnorm(alpha);zalpha //-1.644854
```

## 7. Compare
```
# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}//Accept H0

# Using critical value
if(z<=zalpha){
  print("Reject H0")
}else{
  print("Accept H0")
}//Accept H0
```
## 8. Conclusion
```

```
