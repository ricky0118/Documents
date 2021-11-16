%% Advanced Dynamics HW.3(2)
% Programer: PO-HSUN WU
% Last edit date: 2021/11/02 17:30

%% Calculate the formula
clear;clc;close all
syms t real
l1 = 3;
l2 = 2;
omega = pi/2;

% Define the position vector
x = l1*cos(omega*t);
y = l2*sin(omega*t);
r = [x y];

% Define the velocity vector and the magnitude of the vector
v = diff(r,t);
mag_v = sqrt(v(1)^2 + v(2)^2);

% Define the acceleration vector and the magnitude of the vector
a = diff(v,t);
mag_a = sqrt(a(1)^ 2 +a(2)^2);

% Calculate the radius of the curvature
rho = (v(1)^2 + v(2)^2)^(3/2)/abs(v(1)*a(2)-a(1)*v(2));

%% Makeup the plot and table
% Setup time vector and some condition
tn = 0:0.01:4;
Output_time = [0 0.5 1 2 3];
scale = 2;
datas = {};
i = 1;

% Setup some figure configs
figure('Position',[280 480 650 500]);
hold on; daspect([1 1 1])
xlim([-5 5])
xticks(-5:5)
ylim([-5 5])
grid()

for t_ = tn
    % Substitute the condition values in to the equations
    xn = double(subs(x, t, t_));
    yn = double(subs(y, t, t_));
    vn = double(subs(v, t, t_));
    an = double(subs(a, t, t_));
    rhon = double(subs(rho, t, t_));
    
    % Plot the trajectory and the current point
    plot(xn,yn,'c.')                                                                                            % Draw the trajectory
    hm = plot(xn,yn,'r.');                                                                                      % Draw the current point
    tl = plot(xn,yn,'c');                                                                                       % Setup the trajectory line for the legend
    
    % If current time is in the configuration of the "Output_time" and will
    % plot the vectors.
    if ismember(t_,Output_time)
        % Calculate the unit vector of velocity and acceleration vector
        uvn = vn/norm(vn)*scale;
        uan = an/norm(an)*scale;
        
        % Plot the velocity vectory
        pause(0.3)
        vv = quiver(xn, yn, uvn(1), uvn(2), 'color', 'k', 'LineWidth', .8, 'MaxHeadSize', 0.5);
        
        % Plot the acceleration vectory
        pause(0.3)
        av = quiver(xn, yn, uan(1), uan(2), 'color', 'r', 'LineWidth', .8, 'MaxHeadSize', 0.5);
        
        % Save the datas
        datas{i} = {xn, yn, vn(1), vn(2), sqrt(vn(1)^2+vn(2)^2), an(1), an(2), sqrt(an(1)^2+an(2)^2), rhon};
        i = i+1;
    end
    drawnow
    delete(hm)                                                                                                  % Delete the current point
end
legend([tl, vv, av], 'Trajectory', 'Velocity', 'Acceleration')

% Setup the table
f = figure('Position',[280 250 650 150]);
dat = [datas{1}; datas{2}; datas{3}];
colnames = {'x', 'y', 'v_x', 'v_y', 'v', 'a_x', 'a_y', 'a', 'rho'};
rownames = {'t=0', 't_1=0.5', 't_2=1'};
uitable('Parent', f, 'Data', dat, 'ColumnName', colnames, 'RowName', rownames, 'Position', [20 20 674 100]);
