%% Optimal control HW.5
% Programer: PO-HSUN WU
% Last edit date: 2022/04/21 09:10

%% #6
clear;clc;close all
[time, state] = ode45(@ode, [0 10], [0; 0; 10; 0]);

figure(); hold on
plot(state(:,1), state(:,2))
grid on
xlabel("x"); ylabel("y")

function dstate = ode(~, state)
    % Parameter define:
    %   - state: [x; y; V; gamma]
    
    g = 9.81;
    dx = state(3)*cosd(state(4));
    dy = state(3)*sind(state(4));
    
    dstate = [dx; dy; -g*sind(state(4)); g*cosd(state(4))/state(3)];
end
