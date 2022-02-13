# Optimization

The optimization problem(or call "**[[Training| training]]**") is finding a set of parameters to minimize the [[Loss Function| loss]]. ==The optimization was basic on known datas or training data.==
$$\theta^* = arg \min_\theta{L}$$
$\theta^*$ is the optimal solution of the optimization problem. $arg \min$ means the argument of minima of the loss function.

## Method of Optimization

### 1. Gradient Descent

#### The step of method:
1. Randomly pick an initial state $\theta^0$.
2. Compute the gradient of the loss $g = \nabla L(\theta^0)$.
3. Determine the [[HyperParameters#Learning Rate| learning rate]] $\eta$.
4. Update $\theta$ iteratively.
$$\theta^{n+1} = \theta^n - \eta g$$
5. Iterate until the gradient of the loss is zero or the loss can be allow.

#### Problem of Gradient Descent:
1. Only can find the local minima. Can't find the global minima.
