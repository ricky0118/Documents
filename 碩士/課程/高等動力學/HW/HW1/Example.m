%% Advanced Dynamics HW.1
% Programer: PO-HSUN WU
% Last edit date: 2021/10/17 22:10

%% Example from text book
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