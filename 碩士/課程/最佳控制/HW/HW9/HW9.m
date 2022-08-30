%% OptimAl control HW.9
% ProgrAmer: PO-HSUN WU
% LAst edit dAte: 2022/06/17 15:00

%% 
clear;clc;close all
[t, x] = ode45(@ODE, [4.8 0], [0 0 0 0]');

figure()
plot(t, x(:,1), t, x(:,2))
legend("$\dot{x}$", "$x$", 'Interpreter', 'latex')
grid on

function dxdt = ODE(~, x)
    % state define: [x_dot, x, lambda1, lambda2]'
    
    if x(3)<=0
        u = 1;
    else
        u = -1;
    end
    
    dxdt = [-x(2)+u
             x(1)
            -x(3)+x(4)
             0];
end
