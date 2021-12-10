# 🎬 Hypothesis testing 🎬
## from [034-Top-100-Korean-Drama-MyDramaList](./top100_kdrama_clean_AirOn_network.csv)

is a method of statistical inference. An alternative hypothesis is proposed for the probability distribution of this data, either explicitly or only informally. The comparison of the two models is deemed statistically significant if, according to a threshold probability—the significance level—the data would be unlikely to occur if the null hypothesis were true.

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
From the dataset, 
