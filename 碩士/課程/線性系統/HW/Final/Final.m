%% Linear System Final exam
% Programer: PO-HSUN WU
% Last edit date: 2022/06/22 18:00

%% #3(b)(ii)
clear;clc;close all
theta = linspace(0, 2*pi, 1000);
y = abs(cos(theta)+2*sin(theta)) + abs(-2*cos(theta)+4*sin(theta));
figure()
polarplot(theta, y)
grid on
title("||Ax||_1")

y = sqrt((cos(theta)+2*sin(theta)).^2 + (-2*cos(theta)+4*sin(theta)).^2);
figure()
polarplot(theta, y)
grid on
title("||Ax||_2")

y = max(abs(cos(theta)+2*sin(theta)), abs(-2*cos(theta)+4*sin(theta)));
figure()
polarplot(theta, y)
grid on
title("||Ax||_\infty")

%% #3(c)
clear;clc;close all
k = 5;
m = 2;
q = k/m;
A = [ 0  0  1  0
      0  0  0  1
     -q  q  0  0
      q -q  0  0];
STM = @(t) expm(A*t);
x0 = [0 0 -1 1]';

t = 0:0.01:5;
x = zeros(length(t), 4);
for i = 1:length(t)
    x(i,:) = (STM(t(i))*x0)';
end

figure()
plot(t, x(:,1:2))
legend("y_1", "y_2")
grid on

figure()
plot(t, x(:,3:4))
legend("y_1^\cdot", "y_2^\cdot")
grid on



