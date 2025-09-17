# One-way ANOVA
# Importing the dataset
PlantGrowth <- PlantGrowth

# Importing the dplyr library
library(dplyr)

# Computing the group means, sd and se
stats <- PlantGrowth %>% 
  group_by(group) %>%
  summarise(
    mean = mean(weight),
    sd = sd(weight),
    se = sd(weight) / sqrt(n())
  )
print(stats)

# Creating groupwise boxplots
boxplot(weight ~ group,
       data = PlantGrowth,
       main = "PlantGrowth data",
       ylab = "Dried weight of plants",
       col = "lightgray"
       )


# Vsualizing the data using mean plots
#install.packages("ggpubr")
library(ggpubr)
ggline(PlantGrowth,
       x = "group",
       y = "weight",
       add = c("mean_se", "jitter")
)

# Running the one-way ANOVA
anova <- aov(weight ~ group, data = PlantGrowth)
summary(anova)

