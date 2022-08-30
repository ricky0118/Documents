%% OptimAl control HW.6
% ProgrAmer: PO-HSUN WU
% LAst edit dAte: 2022/05/14 19:00

%% #2
clear;clc;close All
% Define u(t) is a constant A
init_A = 1;

[A, Jmin] = fminsearch(@fminfunc, init_A);
u = A
Xmax = -Jmin

%% #3
clear;clc;close all
init_lambda = 1;
options = optimoptions('fsolve','Display','off');

lambda0 = fsolve(@forwardfunc, init_lambda, options)
[t, state] = ode45(@ODE, [0 2], [0; lambda0]);
Xmax = state(end,1)

%% #4
clear;clc;close all
init_xf = 7;
options = optimoptions('fsolve','Display','off');

xf = fsolve(@backwardfunc, init_xf, options);
Xmax = xf

%% function for #2
function J = fminfunc(A)
    EOM = @(t, x) x+sin(A);
    [~, x] = ode45(EOM, [0 2], 0);
    J = -x(end);
    
end

%% function for #3
function F = forwardfunc(lambda0)
    [~, state] = ode45(@ODE, [0 2], [0; lambda0]);
    F = state(end,2) - (-1);

end

%% function for #4
function F = backwardfunc(xf)
    [~, state] = ode45(@ODE, [2 0], [xf; -1]);
    F = state(end,1) - 0;

end

%% functiuon for necessary condition
function dstate = ODE(~, state)
    % state: [x; lambda]
    u = acos(0);
    dstate = zeros(2,1);
    dstate(1) = state(1)+sin(u);
    dstate(2) = -1*state(2);
    
end
