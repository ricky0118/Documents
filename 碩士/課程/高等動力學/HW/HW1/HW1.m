%% Advanced Dynamics HW.1
% Programer: PO-HSUN WU
% Last edit date: 2021/10/20 13:18

%% Define some value
clear;clc;close all
syms R t omega OMEGA alpha beta real

alpha = omega*t;                                                            % position angle of link 1 with respect to the fix frame(Inertial frame)
beta = OMEGA*t;                                                             % position angle of link 2 with respect to the relative frame of link 1

%% Transformation matrices between different frame
F2R = [ cos(alpha)  sin(alpha)  0                                           % from fix frame to rotation frame respect to link 1
       -sin(alpha)  cos(alpha)  0
           0           0        1];
R2F = inv(F2R);                                                             % from rotation frame respect to link 1 to fix frame

%% Position vector of the particle
r_R = [R*cos(beta) 0 R*sin(beta)]';                                         % in the rotating frame
r_I = simplify(R2F*r_R);                                                    % in the fix frame

%% Velocity vector of the particle
v_I = diff(r_I,t);                                                          % in the fix frame
v_R = simplify(F2R*v_I);                                                    % in the rotating frame

fprintf('v_x1 = %s \n',char(v_R(1)))
fprintf('v_y1 = %s \n',char(v_R(2)))
fprintf('v_z1 = %s \n',char(v_R(3)))
fprintf('\n')

%% Acceleration vector of the particle
a_I = diff(v_I,t);                                                          % in the fix frame
a_R = simplify(F2R*a_I);                                                    % in the rotating frame

fprintf('a_x1 = %s \n',char(a_R(1)))
fprintf('a_y1 = %s \n',char(a_R(2)))
fprintf('a_z1 = %s \n',char(a_R(3)))
fprintf('\n')


%% Example from text book
fprintf('=======================Example from text book=======================')
fprintf('\n')

% clear all; clc; close all
syms R t omega Omega alpha beta real

alpha=omega*t;
beta=Omega*t;

i1=[cos(alpha) sin(alpha) 0];
j1=[-sin(alpha) cos(alpha) 0];
k1=[0 0 1];

r=R*cos(beta)*i1+R*sin(beta)*k1;

r_x = r(1);
r_y = r(2);
r_z = r(3);

v = diff(r,t);
v_x = v(1);
v_y = v(2);
v_z = v(3);

a = diff(v,t);
a_x = simplify(a(1));
a_y = simplify(a(2));
a_z = simplify(a(3));

v_x1=simplify(i1*v');
v_y1=simplify(j1*v');
v_z1=simplify(k1*v');
fprintf('v_x1 = %s \n',char(v_x1))
fprintf('v_y1 = %s \n',char(v_y1))
fprintf('v_z1 = %s \n',char(v_z1))
fprintf('\n')

a_x1=simplify(i1*a');
a_y1=simplify(j1*a');
a_z1=simplify(k1*a');
fprintf('a_x1 = %s \n',char(a_x1))
fprintf('a_y1 = %s \n',char(a_y1))
fprintf('a_z1 = %s \n',char(a_z1))
fprintf('\n')