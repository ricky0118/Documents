# Contents
- [[#^7bf87c| Reinforcement Learning]]
	- [[#^12fe5c| Framework]]
	- [[#^8efcdc| RL algorithm]]
		- [[#^278105 | Several state-of-the-art algorithms]]
	-  [[#^51d058| The challenges in RL for attitude control]]

------
# Reinforcement Learning

^7bf87c

***Reinforcement Learning (RL)*** is a machine learning paradigm in which an agent ==interacts with its environment== in order to learn a task over time.
## Framework

^12fe5c

At each ==discrete time==-step, the agent receives ==observation== and a ==[[Reward system|single numerical reward]]== from the environment. And the observations are used as input to evaluate the agent ==to produce the action==. The objective of the agent is to ==maximize the returned reward== overtime to develop an optimal policy.
![[RL_framework.png|400]]

## RL algorithm

^8efcdc

RL algorithm is a tuner of NN. It determines ==how the NN weights are updated== depending on the agents ==current==, and ==past== interactions with the environment and ==rewards received==.

### Several state-of-the-art algorithms:

^278105

- Deep Deterministic Policy Gradient (DDPG)
It provides improvement to Deep Q-Network (DQN) for the continuous action domain. It is also a model-free algorithm meaning it ==can learn the policy without having to first generate a model==.

- Trust Region Policy Optimization (TRPO)
It's similar to natural gradient policy methods however this method guarantees monotonic improvement.

- Proximal Policy Optimization (PPO)
PPO is also a policy gradient method and has similarities to TRPO. Many RL algorithms can be very sensitive to hyperparameter tuning in to obtain good results. Part of the reason PPO is so widely adopted is due to it being easier to tune than other RL algorithms.

## The challenges in RL for Attitude Control

^51d058

### Precision and Accuracy
In the case of optimal attitude control, there is ==little tolerance and flexibility== as to the sequence of control signals that will achieve the desired attitude of the aircraft. ==Even the slightest deviations can lead to instabilities.==

### Robustness and Adaptation
It remains unknown what range of uncertainty the controller can operate safely before adaptation is necessary. For instance what will be be the necessary adaptation rate and what sensor data can be collected from the real world to update the RL environment.

> ### Robustness
> Robustness refers to the controller's performance in the presence of uncertainty when control parameters are fixed.

> ### Adaptiveness
> Adaptiveness refers to the controller's performance to adapt to the uncertainties by adjusting the control parameters.

### Reward Engineering

