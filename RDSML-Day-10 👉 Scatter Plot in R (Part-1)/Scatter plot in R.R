#install.packages("ggplot2")
library(ggplot2)

dataset = mtcars

# Generating a basic scatter plot
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point()

# changing the point size and shape
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size=4, shape=18)

# Adding the regression line
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size=4, shape=18) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatterplot of a car wt vs car mpg",
       x = "wt of cars(pound)",
       y = "miles per gallon(gallon)")
