# Multivariate Multiple Regression in R

Multivariate Multiple Regression is the method of modeling multiple responses, or dependent variables, with a single set of predictor variables.
Let's see an example.We would run the model on the iris dataset.

```
summary(iris)
pairs(iris)
```
```
model <- lm(cbind(Petal.Width, Petal.Length) ~ 
                Sepal.Length + Sepal.Width + Species, data = iris)
summary(model)
# The fitted values and residuals are now matrices
head(model$fitted.values)
head(model$residuals)

```

We can run individual model to check if the summary are different.

```
# The individual models
model1 <- lm(Petal.Width ~Sepal.Length + Sepal.Width + Species, data = iris)
model2 <- lm(Petal.Length ~Sepal.Length + Sepal.Width + Species, data = iris)

#Let's see if individual model provides same results'
summary(model1)
summary(model2)
```

Although fitting a multivariate linear regression is more relevant that running separate univariate fits, both are conceptually same. The situation becomes interesting in the inference for the multivariate linear regression, where the responses are not independent.


The coefficients are same if we consider the multivariate model or two individual univariate models but the variance-covariance matrix of the model coefficients varies.Therefore, the coefficients from both models covary. That covariance needs to be taken into account while determining if a predictor is jointly contributing to both models. We can test that by running anova function.

```
vcov(model)
library(car)
anova(model)
```
The anova() function automatically detects that model is a multivariate multiple regression object. In this model predictors are tested assuming all other predictors are already in the model.  We can rerun the analyses looking into the results from this test with reduced number of variables. 
