%%
clear;clc;close all
r = 1:0.01:1000;
v = sqrt(2-2./(1+r)) + sqrt(r.^-1).*(1-sqrt(2-2./(1+r.^-1))) - 1;
plot(r,v)