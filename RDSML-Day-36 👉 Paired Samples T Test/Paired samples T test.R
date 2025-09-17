# Paired Samples T-Test in R
# Importing the dataset
myDataset <- read.csv("paired-samples-t-test.csv")

# Calculating the difference
diffs <- myDataset$carb - myDataset$carb_protein

# Checking if the differences are normally distributed
shapiro.test(diffs)

# Checking for outliers using boxplot
boxplot(diffs)

# Running the Paired T-Test
t.test(x = myDataset$carb,
       y = myDataset$carb_protein,
       paired = TRUE)

# Running the wilcoxon signed-rank test
wilcox.test(x = myDataset$carb,
            y = myDataset$carb_protein,
            paired = TRUE)

# Calculating mean and sd
mean(myDataset$carb)
sd(myDataset$carb)

mean(myDataset$carb_protein)
sd(myDataset$carb_protein)

# Effect sie calculation using Cohen's d
# 0.2 ~ small, 0.5 ~ medium, 0.8 ~ large
# install.packages("effsize")
library(effsize)
cohen.d(myDataset$carb_protein, myDataset$carb, paired = T)

# How to write results:

# A paired-samples t-tests was used to determine whether there was a
# statistically significant mean difference between the distance ran
# when participants imbibed a carbohydrate-protein drink compared to
# a carbohydrate-only drink. No outliers were detected. The assumption
# of normality was not violated, as assessed by Shapiro-Wilk's test
# (p = 0.780). Participants ran further when imbibing the carbohydrate-
# protein drink (Mean = 11.302 KM, SD = 0.713) as opposed to the 
# carbohydrate-only drink (Mean = 11.167 KM, SD = 0.726 KM), a
# statistically significant mean increase of 0.135 KM,
# 95% confidence interval [0.091,0.181], t(19) = 6.325, p < = .001, Cohen's d estimate :0.187


