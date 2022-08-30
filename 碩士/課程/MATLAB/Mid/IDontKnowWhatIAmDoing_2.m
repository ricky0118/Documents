%% MATLAB midterm
% Programer: PO-HSUN WU
% Last edit date: 2022/04/22 20:05

%%
clear;clc;close all
% Parameter define
x = linspace(-2*pi, 2*pi, 100);

% Calculate the curve value
y1 = sin(x);
y2 = cos(x);

% Plot the figure
figure(); hold on
plot(x, y1, 'LineWidth', 1)
plot(x, y2, 'LineWidth', 1)

title("Wave curve")
legend('y1', 'y2')
xlim([-2*pi 2*pi]); ylim([-1.1 1.1])
xticks(-2*pi:pi:2*pi); yticks(-1:0.5:1)
xticklabels({'-2\pi', '\pi', '0', '\pi', '2\pi'})
xlabel('x'); ylabel('y')
grid on

