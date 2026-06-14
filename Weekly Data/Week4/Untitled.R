# install.packages("MASS")
library(MASS)

mydata <- read.csv("Mall_Visits.csv")
str(mydata)
hist(mydata$Visit, breaks=0:10)

poisson.res <- glm(Visit~., family = poisson, data = mydata)
summary(poisson.res)

y <- mydata$Visit
yhat <- predict(poisson.res, type="response")
sum((y-yhat)^2/yhat)/(nrow(mydata) - length(coef(poisson.res)))

nb.res <- glm.nb(Visit~., data = mydata)
summary(nb.res)

cbind(AIC(poisson.res), AIC(nb.res))
cbind(BIC(poisson.res), BIC(nb.res))

xbar <- colMeans(mydata)[2:6]
xb.pos <- crossprod(coef(poisson.res), c(1, xbar))
xb.nb <- crossprod(coef(nb.res), c(1,xbar))
k <- 0:10
p1 <- dpois(k, exp(xb.pos))
p2 <- dnbinom(k, size=nb.res$theta, mu=exp(xb.nb))
plot(k, p2, pch=16, xlab="Visits", ylab="Prob")
points(k,p1)
legend("topright", c("Poisson", "Negative Binomial"), pch=c(1:16))
