%% Digital Control HW.9
% Programer: PO-HSUN WU
% Last edit date: 2022/01/09 16:33

%%
clear;clc;close all
% Setup some conditions
syms z
syms n p K real
assume(K, 'positive');
T = 0.1;

% Define the system transfer function.
G = tf(0.1, conv([1 0],[1 0.1]));
G_z = c2d(G, T, 'zoh');
G_sym = poly2sym(cell2mat(G_z.num),z)/poly2sym(cell2mat(G_z.den),z);
D_sym = (z-n)/(z-p);

% Design the desired poles to approach the control goal.
zeta = 0.8;
wn = 20;
desired_pole = exp(T*(-zeta*wn+1j*wn*sqrt(1-zeta^2)));
% Setup the character equation of the system.
mag_char = norm(D_sym*G_sym) == norm(-1/K);
phase_char = angle(D_sym*G_sym) == angle(-1/K);

% Solve the parameters of the controller.
n_ = 0.92;
p_ = vpasolve(subs(phase_char, [z, n], [desired_pole, n_]), p);
K_ = vpasolve(subs(mag_char, [z, n, p], [desired_pole, n_, p_]), K);

% Setup the transfer function of the compensate controller and the feedback system.
D_z = tf([1 -double(n_)], [1 -double(p_)], T);
sys = feedback(double(K_)*D_z*G_z, 1);

% Analysis the design result.
result = stepinfo(sys, 'SettlingTimeThreshold', 0.01);
step(sys);
PO = result.Overshoot
ts = result.SettlingTime

