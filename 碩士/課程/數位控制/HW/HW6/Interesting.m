%% Digital Control HW.6
% Programer: PO-HSUN WU
% Last edit date: 2021/11/09 22:15
% Reference: https://www.mathworks.com/matlabcentral/answers/390704-how-can-i-drag-points-vertically-in-a-plot

%%
clear;clc;close all
r = .9;
theta = pi()/4;

[n, u] = fun(r,theta);

figure('position', [200,200,1060,420])
subplot(1,3,1)
hold on
PoleLocation = plot(r.*cos([theta -theta]), r.*sin([theta -theta]), 'x', 'markersize', 10, 'linewidth', 2, 'buttondownfcn', {@Mouse_Callback,'down'});
plot(cos(0:0.01:2*pi()), sin(0:0.01:2*pi()), 'color', 'k', 'linewidth', .5)
xlim([-1.5 1.5]); ylim([-1.5 1.5])
xlabel('Real part'); ylabel('Imaginary part')
daspect([1 1 1]); grid()

subplot(1,3,[2 3])
TimeResponse = stem(n, u, 'o', 'linewidth', 1);
xlabel('n'); ylabel('g(n)')
% ylim([-1 1])
grid()

function Mouse_Callback(mouse,~,action)
    persistent curobj xdata ydata index
    pos = get(gca,'currentpoint');
    switch action
        case 'down'
            curobj = mouse;
            xdata = mouse.XData;
            ydata = mouse.YData;
            [~,index] = min((xdata-pos(1)).^2+(ydata-pos(3)).^2);
            set(gcf, 'WindowButtonMotionFcn', {@Mouse_Callback,'move'}, 'WindowButtonUpFcn', {@Mouse_Callback,'up'});
            
        case 'move'            
            xdata(index) = pos(1);
            ydata(index) = pos(3);
            switch index
                case 1
                    xdata(2) = pos(1);
                    ydata(2) = -pos(3);
                case 2
                    xdata(1) = pos(1);
                    ydata(1) = -pos(3);
            end   
            set(curobj, 'XData', xdata, 'YData', ydata)
            r = sqrt(xdata(1)^2+ydata(1)^2);
            theta = atan2(ydata(1), xdata(1));
            [n, u] = fun(r,theta);
            tamp = get(gcf, 'Children');
            TimeResponse = get(tamp(1),'Children');
            set(TimeResponse, 'XData', n, 'YData', u);
            if r > 1
                set(tamp(1), 'YLimMode', 'auto')
            else
                set(tamp(1), 'YLim', [-1 1])
            end
            
        case 'up'
            set(gcf, 'WindowButtonMotionFcn', '', 'WindowButtonUpFcn', '');
    end

end

function [n, u] = fun(r, theta)
    n = [];
    u = []; 
    e = @(n) double(n==0);
    for i = 0:30
        n(i+1) = i;
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
