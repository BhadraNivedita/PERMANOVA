library(lme4)
library(lattice)

?sleepstudy
data(sleepstudy)
str(sleepstudy)
sleepstudy[1:5,]
#attach(sleepstudy)

## 10 days, 18 subjects
table(Days, Subject)
length(unique(Subject))

## order the subjects by their intercepts
xyplot(Reaction ~ Days | Subject, sleepstudy, aspect = "xy",
       layout = c(6,3), type = c("g", "p", "r"),
       index.cond = function(x,y) coef(lm(y ~ x))[1],
       xlab = "Days of sleep deprivation",
       ylab = "Average reaction time (ms)")

### model1:
fm0 = lmer(Reaction ~ 1 + (1 | Subject), sleepstudy)
summary(fm0)


#model2:
fm1 = lmer(Reaction ~ 1 + Days + (1 | Subject), sleepstudy)
summary(fm1)

#model3:
fm2 = lmer(Reaction ~ Days + (Days | Subject),   sleepstudy)
summary(fm2)
## short-hand notation for
## fm2 = lmer(Reaction ~ 1 + Days + (1 + Days | Subject), sleepstudy)


#model4:
## The default is RMLE. To get MLE, we need to set REML = FALSE
fm2.mle = lmer(Reaction ~ Days + (Days | Subject), sleepstudy, REML=FALSE)
## Compare the output from fm2 and fm2.mle
summary(fm2.mle)

#model5:
fm3 = lmer(Reaction ~ 1 + Days + (1 | Subject) + 
             (0 + Days | Subject), sleepstudy)

## Note that the expression is 
## NOT "1 + Days + (1 | Subject) + (Days | Subject)"

summary(fm3)

##Comparison between fm3 and fm2 models:
anova(fm3, fm2)

#model6:
fm3.mle = lmer(Reaction ~ Days + (1 | Subject) + (Days | Subject),
               sleepstudy, REML=FALSE)

##Extract the modes of the random effects 
ranef(fm3)

dotplot(ranef(fm3), condVar=TRUE)  ## not working; no PIs

dotplot(ranef(fm2), condVar=TRUE)

mycoef=ranef(fm3)[["Subject"]]
mycoef[1:5,]
