%% #4
clear;clc;close all
e = 0.1;
M = deg2rad(90);
E = 0;
error = 1;

while error > 1e-6
    E_ = E;
    
    f = E-e*sin(E)-M;
    df = 1-e*cos(E);
    E = E-f/df;
    
    error = abs((E-E_)/E);
end

E = rad2deg(E)

%% #7
clear;clc;close all
GM = 3.986e5;
r0 = 6378;
r1 = 12756;
V1 = sqrt(2)*sqrt(GM/r0)
Vc2 = [0 sqrt(GM/r1) 0];

r = [0 -r0 0]';
v = [V1 0 0]';
x = [r; v];

H = r0*V1;
tf = H^3/(4*GM^2)*(2*tan(pi/2/2)+2/3*tan(pi/2/2)^3);

opts = odeset('RelTol',1e-12,'AbsTol',1e-12);
[t, x] = ode45(@fun, [0 tf], x, opts);
V2 = x(end, 4:6);

gamma2 = rad2deg(acos(dot(V2, Vc2)/(norm(V2)*norm(Vc2))))

dV2 = Vc2 - V2;
alpha = rad2deg(pi-acos(dot(dV2, Vc2)/(norm(dV2)*norm(Vc2))))


hold on; daspect([1 1 1])
plot(r0*cos(0:0.01:2*pi), r0*sin(0:0.01:2*pi))
plot(r1*cos(0:0.01:2*pi), r1*sin(0:0.01:2*pi))
plot(x(:,1),x(:,2))
grid()

%% #9
clear;clc;close all
r_ijk = [-3670 -3870 4400]';
v_ijk = [4.7 -7.4 1]';
x = [r_ijk; v_ijk];

opts = odeset('RelTol',1e-12,'AbsTol',1e-12);
[t, x] = ode45(@fun, [0 4*24*60*60], x, opts);
r_end = x(end, 1:3)
v_end = x(end, 4:6)
plot3(x(:,1),x(:,2),x(:,3))
grid()

function dxdt = fun(t, x)
    GM = 3.986e5;
    r = x(1:3);
    v = x(4:6);
    mag_r = norm(r);
    
    dxdt = zeros(6,1);
    dxdt(1:3) = v;
    dxdt(4:6) = -GM/mag_r^3*r;
end