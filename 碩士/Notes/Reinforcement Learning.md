# Contents
- [[#^ReinforcementLearning| Reinforcement Learning]]
	- [[#^framework| Framework]]
	- [[#^rlAlgorithm| RL algorithm]]
		- [[#^severalalgorithm| Several state-of-the-art algorithms]]
	-  [[#^challenges| The challenges in RL for attitude control]]
		-  [[#^precisionaccuracy| Precision and Accuracy]]
		-  [[#^robustnessadaptation| Robustness and Adaptation]]
		-  [[#^reward| Reward Engineering]]

------
# Reinforcement Learning

^ReinforcementLearning

***Reinforcement Learning (RL)*** is a [[Machine Learning| machine learning]] paradigm in which an agent ==interacts with its environment== in order to learn a task over time.
## Framework

^framework

At each ==discrete time==-step, the agent receives ==observation== and a ==[[Reward system|single numerical reward]]== from the environment. And the observations are used as input to evaluate the agent ==to produce the action==. The objective of the agent is to ==maximize the returned reward== overtime to develop an optimal policy.
![[RL_framework.png|400]]

## RL algorithm

^rlAlgorithm

RL algorithm is a tuner of NN. It determines ==how the NN weights are updated== depending on the agents ==current==, and ==past== interactions with the environment and ==rewards received==.

### Several state-of-the-art algorithms:

^severalalgorithm

> ### Deep Deterministic Policy Gradient (DDPG)
> It provides improvement to Deep Q-Network (DQN) for the continuous action domain. It is also a model-free algorithm meaning it ==can learn the policy without having to first generate a model==.

> ### Trust Region Policy Optimization (TRPO)
> It's similar to natural gradient policy methods however this method guarantees monotonic improvement.

> ### Proximal Policy Optimization (PPO)
> PPO is also a policy gradient method and has similarities to TRPO. Many RL algorithms can be very sensitive to hyperparameter tuning in to obtain good results. Part of the reason PPO is so widely adopted is due to it being easier to tune than other RL algorithms.

## The challenges in RL for Attitude Control

^challenges

### Precision and Accuracy

^precisionaccuracy

In the case of optimal attitude control, there is ==little tolerance and flexibility== as to the sequence of control signals that will achieve the desired attitude of the aircraft. ==Even the slightest deviations can lead to instabilities.==

### Robustness and Adaptation

^robustnessadaptation

It remains unknown what range of uncertainty the controller can operate safely before adaptation is necessary. For instance what will be be the necessary adaptation rate and what sensor data can be collected from the real world to update the RL environment.

> ### Robustness
> Robustness refers to the controller's performance in the presence of uncertainty when control parameters are fixed.

> ### Adaptiveness
> Adaptiveness refers to the controller's performance to adapt to the uncertainties by adjusting the control parameters.

### Reward Engineering

^reward

In the context of attitude control, the reward must encapsulate the agent's performance achieving the desired attitude goals. As goals become more complex and demanding identifying which performance metrics are most expressive will be necessary to push the performance.
