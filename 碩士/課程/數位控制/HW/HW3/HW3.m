%% Digital Control HW.3
% Programer: PO-HSUN WU
% Last edit date: 2021/10/13 20:00

%% #1
clear;clc;close all
x = [0 0];
k2r = @(k) k+2;
for k = 0:100
    if k2r(k-2) >= 2
        u = 1;
    else
        u = 0;
    end
    x(k2r(k)+1) = 1.3*x(k2r(k-1)+1)-0.4*x(k2r(k-2)+1)+u;
end
plot(1:length(x)-2,x(3:end))
grid()
xlabel("k")
ylabel("x")