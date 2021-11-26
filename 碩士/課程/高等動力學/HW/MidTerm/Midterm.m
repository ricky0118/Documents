%% Advanced Dynamics Midterm
% Programer: PO-HSUN WU
% Last edit date: 2021/11/17 16:26

%% 
clear;clc;close all
syms t 
a = 3*sqrt(2);
b = 6;
n = 100/60;
phi = acos((b/2)/a);
theta = n*t;

OP = (2+cos(pi*t)) * [cos(phi); sin(phi)*sin(theta); sin(phi)*cos(theta)];
v_OP = simplify(diff(OP,t));
a_OP = simplify(diff(v_OP,t));

mag_v = sqrt(v_OP(1)^2 + v_OP(2)^2 + v_OP(3)^2);
mag_a = sqrt(a_OP(1)^2 + a_OP(2)^2 + a_OP(3)^2);

% pretty(mag_v)

%%
syms t
% setup the equations of partical along to line of OA.
OP_OA = 2+cos(pi*t);
v_OP_OA = simplify(diff(OP_OA,t));
a_OP_OA = simplify(diff(v_OP_OA,t));

% find the time when the velocity is maximum
t_max = solve(a_OP_OA==0, t);
% substitude the time condition into the formula of magenitude of acceleration.
acceleration_at_maximum_v_along_OA = vpa(subs(mag_a, t, t_max))
