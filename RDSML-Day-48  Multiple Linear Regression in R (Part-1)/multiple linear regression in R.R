# Multiple Linear Regression

# Importing the dataset
dataset <- read.csv("50_Startups.csv")

# Encoding the categorical data
dataset$State <- factor(dataset$State,
                        levels = c('New York', 'California', 'Florida'),
                        labels = c(1, 2, 3))

# Splitting the dataset into the Training Set and Test Set
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting the Multiple Linear Regression Model to the Training Set
regressor <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, 
                data = training_set)
summary(regressor)

# Predicting the test set results
y_pred = predict(regressor, test_set)
y_pred

# Backward Elimination
regressor1 <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, 
                 data = training_set)
summary(regressor1)

regressor2 <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, 
                 data = training_set)
summary(regressor2)

regressor3 <- lm(formula = Profit ~ R.D.Spend + Marketing.Spend, 
                 data = training_set)
summary(regressor3)

# Full model
full_model <- lm(Profit ~ ., data = dataset)

# Automated Stepwise backward elimination
final_model <- step(full_model, direction = "backward")
summary(final_model)

# Checking the linearity assumption
plot(final_model)

# checking for the independence of errors assumption
install.packages("lmtest")
library(lmtest)
dwtest(final_model)

# Homoscedasticity (Equal Variance)
plot(final_model$fitted.values, rstandard(final_model))
abline(h = 0, col = "red")
bptest(final_model)

# Normality of Residuals
qqnorm(rstandard(final_model))
qqline(rstandard(final_model))

shapiro.test(rstandard(final_model))

# No Multicollinearity
# install.packages("car")
library(car)
vif(final_model)