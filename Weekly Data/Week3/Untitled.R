install.packages("censReg")
library(censReg)

# simulate the data
# 2 와 6 사이의 숫자를 100개 뽑고, 그걸 오름차순으로 정렬해서 x에 할당
x <- sort(runif(100, 2, 6))
# rnormm(100)이건 error term rnorm< standard normal distribution임
ystar <- -4 + 1*x + rnorm(100)
y <- ystar
y[ystar<0] <- 0 # censored below at zero!

plot(x,y)

# Simple linear regression
lm.res <- lm(y~x)
summary(lm.res)
lines(x, predict(lm.res) , lty = 2)

abline(-4,1,lty=3)

# Tobit model
tobit.res <- censReg(y~x)
summary(tobit.res)

beta <- coef(tobit.res)[1:2]
sigma <- exp(coef(tobit.res)[3]) # The last coefficient is logSigma !!!

xb <- beta[1] + beta[2]*x
lines(x, xb, lty=1)

# Partial effects
Ey <- pnorm(xb/sigma)* xb + sigma*dnorm(xb/sigma)
lines(x, Ey, lty=1)

marg.eff <- pnorm(xb/sigma)*beta[2]
lines(x, marg.eff, lty=1)

abline(h=coef(lm.res)[2], lty=2)

margEff(tobit.res, c(1,2,5))
margEff(tobit.res, c(1,6))







