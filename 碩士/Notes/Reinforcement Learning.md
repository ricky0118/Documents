# Reinforcement Learning
***Reinforcement Learning (RL)*** is a machine learning paradigm in which an agent ==interacts with its environment== in order to learn a task over time.
## Framework
At each ==discrete time==-step, the agent receives ==observation== and a ==[[Reward system|single numerical reward]]== from the environment. And the observations are used as input to evaluate the agent ==to produce the action==. The objective of the agent is to ==maximize the returned reward== overtime to develop an optimal policy.
![[RL_framework.png|400]]

## RL algorithm
RL algorithm is a tuner of NN. It determines ==how the NN weights are updated== depending on the agents ==current==, and ==past== interactions with the environment and ==rewards received==.

### Several state-of-the-art algorithms:
- Deep Deterministic Policy Gradient (DDPG)
It provides improvement to Deep Q-Network (DQN) for continuous action domain. It is also a model-free algorithm meaning it ==can learn the policy without having to first generate a model==.

- Trust Region Policy Optimization (TRPO)
It's similar to natural gradient policy methods however this method guarantees guarantees monotonic improvement

- Proximal Policy Optimization (PPO)
PPO is also a policy gradient method and has similarities to TRPO. Many RL algorithms can be very sensitive to hyperparameter tuning in to obtain good results. Part of the reason PPO is so widely adopted is due to it being easier to tune than other RL algorithms.