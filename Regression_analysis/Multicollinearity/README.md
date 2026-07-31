# Multicollinearity


Multicollinearity refers to a situation in statistical modelling where two or more predictor variables in a multiple regression model are highly correlated, meaning that one can be linearly predicted from the others with a substantial degree of accuracy. This correlation among predictors can cause problems in estimating the coefficients of the regression model because it inflates the standard errors, making it difficult to determine the individual effect of each predictor on the dependent variable.

### Indications of multicollinearity 

1. High standard errors for regression coefficients
2. Overall model is significant but none of the individual predictors
3. Large changes in coefficients as soon as a new predictor is added to the model
4. Coefficients have opposite signs that of expected from the theory
5. High VIF(variance inflation factor) and low tolerance:
   
   VIF measures how much the variance of a regression coefficient is inflated due to multicollinearity.VIF values greater than 10 or sometimes greater than 5 indicate high multicollinearity. The reciprocal of VIF is tolerance and a value close to zero indicates high multicollinearity. 
6. Cofficents of a subset of the sample are widely different
7. High condition indices:
   
   The condition index is derived from the eigenvalues of the scaled, centred matrix of predictors. A condition index greater than 30 indicates potential multicollinearity.

8. Eigenvalues and eigenvectors:

   Decompose the correlation matrix of the predictors. Small eigenvalues indicate multicollinearity.


## Addressing multicollinearity:

1. Remove highly correlated predictors
2. Combine variables:

3. Introducing principal component analysis and applying them as predictors can help.
4. Regularization methods e.g., Ridge regression, and Lasso regression where penalties for large coefficients are introduced can improve the effects of multicollinearity.
5. Cenetering the predictors:

   Subtracting the mean values of a specific predictor from its original value centers the values of predictors which can help in such a situation.

6. A bigger sample size if possible helps reduce the variance of the estimates.

In the Jupyter notebook, there is a worked-out example showing some of the effects and  how to improve the model introducing a few above-mentioned techniques.
