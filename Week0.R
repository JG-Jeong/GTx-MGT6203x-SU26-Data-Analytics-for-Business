2^(2+1) - (4/3)^(1/2)
chr <- "Hello World!"
nchar(chr)

f1 <- TRUE
f2 <- FALSE

myvec <- 1:5
myvec2 <- seq(from=1, to=10, by=2)
myvec3 <- rep(c(1,2,3), 5)
length(myvec)

myvec[1]
myvec[length(myvec)]
myvec[c(1,3)]
myvec[1:3]
myvec[-1]
myvec[-c(1,4)]

index <- c(1,3,3,2,1,5,1)


## 3. Factors
values <- c("medium", "low", "low", "high", "medium")
values.fac <- factor(values)
values.fac

levels(value.fac) 
# 문자열이 나오고 ,
# Levels: high low medium 요렇게 나옴. 
levels(values.fac) <- c(3,1,2)
values.fac


## 4. Matrix

A <- matrix(1:12, 3, 4)

a1 <- 1:4
a2 <- 5:8
a3 <- 9:12

M1 <- cbind(a1,a2,a3)
M2 <- rbind(a1,a2,a3)

dim(A)
nrow(A)
ncol(A)

A[1,2]
A[1,]
A[,2]
A[,2:3]

A[c(3,1), 2:3]
A[1,] <- 11:14

## 5. Array

AR <- array(data=1:24, dim=c(3,4,2))
AR

AR[3,2,1]
AR[,,1]
AR[2,,2]

## 6. Lists

mylist <- list(matrix(1:10, 2, 5), c(T,F,T,T), "Hello World")
mylist[[1]]
mylist[c(2,3)]
names(mylist) <- c("mat", "logical", "string")
mylist$mat

#한방에도 가능
mylist <- list(mat = matrix(1:10, 2,5), logical = c(T,F,T,T), string = "Hello World")
mylist$vector <- 1:5

# Data Frames

mydata <- data.frame(name =c( ))

# 8. Files and Packages

setwd("/Users/jg_jeong/Desktop/GeorgiaTech OMSA/Data-Analytics-for-Business")
mydata <- read.table("Auto.csv", header=TRUE, sep=",")
mydata <- read.csv("Auto.csv", header=TRUE)
 
fix(mydata)

write.table(mydata, file="Auto2.csv", sep=",", row.names=FALSE)
write.csv(mydata, file="Auto2.csv", row.names=FALSE)


# Packages

install.packages("rpart")
library(rpart)

# 9. Conditions

number <- 10
if (number %%2 == 0) {
  cat("This is an even number.")
} else {
  cat("This is an odd number.")
}

# 10. Loops

myvec <- 1:100
sum <- 0
for (i in 1:length(myvec))
{
  sum <- sum + myvec[i]
}
sum
 
# 11. Functions

?matrix
args(matrix)

matrix(data=1:12, nrow=3, ncol=4)
matrix(nrow=3, ncol=4, data=1:12)

matrix(dat = 1:12, nr=3, nc=4)

matrix(1:12, 3, 4)
matrix(1:12, 3, 4, TRUE)

matrix(1:12, 3, 4, dimnames=list(c("A","B","C")))

















