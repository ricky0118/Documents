%% Optimal control Midterm
% Programer: PO-HSUN WU
% Last edit date: 2022/04/25 22:00

%% #1(d)
clear;clc;close all
syms a b
f = [3*a^2-3*b^2+a+3; 6*a*b+b];
df = [diff(f(1), a), diff(f(1), b)
      diff(f(2), a), diff(f(2), b)];
  
x = [1; 1];
stop = false;
iter_no = 0;

while ~stop
    delta = -inv(double(subs(df, [a, b], x')))*double(subs(f, [a, b], x'));
    
    x = x + delta;
    iter_no = iter_no + 1;
    
    if iter_no >= 100
        stop = true;
    end
end
x

%% #2(b)
clear;clc;close all
syms V alpha gamma real
syms T mg lambda1 lambda2 real

ddiff = @(f, x, y) diff(diff(f, x), y);

syms rho S CL_0 CD_0 CL_alpha CD_alpha real
L = 0.5*rho*V^2*S*(CL_0+CL_alpha*alpha);
D = 0.5*rho*V^2*S*(CD_0+CD_alpha*alpha^2);

H = -V*sin(gamma) + lambda1*(T*cos(alpha)-D-mg*sin(gamma)) ...
    + lambda2*(T*sin(alpha)+L-mg*cos(gamma));
Hx = [diff(H, V) diff(H, alpha) diff(H, gamma)];
Hxx = [ddiff(H, V, V)     ddiff(H, V, alpha)     ddiff(H, V, gamma)
       ddiff(H, alpha, V) ddiff(H, alpha, alpha) ddiff(H, alpha, gamma)
       ddiff(H, gamma, V) ddiff(H, gamma, alpha) ddiff(H, gamma, gamma)];

%% #2(c)
clc;close all
mg_ = 95000*9.81;
S_ = 153;
rho_ = 0.7782;
CL_0_ = 0.3;
CD_0_ = 0.07351;
CL_alpha_ = 0.1;
CD_alpha_ = 0.01;
T_ = 200000;

Hx = subs(Hx, [mg S rho CL_0 CD_0 CL_alpha CD_alpha T], ...
              [mg_ S_ rho_ CL_0_ CD_0_ CL_alpha_ CD_alpha_ T_]);
Hxx = subs(Hxx, [mg S rho CL_0 CD_0 CL_alpha CD_alpha T], ...
                [mg_ S_ rho_ CL_0_ CD_0_ CL_alpha_ CD_alpha_ T_]);

eqn = @(x) double(subs(Hx, [V alpha gamma lambda1 lambda2], x));

opts = optimoptions(@fsolve,'Algorithm', 'levenberg-marquardt', 'Display', 'off');
x = fsolve(eqn, [100 10 20 1 0], opts)
