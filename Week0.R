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






