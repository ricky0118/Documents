%% Advanced Dynamics HW.5
% Programer: PO-HSUN WU
% Last edit date: 2021/11/13 14:55

%% Calculate the formula
clear;clc;close all
syms r(t) t omega R m
vr = diff(r,t);
ar = diff(vr,t);
ac = r*omega^2;                             % acceleration from the rotation tube in the r direction.

% Solve the trajectory.
eqn = m*ar == m*ac;                         % ma = F
conditions = [r(0)==R, vr(0)==0];
r = simplify(dsolve(eqn, conditions));
vr = simplify(diff(r,t));

% Solve the time of the particle leaves the tube.
eqn = r == 2*R;
tf = solve(eqn,t);

%% Substitute the conditions to the equations.
Rn = 5;
omegan = pi();
tn = linspace(0,max(double(subs(tf,omega,omegan))),1000);
rn = double(subs(r, {t, omega, R}, {tn, omegan, Rn}));
vrn = double(subs(vr, {t, omega, R}, {tn, omegan, Rn}));
v_theta_n = double(0 + rn*omegan);

%% Plot the figure
scale = 0.1;
% Find the x-y component of position and velocity vectors
% position
xn = rn.*cos(omegan*tn);                            
yn = rn.*sin(omegan*tn);

% velocity in er direction 
vr_x_n = vrn.*cos(omegan*tn);
vr_y_n = vrn.*sin(omegan*tn);

% velocity in e_theta direction
v_theta_x_n = v_theta_n.*cos(omegan*tn+pi()/2);     
v_theta_y_n = v_theta_n.*sin(omegan*tn+pi()/2);

% velocity vector
vxn = vr_x_n + v_theta_x_n;                         
vyn = vr_y_n + v_theta_y_n;

% Find vector angle
angle_vr = atan2(vr_y_n, vr_x_n);
angle_v = atan2(vyn, vxn);
angle_v_vr = angle_v-angle_vr;

figure()
for i = linspace(1, length(rn), 100)
    i = int16(i);
    clf
    hold on; grid on; daspect([1 1 1])
    
    objTrajectory = plot(xn(1:i), yn(1:i), 'Color', 'b', 'LineWidth', 1.5);
    plot([0 xn(i)], [0 yn(i)], 'k--');
    objVr = quiver(xn(i), yn(i), vr_x_n(i)*scale, vr_y_n(i)*scale, 'LineWidth', 1, 'MaxHeadSize', 0.5);
    objVtheta = quiver(xn(i), yn(i), v_theta_x_n(i)*scale, v_theta_y_n(i)*scale, 'LineWidth', 1, 'MaxHeadSize', 0.5);
    objV = quiver(xn(i), yn(i), vxn(i)*scale, vyn(i)*scale, 'LineWidth', 1, 'MaxHeadSize', 0.5);
    objCurrent = plot(xn(i), yn(i), 'r.', 'MarkerSize', 10);
    
    % Draw the angle
    theta = linspace(0,angle_vr(i),100);
    plot(2*cos(theta), 2*sin(theta), 'Color', 'k', 'LineWidth', .8)
    text(2.5*cos(angle_vr(i)/2),...
         2.5*sin(angle_vr(i)/2),...
         sprintf('%.2f^\x00B0',rad2deg(angle_vr(i))),...
         'HorizontalAlignment', 'center', 'rotation', -90+rad2deg(angle_vr(i)/2))
    theta = linspace(angle_vr(i), angle_v(i),100);
    plot(xn(i)+(vrn(i)*scale/2)*cos(theta), yn(i)+(vrn(i)*scale/2)*sin(theta), 'Color', 'k', 'LineWidth', .8)
    text(xn(i) + (vrn(i)*scale/2+0.5)*cos(angle_v(i)-angle_v_vr(i)/2),...       % position of current point + shift of the position
         yn(i) + (vrn(i)*scale/2+0.5)*sin(angle_v(i)-angle_v_vr(i)/2),...
         sprintf('%.2f^\x00B0',rad2deg(angle_v_vr(i))),...                      % 00B0 is the unicode of degree symbol
         'HorizontalAlignment', 'center', 'rotation', -90+rad2deg(angle_v(i)-angle_v_vr(i)/2))
    
    title('Trajectory of the partical')
    legend([objTrajectory, objV, objVr, objVtheta, objCurrent], 'Trajectory', 'V', 'V_r', 'V_{\theta}', 'Current point')
    xlim([-1 2*Rn+5]); ylim([-1 2*Rn+5])
    xticks(-1:1:2*Rn+5); yticks(-1:1:2*Rn+5)
    
    drawnow
end

%%
