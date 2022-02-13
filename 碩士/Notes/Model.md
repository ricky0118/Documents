# Model

Model is the mathematical relation(function) between the input layer and output layer. The type of mathematical function will depend on domain knowledge. For the unknown parameters that we need to optimize, we give it a symbol $\theta$ to represent them. And the $\theta$ can be a scale or a vector.

## Some type of models

### 1. Linear Regression(Linear model)
Linear regression is the most traditional model. The following equation is the most simple linear model with single input single output(SISO). $x_1$ is the input of the model, called "**feature**". And $y$ is the output of the model.
$$y = \rm{w}x_1 + b$$
In the equation, there have two parameters that are unknown. One is multiplied with the input layer, called "**weight**". And the other is added to the end, called "**bias**".

For more than one input. The model equation will become
$$y = \sum^{n}_{j=1}\rm{w}_j\rm{x}_j + b$$

==But== the linear model is too simple, it can't be approached to complex functions. Because the linear model can only approach a line, the linear model has severe limitations.

### 2. [[Neural Network]]
Neural Network is similar on the linear regression, but there have a big different between both. Following is a node 

