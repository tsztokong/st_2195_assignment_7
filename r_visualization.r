library("ggplot2")

#install titanic training set
setwd("C:/Users/tonyk/OneDrive/文件/GitHub/st_2195_assignment_7")
training <- read.csv("train.csv")

#change data type of some values
training$Pclass <- as.character(training$Pclass)
training$Survived <- as.logical(as.integer(training$Survived))

#Question 1: produce a bar chart of gender, ticket price and survival

#Produce gender plot
ggplot(training) + geom_bar(aes(x=Sex))
ggsave("gender_plot.pdf")

#Produce a ticket chart
ggplot(training) + geom_bar(aes(x=Pclass))
ggsave("pclass_plot.pdf")

#Produece a survival bar chart
ggplot(training) + geom_bar(aes(x=Survived))
ggsave("survived_plot.pdf")

#Question 2: hisotgram for passenger's age
ggplot(training, aes(x=Age)) + geom_histogram(fill="blue", binwidth=5) 
ggsave("age_plot.pdf")

#Grouped boxplot of age by ticket class
ggplot(training, aes(x=Pclass, y=Age, fill=Pclass)) + geom_boxplot()
ggsave("pclass_age_boxplot.pdf")

#Grouped boxplot of age and survival
ggplot(training, aes(x=Survived, y=Age, fill=Survived)) + geom_boxplot()
ggsave("Survived_age_boxplot.pdf")

#Question 3: Generate a histogram for the travel fare
ggplot(training, aes(x=Fare)) + geom_histogram(binwidth=10)
ggsave("fare_plot.pdf")

#Table showing the number of people who did not pay
not_paid = training[training$Fare == 0,]

#Question 4: A chart of your choice to describe the family size per ticket class
ggplot(training, aes(x=SibSp+Parch+1)) + geom_histogram(binwidth=1) + facet_grid(.~Pclass) + labs(title = "Family size distribution across ticket class", x="Family Size")
ggsave("faily_size_pclass.pdf")

#Question 5: Stacked survival chart with gender/ticket class
ggplot(training, aes(x=Survived, fill=Sex)) + geom_bar(position = "stack")
ggsave("survival_by_sex.pdf")
ggplot(training, aes(x=Survived, fill=Pclass)) + geom_bar(position = "stack")
ggsave("survival_by_pclass.pdf")

#Question 6: A violin chart describing how survival related to age and gender
ggplot(training, aes(x=Survived, y=Age, fill=Sex)) + geom_violin() + labs(title = "Age distribution of survivals in different sex")
ggsave("survival_by_age_and_sex.pdf")

#Question 7: A violin chart describing the survival rate related to age and ticket class
ggplot(training, aes(x=Survived, y=Age, fill=Pclass)) + geom_violin() + labs(title = "Age distribution of survivals in different ticket")
ggsave("survival_by_age_and_pclass.pdf")

#From the graphs above, it seems no association of survival and age (Q2). 
#Female has higher change of survival (Q5)
#Higher class has higher chance of survival (Q5)