%% Digital Control HW.7
% Programer: PO-HSUN WU
% Last edit date: 2021/12/29 11:00

%%
%
% Make sure the Solver Type for Simulink model setting was "Fixed-step".
%

%% #1
clear;clc;close all
SamplerTime = 1;
SamplerShift = 0;
end_time = 10;
step = 0.01;
result = sim("HW7_1", 'TimeOut', end_time, 'FixedStep', num2str(step));
t = result.tout;
yt = result.yt.data;

tn = zeros(end_time+1,1);
yn = zeros(end_time+1,1);
for i=1:length(tn)
    tn(i) = t((i-1)/step+1);
    yn(i) = result.yn.data((i-1)/step+1);
end

plot(t, yt, "b-", tn, yn, "ro")
grid(); legend("y(t)", "y(nT)")

%% #2
clear;clc;close all
end_time = 10;
step = 0.01;
result = sim("HW7_2", 'TimeOut', end_time, 'FixedStep', num2str(step));
t = result.tout;
yt = result.yt.data;

tn = zeros(end_time+1,1);
yn = zeros(end_time+1,1);
for i=1:length(tn)
    tn(i) = t((i-1)/step+1);
    yn(i) = result.yn.data((i-1)/step+1);
end

plot(t, yt, "b-", tn, yn, "ro")
grid(); legend("y(t)", "y(nT)")
