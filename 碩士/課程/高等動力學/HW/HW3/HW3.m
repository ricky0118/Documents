%% Advanced Dynamics HW.3
% Programer: PO-HSUN WU
% Last edit date: 2021/10/31 16:10

%% Formula of motion
clear;clc;close all
syms t r theta omega real
theta = omega*t;
r_C = [r*theta r];
r_Cp = [r*theta 0];
r_Cpp = [r*theta 2*r];
r_M = [r*(theta-sin(theta)) r*(1-cos(theta))];
r_CpM = simplify(r_M-r_Cp);
r_CppM = simplify(r_M-r_Cpp);

v_Cp = simplify(diff(r_Cp, t));
v_M = simplify(diff(r_M, t));
mag_v_M = simplify(sqrt(v_M(1)^2+v_M(2)^2));

DotProduct_r_CpM_v = simplify(dot(r_CpM, v_M));
DotProduct_r_CppM_v = simplify(dot(r_CpM, r_CppM));

a_M = diff(v_M,t);

%% Calculate the values of the motion
% Setup some condition
tn = 0:0.01:10;
omegan = 1;
rn = .5;
parameters = {tn, rn, omegan};

% Substitute the condition values to the equation of motion
position_M = double(subs(r_M', {t, r, omega}, parameters));
position_C = double(subs(r_C', {t, r, omega}, parameters));
velocity_M = double(subs(v_M', {t, r, omega}, parameters));
Acceleration_M = double(subs(a_M', {t, r, omega}, parameters));

%% Animate of the motion
figure()
AnimateSpeed = 50;
tspan = 1:AnimateSpeed:length(tn);
while 1
for i = tspan
    clf                                                                                     % Clear the figure
    
    % Find out the values until the current time
    EndPosition_M = position_M(:,i);
    EndVelocityVector_M = velocity_M(:,i);
    EndAccVector_M = Acceleration_M(:,i);
    EndPosition_C = position_C(:,i);

    % Plot out the figure
    hold on; daspect([1 1 1])
    plot(position_M(1,1:i), position_M(2,1:i), 'LineWidth', 1.5)                            % Plot the trajectory
    viscircles(EndPosition_C', rn, 'LineWidth', 1, 'Color', 'k');                           % Plot the circle
    quiver(EndPosition_M(1), EndPosition_M(2), EndVelocityVector_M(1), EndVelocityVector_M(2), ...
        'LineWidth', 1.5, 'Color', 'r', 'MaxHeadSize', 0.5);                                % Draw the velocity vector of point M
    quiver(EndPosition_M(1), EndPosition_M(2), EndAccVector_M(1), EndAccVector_M(2), ...
        'LineWidth', 1.5, 'Color', 'g', 'MaxHeadSize', 0.5);                                % Draw the acceleration of point M
    plot(position_M(1,i), position_M(2,i), '.', 'Color', 'c', 'MarkerSize', 15)             % Draw the point M
    plot(position_C(1,i), position_C(2,i), '.', 'Color', 'k', 'MarkerSize', 5)              % Draw the point C
    
    title('The trajectory of point M')
    legend('Trajectory', 'Velocity', 'Acceleration', 'Point M', 'Point C')
    xlabel('x'); ylabel('y')
    xlim([-1 8]); ylim([-1 4])
    % xlim([position_C(1,i)-3 position_C(1,i)+3])                                             % Focus on the point C
    grid()
    drawnow
end
tspan = flip(tspan);
end