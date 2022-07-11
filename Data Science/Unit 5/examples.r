# Variables 
# Assignment can be performed in 3 ways 
varA = 3 
varB <- "John"
5 -> varC

#class() is used to get data type of the variable
# print(class(varB))

#vectors list of objects or values 
#c() is used to conctainate two or more objects 
vecA = c(1,2,3,4)
vecB = c(5,6,7,8)
# print(vecA)
# print(class((vecA)))

vecC <- c(vecA,vecB)
vecC <- c(vecA,varB)
# print(vecC)

#factor() returns unique objects/values 
data <- c("W","W","W",".","Wikipedia",".","com")
# print(factor(data))

# print(class(vecA / vecB))

#file handling csv files
file_data = read.csv("./username.csv",header = FALSE)
# print(file_data)

#Date in R
curr_date = as.Date("2022/07/11")
# print(curr_date)
# print(class(curr_date))
curr_date = format(curr_date,"%d/%m/%y")
# print(curr_date)

#Regular Expressions in R .,|,[abc],-,^
#grep(regular_expression,object)
smaple_vector = c("Ebenezer4321","Hrutuja Patnekar","XYZ","1234","John Nixon")
print(smaple_vector)
print(grep("[john]",smaple_vector))
