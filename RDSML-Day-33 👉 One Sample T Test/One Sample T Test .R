# Importing the dataset
mydata <- read.csv("bottle_data.csv")

# Checking for the normality
# Shaprio-wilk Test
shapiro.test(mydata$value)

# One Sample T Test
t.test(x = mydata$value, mu = 150)
