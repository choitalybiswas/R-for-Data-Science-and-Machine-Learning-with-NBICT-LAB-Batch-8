# Creating a data frame
dataset = data.frame(dose = c("D0.5","D1","D2"),
                     len = c(4.2,10,29.5))

# Converting r data to csv
write.csv(dataset, "my_data.csv")

library(ggplot2)

# Basic barplot
ggplot(data = dataset, aes(x = dose, y = len)) +
  geom_bar(stat = "identity")

# Horizontal bar plot
ggplot(data = dataset, aes(x = dose, y = len)) +
  geom_bar(stat = "identity") +
  coord_flip()

# Changing the width of bars
ggplot(data = dataset, aes(x = dose, y = len)) +
  geom_bar(stat = "identity", width = .5)

# Changing colors
ggplot(data = dataset, aes(x = dose, y = len)) +
  geom_bar(stat = "identity",color = "blue",fill = "white", width = .5)

# Minimal theme with blue fill color
ggplot(data = dataset, aes(x = dose, y = len)) +
  geom_bar(stat = "identity",fill = "steelblue") +
  theme_minimal()

# Barplot with labels
# Outside bars
ggplot(data = dataset, aes(x = dose, y = len)) +
  geom_bar(stat = "identity",fill = "steelblue") +
  geom_text(aes(label = len), vjust = -0.5, size = 3, color = "#9F9F9F")
  theme_minimal()

# inside bars
ggplot(data = dataset, aes(x = dose, y = len)) +
 geom_bar(stat = "identity",fill = "steelblue") +
 geom_text(aes(label = len), vjust = 0.5, size = 3, color = "#9F9F9F")
 theme_minimal()
  
mtCarData = mtcars
# Barplot of counts
# To make a barplot of counts, we will use mtcars dataset

ggplot(data = mtCarData, aes(x = factor(cyl))) +
  geom_bar(stat = "count", width = 0.7 , fill = "steelblue") +
  theme_minimal()




