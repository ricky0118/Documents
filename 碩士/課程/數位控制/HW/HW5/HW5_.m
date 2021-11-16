%% 
% From the 3D field plot, we can know the radius(or both image and real
% part) will approach to 0, when the real part in s domain is smaller than
% about -5.
% The real part will only control the radius in z domain, and the image
% part will only control the phase angle in z domain.
clear;clc;close all
T = 1;
ws = 2*pi/T;
[x, y] = meshgrid(-10:0.01:0, -2*ws:0.01:2*ws);

s = x+y*1j;
z = exp(s*T);
x_ = real(z);
y_ = imag(z);
r = sqrt(real(z).^2 + imag(z).^2);
theta = atan2(y_,x_);

% ========== Field plot of real & image part in s-plane to real & image in z-plane ==========
figure()
surf(x,y,x_, 'edgecolor', 'none')
colorbar
title("Real part")
xlabel("Real(in s-plane)"); ylabel("Image(in s-plane)"); zlabel("Real(in z-plane)")

figure()
surf(x,y,y_, 'edgecolor', 'none')
colorbar
title("Image part")
xlabel("Real(in s-plane)"); ylabel("Image(in s-plane)"); zlabel("Image(in z-plane)")

% ========== Field plot of real & image part in s-plane to radius & phase angle in z-plane ==========
figure()
surf(x,y,r, 'edgecolor', 'none')
colorbar
xlabel("Real(in s-plane)"); ylabel("Image(in s-plane)"); zlabel("Radius(in z-plane)")

figure()
surf(x,y,theta, 'edgecolor', 'none')
colorbar
xlabel("Real(in s-plane)"); ylabel("Image(in s-plane)"); zlabel("Phase angle(in z-plane)")
yticks([-2*ws -3*ws/2 -ws -ws/2 0 ws/2 ws 3*ws/2 2*ws])
yticklabels({'-2\omega_s', '-1.5\omega_s', '-\omega_s', '-0.5\omega_s', '0', '0.5\omega_s', '\omega_s', '1.5\omega_s', '2\omega_s'})
