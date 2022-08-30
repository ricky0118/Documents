%% OptimAl control HW.7
% ProgrAmer: PO-HSUN WU
% LAst edit dAte: 2022/05/25 15:00

%% 
clear;clc;close all
global R omega T m GM r1 r2
GM = 3.986e5;
R = 300;
omega = sqrt(GM/R^3);
T = 100;
m = 500;

r1 = 300;
r2 = 600;

tf = 30;
opts = optimoptions('fsolve', 'Display', 'iter', 'Algorithm', 'Levenberg-Marquardt');
[x, fval] = fsolve(@(lambda_f) backwardfunc(tf, lambda_f), [18; 0; 0], opts)

%% #3
function F = backwardfunc(tf, lambda_f)
    global GM r1 r2
    x0 = [0; r1; sqrt(GM/r1)];
    xf = [0; r2; sqrt(GM/r2)] - x0;
    
    opts = odeset('RelTol',1e-15,'AbsTol',1e-15);
    [~, state] = ode45(@NC, [tf 0], [xf; lambda_f], opts);
    F = state(end, 1:3)' - x0;

end

function dstate = NC(~, state)
    % state: [r_dot; r; theta_dot; lambda1; lambda2; lambda3]
    global R omega T m
    delta = atan2(state(4)*R, state(6));
    
    dstate = zeros(6,1);
    dstate(1) = 3*omega^2*state(2) + 2*R*omega*state(3) + T/m*sin(delta);
    dstate(2) = state(1);
    dstate(3) = -2*omega/R*state(1) + T/(m*R)*cos(delta);
    
    dstate(4) = -state(5) + state(6)*2*omega/R;
    dstate(5) = state(4)*3*omega^2;
    dstate(6) = -state(4)*2*R*omega;
    
end

% function J = Jacobian(y, x)
%     y_size = size(y);
%     x_size = size(x);
%     J = sym("J", [y_size(1) x_size(1)]);
%     for i = 1:y_size(1)
%         for j = 1:x_size(1)
%             J(i,j) = diff(y(i), x(j));
%         end
%     end
%     
% end
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
