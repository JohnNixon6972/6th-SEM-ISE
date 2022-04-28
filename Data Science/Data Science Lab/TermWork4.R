#required packages
install.packages("caret")
install.packages("tidyr")

# Attach the dataset to the environment
data(iris)
# Get help on the data
help(iris)
# Rename the data
iris_dataset<-iris
# View the data
View(iris_dataset)

# View the top few rows of the data in R console
head(iris_dataset,7)

# Assigning meaningful column names
colnames(iris_dataset)<-c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species") # nolint
head(iris_dataset,5)

# Load the Caret package which allows us to partition the data
library(caret)
# We use the dataset to create a partition (80% training 20% testing)
index <- createDataPartition(iris_dataset$Species, p=0.80, list=FALSE)
# select 20% of the data for testing
testset <- iris_dataset[-index,]
# select 80% of data to train the models
trainset <- iris_dataset[index,]

# Dimensions of the data
dim(trainset)

# Structure of the data
str(trainset)

# Summary of the data
summary(trainset)

# Levels of the prediction column
levels(trainset$Species)

## Histogram graph
hist(trainset$Sepal.Width)

## Box plot to understand how the distribution varies by class of flower
par(mfrow=c(1,4))
for(i in 1:4) {
  boxplot(trainset[,i], main=names(trainset)[i])
}
#install.packages("ggplot2")
# begin by loading the library
library(ggplot2)
# Scatter plot
g <- ggplot(data=trainset, aes(x = Petal.Length, y = Petal.Width))
print(g)
g <-g + 
  geom_point(aes(color=Species, shape=Species)) +
  xlab("Petal Length") +
  ylab("Petal Width") +
  ggtitle("Petal Length-Width")+
  geom_smooth(method="lm")
print(g)
## Box Plot
box <- ggplot(data=trainset, aes(x=Species, y=Sepal.Length)) +
  geom_boxplot(aes(fill=Species)) + 
  ylab("Sepal Length") +
  ggtitle("Iris Boxplot") +
  stat_summary(fun.y=mean, geom="point", shape=5, size=4) 
print(box)

library(ggthemes)
## Histogram
histogram <- ggplot(data=iris, aes(x=Sepal.Width)) +
  geom_histogram(binwidth=0.2, color="black", aes(fill=Species)) + 
  xlab("Sepal Width") +  
  ylab("Frequency") + 
  ggtitle("Histogram of Sepal Width")+
  theme_economist()
print(histogram)


## Faceting: Producing multiple charts in one plot
library(ggthemes)
facet <- ggplot(data=trainset, aes(Sepal.Length, y=Sepal.Width, color=Species))+
  geom_point(aes(shape=Species), size=1.5) + 
  geom_smooth(method="lm") +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Faceting") +
  theme_fivethirtyeight() +
  facet_grid(. ~ Species) # Along rows
print(facet)
