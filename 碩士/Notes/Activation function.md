# Activation Function
The activation function is like a switch of a node in a neural network. However, the nonlinear activation functions can allow the network to compute a complex problem using only a small number of nodes.

## Some types of activation function

### 1. Sigmoid Function
To solve the problem of the linear model. We take a function called "Sigmoid" to approach the complex function, and this kinds of function is called "[[Activation function]]".
$$\rm{sigmoid}(x) = \frac{1}{1+e^{-x}}$$
With different parameters, the sigmoid function can approach different kinds of shapes.
![[SigmoidFunction.JPG|400]]

For more than one input. The model will become
$$y = b + \sum_i \rm{c}_i\ sigmoid(\rm{b}_i+\sum_j \rm{w}_{ij}\rm{x}_j)$$
$i$ is the [[HyperParameters#Number of Activate Function| number of the sigmoid function]]. $j$ is the number of the input layer. 
In matrix form,
$$y = b + \rm{C}^T\sigma(B+WX)$$
$W$ is a $i \times i$ matrix, $X$ and $C$ are a $i \times 1$ vector, and both $y$ and $b$ are a scalar.

### 2. Hard Sigmoid function
Hard sigmoid function is a piecewise linear function. It keep the basic shape of sigmoid function, but using the simpler function. There are preferred where speed of computation is more important than precision.
![[HardSigmoid.jpg|400]]

### 2. Rectified Linear Unit (ReLU)
To approach the hard sigmoid function, we using Rectified linear unit(ReLU). The equation will write in following
$$f(\rm{x}) = \max(0,x)$$
![[ReLU.png|400]]

Using two ReLU function can become a hard sigmoid function.
![[ReLU2HardSigmoid.JPG|400]]