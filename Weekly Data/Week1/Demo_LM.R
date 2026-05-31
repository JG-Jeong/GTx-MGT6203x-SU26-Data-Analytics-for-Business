mydata <- read.csv("Advertising.csv", header=TRUE)
head(mydata, 10)
attach(mydata)
lm.res <- lm(sales~TV+radio+newspaper, data=mydata)
lm.res
names(lm.res)
lm.res$coefficients

lm.sum <- summary(lm.res)
lm.sum
names(lm.sum)
lm.sum$coefficients

yhat <- fitted(lm.res)
yhat
uhat <- resid(lm.res)
uhat
cbind(TV, radio, newspaper, sales, yhat, uhat)[1:10,]

# re-produce t values
bhat <- lm.sum$coefficients[,1]
se <- lm.sum$coefficients[,2]
tstat <- bhat / se
cbind(tstat, lm.sum$coefficients[,3])

# find t cutoffs
# n <- nobs(lm.res)
# k <- nrow(lm.sum$coefficients)-1
# df <- n-k-1 /df is degree of freedom
df <- lm.res$df.residual
alpha <- 1-0.95
qt(1-alpha/2, df)
# t distribution coverges to standard normal distribution as df increases
qnorm(1-alpha/2)

# re-produce p values
pval <- 2 * pt(-abs(tstat), df)
cbind(pval, lm.sum$coefficients[,4])

# re-produce R-squared
lm.sum$r.squared
var(yhat) / var(sales)
1 - var(uhat) / var(sales)

# VIF

library(car)
vif(lm.res)

lm.res2 <- lm(TV~radio+newspaper, data=mydata)
r2.tv <- summary(lm.res2)$r.squared
1/(1-r2.tv)

# model comparison

# lm.res3 <- lm(sales~.-newspaper, data=mydata)
lm.res3 <- lm(sales~.-TV+radio, data=mydata)
summary(lm.res3)

summary(lm.res3)$r.squared
summary(lm.res3)$adj.r.squared

lm.sum$r.squared
lm.sum$adj.r.squared

detach(mydata)























