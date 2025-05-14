#factors in R

#summary of numeric items
participants_age =c(78, 25, 68, 45, 48, 36)
summary(participants_age)

#finding summary of characters
profession = c('doctor', 'teacher', 'teacher', 'businessmen', 'teacher')
summary(profession)

profession = factor(profession)
summary(profession)

#putting the summary in order
birth_month = c('jan', 'dec', 'apr','aug','jan','mar','jun', 'sep', 'oct','jan','jul')
summary(birth_month)
birth_month_fact = factor(birth_month,ordered = TRUE, levels = c('jan','feb','mar','apr','may','jun','jul','aug','sep','oct', 'nov', 'dec'))
summary(birth_month_fact)

#lists in R
#lists are used to place number of items in a bundle

a = c(2, 4, 7)
b = c("red","green","blue")
c = "welcome!"

my_list = list(a, b, c)

my_list


#naming the list items
my_list = list(Pieces = a, Colors = b, Message = c)
my_list

# Calling a specific data structure
my_list[3]
my_list['Colors']
my_list$Colors

#Calling specific items from the data character
my_list$Colors[4]
              



