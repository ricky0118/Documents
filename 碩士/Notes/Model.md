# Model

Model is the mathematical relation(function) between the input layer and output layer. And the type of mathematical function will depend on domain knowledge.

## For example

The following equation is the most traditional linear regression model(linear model). $x_1$ is the input of the model, called "**feature**". And $y$ is the output of the model.
$$y = \rm{w}x_1 + b$$
There have two parameters that are unknown. One is multiplied with the input layer, called "**weight**". And the other is added to the end, called "**bias**".

For more than one feature. The model equation will become
$$y = \sum^{n}_{j=1}\rm{w}_j\rm{x}_j + b$$
