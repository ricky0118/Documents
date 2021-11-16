clear;clc;close all

mean_anomly = deg2rad(30);
pericenter = 500+6378;
apocenter = 36000+6378;
a = (apocenter+pericenter)/2;
c = a-pericenter;
e = c/a;

syms E
eqn = mean_anomly == E-e*sin(E);
E = solve(eqn);

ture_anomaly = vpa(atan2(sqrt(1-e^2)*sin(E), cos(E)-e)*180/pi())