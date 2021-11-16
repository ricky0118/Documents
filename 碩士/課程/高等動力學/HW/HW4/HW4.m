%% Advanced Dynamics HW.4
% Programer: PO-HSUN WU
% Last edit date: 2021/11/05 11:00

%% Setupt the equation of motion
clear;clc;close all
syms t x y omega m F
F = [cos(omega*t) sin(omega*t)];
acc = F/m;
vel = int(acc,0,t);
pos = int(vel,0,t);

%% Calculate and plot the trajectory
% Substitute the condition values to the equation of motion
omegan = 1;
mn = 1;
tn = 0:0.01:2*pi()/omegan;
targets = {t, omega, m};
values = {tn, omegan, mn};
posn = double(subs(pos', targets, values));
veln = double(subs(vel', targets, values));
accn = double(subs(acc', targets, values));
Fn = double(subs(F', targets, values));

figure()
AnimateSpeed = 5;
for index = 1:AnimateSpeed:length(tn)
    clf
    
    hold on; daspect([1 1 1])
    % Plot the trajectory
    plot(posn(1,1:index), posn(2,1:index), 'LineWidth', 1.5, 'color', 'k')
    % Plot the velocity vector
    quiver(posn(1,index), posn(2,index), veln(1,index), veln(2,index), 'color', 'b', 'LineWidth', 1, 'MaxHeadSize',0.5)
    % Plot the acceleration vector
    quiver(posn(1,index), posn(2,index), accn(1,index)*1.03, accn(2,index)*1.03, 'color', 'm', 'LineWidth', 2, 'MaxHeadSize', 0.7)
    % Plot the force vector
    quiver(posn(1,index), posn(2,index), Fn(1,index), Fn(2,index), 'color', 'y', 'LineWidth', 1, 'MaxHeadSize', 0.5)
    % Draw the current point
    plot(posn(1,index), posn(2,index), '.', 'MarkerSize', 10, 'color', 'g')
    
    xlabel("x"); ylabel("y")
    xlim([int8(min(posn(2,:)))-1 int8(max(posn(2,:)))+1]); ylim([int8(min(posn(2,:))) int8(max(posn(2,:)))+1])
    legend({'Trajectory', 'Velocity', 'Acceleration', 'Force', 'Current point'})
    title('Trajectory of the particle')
    grid()
    
    drawnow
end
