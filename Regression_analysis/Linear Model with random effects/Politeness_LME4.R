library(lme4)

politeness<-read.csv("politeness_data.csv")

#which(is.na(politeness$frequency))
boxplot(frequency ~ attitude*gender,col=c("white","lightgray"),politeness)
politeness.model1 = lmer(frequency ~ attitude +
                          (1|subject) + (1|scenario), data=politeness)

summary(politeness.model1)

politeness.model2 = lmer(frequency ~ attitude +
                          gender + (1|subject) +
                          (1|scenario), data=politeness)


summary(politeness.model2)


politeness.model3 = lmer(frequency ~ attitude +
                          gender + (1+attitude|subject) +
                          (1+attitude|scenario),
                        data=politeness,
                        REML=FALSE)

coef(politeness.model3)


politeness.null = lmer(frequency ~ gender +
                         (1+attitude|subject) + (1+attitude|scenario),
                       data=politeness, REML=FALSE)


anova(politeness.null,politeness.model1)







