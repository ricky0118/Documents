%% Advanced engineering mathematics HW.4
% Programer: PO-HSUN WU
% Last edit date: 2022/01/02 21:30

%%
clear;clc;close all
syms x c1 c2
y = c1*x*(pi/2-x)+c2*x^2*(pi/2-x);
I = int(2*x*y-y^2+diff(y,x)^2, x, 0, pi/2);

I_c1 = diff(I,c1);
I_c2 = diff(I,c2);

result = vpasolve([I_c1==0; I_c2==0], [c1 c2]);
c1_ = result.c1
c2_ = result.c2
I_min = vpa(subs(I, [c1, c2], [c1_, c2_]))


