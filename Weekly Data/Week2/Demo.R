mydata <- read.csv("Bank_customer_acquisition.csv")
str(mydata)
mydata$Loan <- as.factor(mydata$Loan)
str(mydata)

lpm.res <- lm(Acquisition~., data = mydata)
summary(lpm.res)
head(sort(predict(lpm.res)), 10)
tail(sort(predict(lpm.res)), 10)

# glm = general linear model
logit.res <- glm(Acquisition~., family = binomial(link=logit), data=mydata)
summary(logit.res)
yhat <- rep(1, nrow(mydata))
#요게 중요
yhat[predict(logit.res, type="response") < mean(mydata$Acquisition)] <- 0

confusion <- table(yhat, mydata$Acquisition)
confusion
sum(diag(confusion)) / sum(confusion)
confusion[1,1] / sum(confusion[,1])
confusion[2,2] / sum(confusion[,2])

coef(logit.res)
colMeans(mydata[,1:4])
exp(-2.474310e+00+7.540167e-03*5.56570e+01+1.885287e-05*9.22310e+04+1.163095e-06*3.10222e+05-5.215652e-01*1.64933e+00+2.394259e-02)/(1+exp(-2.474310e+00+7.540167e-03*5.56570e+01+1.885287e-05*9.22310e+04+1.163095e-06*3.10222e+05-5.215652e-01*1.64933e+00+2.394259e-02))
xvalues <- data.frame(Age=5.56570e+01, Income=9.22310e+04, HomeVal=3.10222e+05, Dist2Bank=1.64933e+00, Loan="Yes")
predict(logit.res, newdata=xvalues, type="response")

coef.lpm <- coef(lpm.res)
coef.logit <- coef(logit.res)
cbind(coef.lpm, coef.logit)

xvalues <- data.frame(Age=5.56570e+01, Income=9.22310e+04, HomeVal=3.10222e+05, Dist2Bank=1.64933e+00, Loan="Yes")
xb <- predict(logit.res, newdata=xvalues)
PE.logit <- dlogis(xb) * coef(logit.res)[-1]
PE.lpm <- coef(lpm.res)[-1]
cbind(PE.lpm, PE.logit)




