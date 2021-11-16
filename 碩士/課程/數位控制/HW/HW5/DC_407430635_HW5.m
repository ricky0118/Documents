%% Digital Control HW.5
% Programer: PO-HSUN WU
% Last edit date: 2021/11/02 21:00

%% Setup figure config
clear;clc;close all
global T
T = 1;
ws = 2*pi/T;

% Setup the s-plane figure
s_plane = figure('position',[735, 630, 560, 420]); hold on; grid on; daspect([1 2 1])
title('S-Plane'); axis([-10 5 -2*ws 2*ws])
xlabel("Re"); ylabel("Im")
xticks(-10:5)
yticks([-2*ws -3*ws/2 -ws -ws/2 0 ws/2 ws 3*ws/2 2*ws])
yticklabels({'-2\omega_s', '-1.5\omega_s', '-\omega_s', '-0.5\omega_s', '0', '0.5\omega_s', '\omega_s', '1.5\omega_s', '2\omega_s'})

% Setup the z-plane figure
z_plane = figure('position',[1300, 515, 560, 535]); hold on; grid on; daspect([1 1 1])
title('Z-Plane'); axis([-1.1 1.1 -1.1 1.1])
xlabel("Re"); ylabel("Im")

%% Constant real part
sigma = [-0.1 -1 -3 -5 -10];
s_imag = -2*ws:0.01:2*ws;
for i = sigma
    % Calculate the point in s-plane
    s_real = ones(1,length(s_imag))*i;
    % Transfer to z-domain
    [z_real, z_imag] = S2Z(s_real, s_imag);
    
    figure(s_plane)
    plot(s_real,s_imag, 'r', "linewidth", 1)
    figure(z_plane)
    plot(z_real,z_imag, 'r', 'linewidth', 1)
    pause(0.5)
end
pause(1)

%% Constant image part
% The vlaue of the image part in the z-plane is too small, that the final
% figure looks like a horizontal line.
freq = [-2*ws -3*ws/2 -ws -ws/2 0 ws/2 ws 3*ws/2 2*ws];
s_real = -10:0.01:0;
for i = freq
    % Calculate the point in s-plane
    s_imag = ones(1,length(s_real))*i;
    % Transfer to z-domain
    [z_real, z_imag] = S2Z(s_real, s_imag);
    
    figure(s_plane)
    plot(s_real,s_imag, 'b', "linewidth", 1)
    figure(z_plane)
    plot(z_real,z_imag, 'b', 'linewidth', 1)
    pause(0.5)
end
pause(1)

%% Constant damping ratio
damp = [0.3 0.5 0.7];
s_real = -10:0.01:0;
for i = damp
    slope = tan(acos(i));
    for scaler = [1 -1]
        % Calculate the point in s-plane
        s_imag = scaler*slope.*s_real;
        % Transfer to z-domain
        [z_real, z_imag] = S2Z(s_real, s_imag);

        figure(s_plane)
        plot(s_real,s_imag, 'g', "linewidth", 1)
        figure(z_plane)
        plot(z_real,z_imag, 'g', 'linewidth', 1)
        pause(0.5)
    end
end
pause(1)

%% Constant natural frequency
natural_freq = [ws/2 ws 3*ws/2 2*ws];
for i = natural_freq
    % Setup and calculate the point in s-plane
    s_imag = -i:0.01:i;
    s_real = -sqrt(i^2*ones(1,length(s_imag)) - s_imag.^2);
    % Transfer to z-domain
    [z_real, z_imag] = S2Z(s_real, s_imag);
    
    figure(s_plane)
    plot(s_real,s_imag, 'c', "linewidth", 1)
    figure(z_plane)
    plot(z_real,z_imag, 'c', 'linewidth', 1)
    pause(0.5)
end
pause(1)

%%
function [Real, Imag] = S2Z(real_, imag_)
    global T                        % Cell the global value T(or can setup from function input)
    s_ = real_ + imag_*1j;          % Setup the imaginary number
    z_ = exp(s_*T);                 % Transfer the point from s-plane to z-plane
    Real = real(z_);                % Figure out the real part of imaginary number
    Imag = imag(z_);                % Figure out the image part of imaginary number
end
