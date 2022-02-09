# Optimization

The optimization problem(or call "**[[Training| training]]**") is finding a set of parameters to minimize the [[Loss Function| loss]]. ==The optimization was basic on known datas or training data.==
$$\rm{w}^*, \rm{b}^* = arg \min{L}$$
$\rm{w}^*$ and $\rm{b}^*$ are the optimal solution of the optinization problem. $arg \min$ means the argument of minima of the loss function.

## Method of Optimization

### 1. Gradient Descent

#### The step of method:
1. Randomly pick an initial value $\rm{w}^0$ and $\rm{b}^0$.
2. Compute the gradient of the loss $\frac{\partial L}{\partial \rm{w}}|_\rm{w = w^0}$ and $\frac{\partial L}{\partial \rm{b}}|_\rm{b = b^0}$.
3. Determine the [[HyperParameters| learning rate]] $\eta$.
4. Update $\rm{w}$ iteratively.
$$\rm{w}^{n+1} = \rm{w}^{n} - \eta \frac{\partial L}{\partial \rm{w}}|_\rm{w = w^n}$$
$$\rm{b}^{n+1} = \rm{b}^{n} - \eta \frac{\partial L}{\partial \rm{b}}|_\rm{b = b^n}$$
5. Iterate until the gradient of the loss is zero or the loss can be allow.

#### Problen of Gradient Descent:
1. Only can find the local minima. Can't find the global minima.
