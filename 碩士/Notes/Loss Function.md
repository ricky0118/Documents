# [[Loss function]]

The loss function is a function of parameters. The output of the loss function is called "**[[#Loss| Loss]]**". It is the error between the model value and the true value(or called Label). It is to determine how good a set of parameters was.

## For example

$L(1, 500)$ is the error between the linear model $y = 1x_1 + 500$ and the current true value(Label).

---

# Loss

Loss is ==the average of the errors==. It's can determine the accuracy of the model. If the loss is smaller then the model will be more accurate.

## Several methods to calculate the error

1. Mean absolute error
    $$e = |y-\hat{y}|$$
2. Mean square error
    $$e = (y-\hat{y})^2$$