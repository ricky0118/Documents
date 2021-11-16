%% Advanced Dynamics HW.2
% Programer: PO-HSUN WU
% Last edit date: 2021/10/24 13:30

%% Setup some condition
clear;clc;close all
syms t dr a R0 R1
R0n = 4;
R1n = 14;
an = 0.0889;
v = a*t;
w = 0.05;

%% Calculate final time
eqn_Vr = int(v, t, 0, t)-int(1, dr, R0, R1);
eqn_t = simplify(solve(eqn_Vr,t));

t_final = abs(subs(eqn_t, {R0 R1 a}, {R0n R1n an}));

%% Calculate the trajectory of the particle
r = R0n + int(v,t);
theta = 0 + int(w,t);
tn = 0:0.01:t_final;
rn = subs(r, {a t}, {an, tn});
thetan = subs(theta, {t}, {tn});

polarplot(thetan,rn)
rlim([0 15])
title("The trajectory of the particle")
