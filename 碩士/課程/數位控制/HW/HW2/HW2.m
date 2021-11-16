%% Digital Control HW.2
% Programer: PO-HSUN WU
% Last edit date: 2021/10/06 14:30

%% 1 Plot the root locus and calculate the result
clear;clc;close all
p = 2.88;
Kp = 5.32;
G = tf(0.5, [1 0.5 0]);
Gp = tf([1 1], [1 p]);
rlocus(G*Gp)
damp(feedback(Kp*Gp*G,1))

%% 2 Calculate the phase margin with phase lead controller
clear;clc;close all
G = tf(0.5, [1 0.5 0]);
Gc = 3.9077*tf([1 .3161],[1 1.2352]);
margin(feedback(G*Gc,1))