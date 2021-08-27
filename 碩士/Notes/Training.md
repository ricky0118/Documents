# Contents
- [[#^218a5d| Training]]
	- [[#^8befca| Simulate evironment]]
		- [[#^96b7f3| Introduction]]
		- [[#^cbc842| Digital twin]]
		- [[#^587498| Cyber-Physical system]]
		- [[#^67b661| Real gap]]
			- [[#^99c38e| Reducing the real gap]]
			- [[#^2fff22| Domain randomization]]

------
# Training

^218a5d

Training is the process of turning the NNs weights.

## Simulate environment

^8befca

### Introduction

^96b7f3

Tuning a flight controller ==in the real world== is a time consuming task. So that, ==simulated environments== are an attractive option for developing automated systematic methods for tuning.

在==真實世界==調整控制器是一個非常消耗時間的任務，因此==模擬環境==是一個極具吸引力的自動化調整方案。

### Digital Twin

^cbc842

A ***digital twin*** is a virtual representation that serves as the real-time digital counterpart of a physical object or process. To synthesize this controller in simulation, we need is a ==Digital replica== or 「Digital twin」 of the aircraft.

### Cyber-Physical System

^587498

A ***Cyber-Physical System*** or ***intelligent system*** is a computer system in which a ==mechanism is controlled or monitored== by computer-based algorithms. In cyber-physical systems, ==physical and software components are deeply intertwined==.Once is put into service, it is ==kept in synchronization== with its digital twin through the collection of state information from its sensors.

### Real gap

^67b661

In the real world dynamic will include many randomize disturbance, but we can't put it into the numerical dynamic model. Then the error between the real value and simulate value called ***Real gap***.

#### Reducing the real gap

^99c38e

- ##### Using hardware in the loop (HITL) method
Using the actual hardware to eliminate the *observed noise*.
> ### Observed noise
> Observed noise is created from a Gaussian distribution with the standard deviation equal to that of the ==collected empirical data==.

- ##### Injected noise into simulator
The disturbance in the real world was random. So that, injected some noise at all inputs to blur the two running environments together. Results verify previous work claims that the addition of noise in the simulator provides improved performance in the real world.

#### Domain randomization

^2fff22

***Domain randomization*** randomizes parts of the simulation environment with the idea being if the simulation has enough variety. And it's a generalized method for adding variation to the environment which consists of the use of noise. 

In addition to applying noise to the observations and randomizing visual properties they also randomized physical parameters such as friction and introduce delays and noise to the actions.

