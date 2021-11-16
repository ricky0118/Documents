%% Digital Control HW.6
% Programer: PO-HSUN WU
% Last edit date: 2021/11/09 22:35

%%
clear;clc;close all
e = @(n) double(n==0);
datas = {[.9 0], [.9 pi()/4], [1 pi()/4], [1.1 0], [1.1 pi()/4]};
for data = datas
    r = data{1}(1);
    theta = data{1}(2);

    [n, u] = fun(r,theta,e);
    plotanswer(r, theta, n, u)
    pause(1)
end

% This function will calculate the time response from the input of radius
% and the theta angle.
function [n, u] = fun(r, theta, e)
    n = [];
    u = [];
    for i = 0:30
        n(i+1) = i;
        % The switch expression will handle the case when n is smaller than 0.
        switch i
            case 0
                u(i+1) = 0 + 0 + e(i) - r*cos(theta)*e(i-1);
            case 1
                u(i+1) = 2*r*cos(theta)*u(i) - 0 + e(i) - r*cos(theta)*e(i-1);
            otherwise
                u(i+1) = 2*r*cos(theta)*u(i) - r^2*u(i-1) + e(i) - r*cos(theta)*e(i-1);
        end
    end
end

% This function will plot the root locus and the time response.
function plotanswer(r, theta, n, u)
    figure('position', [200,200,1060,420])
    
    subplot(1,3,1); hold on
    plot(r.*cos([theta -theta]), r.*sin([theta -theta]), 'x', 'markersize', 10, 'linewidth', 2) % Plot the root locus
    plot(cos(0:0.01:2*pi()), sin(0:0.01:2*pi()), 'color', 'k', 'linewidth', .5)                 % Plot the unit circle
    xlim([-2 +2]); ylim([-2 +2])
    xlabel('Re'); ylabel('Im')
    daspect([1 1 1]); grid()

    subplot(1,3,[2 3])
    stem(n, u, 'o', 'linewidth', 1)                                                             % Plot the discrete time response
    xlabel('n'); ylabel('g(n)')
    grid()
end
