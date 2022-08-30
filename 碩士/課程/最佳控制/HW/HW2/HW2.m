%% Optimal control HW.2
% Programer: PO-HSUN WU
% Last edit date: 2022/03/08 15:00

%% #2(c)
clear;clc;close all
[x1, x2] = meshgrid(-1:0.01:1, -1:0.01:1);
y = x1.^2+x1.*x2+x2.^2;
contour(x1, x2, y, 0:0.2:5, "ShowText", "on")

