# install.packages("ggplot2")
library(ggplot2)

dataset = mtcars

# Generating a basic scatter plot
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point()

# Changing the point size and shape
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size=1, shape=18)


# Adding the regression line
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size=1, shape=18) +
  geom_smooth(method = lm)

#removing the confidence interval
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size=1, shape=18) +
  geom_smooth(method = lm , se = FALSE)

#LOESS method
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth()

# Change the line type and color
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size=1, shape=18) +
  geom_smooth(method = lm, linetype = "dashed",
              color = "darkblue")


# Changing the confidence interval color
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size=1, shape=18, color = "blue") +
  geom_smooth(method = lm, linetype = "dashed",
              color = "darkred", fill = "blue")

# scatter plots with multiple groups



#converting the cyl column from a numeric to factor variable
dataset$cyl = as.factor(dataset$cyl)

#changing the point shapes by the levels of cyl
ggplot(dataset, aes(x= wt, y= mpg, shape = cyl)) +
  geom_point()

#changing point shapes and colors by the level of cyl
ggplot(dataset, aes(x= wt, y= mpg, shape = cyl, colour = cyl)) +
  geom_point()


#changing point shapes ,colors and sizes
ggplot(dataset, aes(x= wt, y= mpg, shape = cyl, colour = cyl, size = cyl)) +
  geom_point()
