%% OptimAl control HW.7
% ProgrAmer: PO-HSUN WU
% LAst edit dAte: 2022/05/25 15:00

%%
clear;clc;close all
global R omega T m 
R = 300;
omega = sqrt(3.986e5/R^3);
T = 100;
m = 500;

tf = 40;
u = @(t) deg2rad(1);
opts = odeset('RelTol',1e-15,'AbsTol',1e-15);
[t, x] = ode45(@(t, state) EOM(t, state, u), [0 tf], [0; 0; 0; 0], opts)
polarplot(rad2deg(x(:,4)), x(:,2))


%% #3
clear;clc;close all
global R omega T m
GM = 3.986e5;
R = 300;
omega = sqrt(3.986e5/R^3);
T = 100;
m = 500;

init_A = [0 50];

[A, Jmin] = fmincon(@fminfunc, init_A, [], [], [], [], [], []);

function J = fminfunc(A)
%     global xf
    tf = A(end)
    
    u = @(t) atan(A(1));
    opts = odeset('RelTol',1e-15,'AbsTol',1e-15);
    [~, x] = ode45(@(t, state) EOM(t, state, u), [0 tf], [0; 0; 0; 0], opts);
    J = tf + (x(end)-600)^2;
%     xf = x(end)

end

function [c, ceq] = constrain(A)
    global xf
    
    c = -A(end);
    ceq = xf - 600;
    
end

function dstate = EOM(t, state)
    % state: [r_dot; r; theta_dot; theta]
    global R omega T m
    delta = u(t);
     
    dstate = zeros(4,1);
    dstate(1) = 3*omega^2*state(2) + 2*R*omega*state(3) + T/m*sin(delta);
    dstate(2) = state(1)+state(4)*omega;
    dstate(3) = -2*omega/R*state(1) + T/(m*R)*cos(delta);
    dstate(4) = state(2)*state(3);

end
