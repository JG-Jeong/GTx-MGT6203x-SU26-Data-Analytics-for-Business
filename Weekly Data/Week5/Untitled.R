# install.packages("survival")
library(survival)

mydata <- read.csv("Repurchase.csv")

surv.res <- survreg(Surv(Repurchase, 1-Censored)~. -CustomerID, data=mydata, dist="weibull")
summary(surv.res)

a <- 1/surv.res$scale

beta <- -coef(surv.res)*a

xbar <- colMeans(mydata[,2:4])
xbeta <- crossprod(c(1,xbar), beta)
curve(exp(c(xbeta))*a*x^(a-1), xlim = c(0,20), xlab="time", ylab="hazard")

curve(dweibull(x, shape=a, scale=exp(-xbeta/a)), xlab="Repurchase Time", ylab = "density", xlim=c(0,300), ylim=c(0,0.032))
hist(mydata$Repurchase[mydata$Censored==0], breaks=50, freq=FALSE, add=TRUE, col=NULL)
