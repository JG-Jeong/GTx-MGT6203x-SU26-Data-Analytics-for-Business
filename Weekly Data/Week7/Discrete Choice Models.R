# install.packages("mlogit")
library(mlogit)

mydata <- read.csv("heating_data.csv")
heating <- mlogit.data(mydata, shape="long", choice="depvar", alt.var="alt", child.var="chid")
head(heating)

ml.res <- mlogit(depvar~ic+oc, heating)
summary(ml.res)

head(fitted(ml.res, outcome=FALSE))

ic.avg <- tapply(heating$ic, heating$alt, mean)
ic.avg
oc.avg <- tapply(heating$oc, heating$alt, mean)
oc.avg
xval <- data.frame(ic=ic.avg, oc=oc.avg)
xval

effects(ml.res, covariate="oc", data=xval)
