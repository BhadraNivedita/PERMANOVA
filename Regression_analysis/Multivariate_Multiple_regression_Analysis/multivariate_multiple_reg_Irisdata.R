model <- lm(cbind(Petal.Width, Petal.Length) ~ 
                Sepal.Length + Sepal.Width + Species, data = iris)
summary(model)


# The fitted values and residuals are now matrices
head(model$fitted.values)

head(model$residuals)



# The individual models
model1 <- lm(Petal.Width ~Sepal.Length + Sepal.Width + Species, data = iris)
model2 <- lm(Petal.Length ~Sepal.Length + Sepal.Width + Species, data = iris)

#Let's see if individual model provides same results'
summary(model1)

summary(model2)


# Confidence intervals for the parameters
confint(model)


# Prediction -- now more limited without confidence intervals implemented
predict(model, newdata = iris[1:3, ])

# MANOVA table
manova(model)
