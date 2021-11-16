%% #2
clear;clc;close all
r_ijk = [8228 389 6888];
v_ijk = [-0.7 6.6 -0.6];
[a, ecc, i, Omega, omega, theta] = ijk2keplerian(r_ijk, v_ijk)

%% #3
clear;clc;close all
r_ijk = [8228 389 6888]';
v_ijk = [-0.7 6.6 -0.6]';
x = [r_ijk; v_ijk];

[t, x] = ode45(@fun, [0 2*60*60], x);
plot3(x(:,1),x(:,2),x(:,3))
grid()

function [a, ecc, i, Omega, omega, theta] = ijk2keplerian(r, v)
    GM = 3.986e5;
    ui = [1 0 0];
    uk = [0 0 1];
    
    mag_r = norm(r);
    mag_v = norm(v);
    
    Ener = mag_v^2/2 - GM/mag_r;
    a = -GM/(2*Ener);
    
    h = cross(r,v)/norm(cross(r,v));
    i = acos(dot(h,uk));
    
    ecc = -(cross(cross(r,v),v)/GM + r/mag_r);
    mag_ecc = norm(ecc);
    
    N = cross(uk,h);
    mag_N = norm(N);
    
    cos_Omega = dot(ui,N)/mag_N;
    sin_Omega = cross(ui,N)/mag_N;
    
    Omega = atan2(sin_Omega(3), cos_Omega);
    if Omega<0
        Omega = Omega+2*pi();
    end    
    
    cos_omega = dot(N,ecc)/(mag_N*mag_ecc);
    sin_omega = dot(cross(N,ecc)/(mag_N*mag_ecc), h);
    omega = atan2(sin_omega, cos_omega);
    if omega<0
        omega = omega+2*pi();
    end
    
    cos_theta = dot(ecc,r)/(mag_ecc*mag_r);
    sin_theta = dot(cross(ecc,r)/(mag_ecc*mag_r), h);
    theta = atan2(sin_theta,cos_theta);
    if theta<0
        theta = theta+2*pi();
    end

    E = 2*atan(sqrt((1-mag_ecc)/(1+mag_ecc))*tan(theta/2));
    M = E-mag_ecc*sin(E);
%     sqrt(a^3/GM)*M

end

function dxdt = fun(t, x)
    GM = 3.986e5;
    mag_r = norm(x);
%     A = [   0   1
%         -GM/r^3 0];
    r = x(1:3);
    v = x(4:6);
    
    dxdt = zeros(6,1);
    dxdt(1:3) = v;
    dxdt(4:6) = -GM/mag_r^3*r;
end