#Cluster Analysis in Customer Segmentation Case Study:

# loading the required libraries:
library(dplyr)
library(ggplot2)
library(fastDummies)
library(factoextra)

# loading the data

data<- read.csv('Train.csv',header = TRUE,sep = ',')
# There are 8068 obs. with 11 variables.


# Checking the first few rows of the data

head(data)


# Getting familiar with the data

str(data)
# There are 7 Character variables(Gender, Ever_Married, Graduated,Profession, Spending_Score, Var_1, and Segmentation)
#and 4 numeric variables(ID, Age, Work_Experience, Family_Size)

# Simplifying the data (removing ID, Var_1 and Segmentation variables as we don't need them for clustering)

data<- data[, 2:9]

# let's get the summary of the data

summary(data)

# Gender, Ever_Married, Graduated are all character variables with two levels, Spending_Score has 3 levels(Low, Average, High)
# but we don't know how many levels are in Profession. let's check that

unique(data$Profession)

# So, there are 9 profession including "" value, which I should impute as NA or let's impute NA for all "" 
# values in the dataset

# Transform Blanks into NA

data[data==""]<- NA

# Removing all the NA values before we apply clustering. Removing makes more sense here.

data<- data[complete.cases(data),]


#Data Visualization:

ggplot(data, aes(x= Age))+geom_boxplot(col="purple")+ labs(xlabs= "Age",title = "AGE Distribution")
ggplot(data, aes(x= Work_Experience))+geom_boxplot(col="blue")+ labs(xlabs= "Work-Ex",title = "Work-Experience Distribution")
ggplot(data, aes(x= Family_Size))+geom_boxplot(col="orange")+ labs(xlabs= "Family-Size",title = "Family-Size Distribution")


ggplot(data) + geom_bar(aes(x = Gender))
ggplot(data) + geom_bar(aes(x = Ever_Married))
ggplot(data) + geom_bar(aes(x = Graduated))
ggplot(data) + geom_bar(aes(x = Profession))
ggplot(data) + geom_bar(aes(x = Spending_Score))

#Machine Learning Algorithm (K-means)

# As K means clustering deals with only numerical data. We need to change all the character variables into numeric variables.
# To do that, first I will create 2 datasets, one for numeric and other for character variables and then I will change character
# varibles into numeric and later I will combine them.

data_n <- data %>% select_if(is.numeric)
data_c <- data %>% select_if(is.character)


# Transforming the character variable into numeric/dummy (use remove_most_frequent_dummy = TRUE, to avoid dummy variable trap.)

data_c <- dummy_cols(data_c, remove_most_frequent_dummy = TRUE)

# Forming the final data
data_final<- cbind(data_n, data_c[, 6:18])

# scale dataset

data_final[, 1:16]<- scale(data_final [, 1:16])

# Determining the count of segments

fviz_nbclust(data_final,kmeans, method = "wss" )+labs(title = "Elbow Method")
# From the Elbow plot, we can see the centers = 6


clusters <- kmeans(data_final, centers = 6,iter.max=10)

clusters$centers

dataset <- cbind(data, clusters$cluster)
head(dataset)

dataset$segment <- dataset$`clusters$cluster`

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
segment_summary<- dataset %>% group_by(segment) %>% 
  summarise(Min_Age=min(Age), Work_Experience=mean(Work_Experience),Family_Size=mean(Family_Size),
            Graduated=getmode(Graduated),Gender=getmode(Gender),
            Married=getmode(Ever_Married),Profession=getmode(Profession),
            Spend=getmode(Spending_Score))


segment_summary


       