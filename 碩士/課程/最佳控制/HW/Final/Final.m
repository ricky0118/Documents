%% Optimal control final exam
% Programer: PO-HSUN WU
% Last edit date: 2022/06/20 22:30

%% #4(b)
clear;clc;close all
% System parameter
A = [-0.2640   0.7203   0      -9.8063
     -1.4406  -8.0534  10.5360  0
      0.7936 -10.4977 -20.2975  0
      0        1        0       0     ];
B = [ 0       2.8510
     -0.1392  0
     -2.4104  0
      0       0     ];
C = [0 0 1 0];
D = zeros(1,2);

% Constrain parameter
yd = 1;
psi = [0 0 1 0]';
Mf = diag([1 1 1 1]);

% Tune parameter
factor = 1;
Qd = 100.*factor;               % weight of tracking
Rd = diag([100 100]).*factor;   % weight of control
Qf = diag([1 1 1 1]).*factor;   % weight of terminal error

Q = C'*Qd*C;
N = C'*Qd*D;
R = Rd + D'*Qd*D;

% Terminal condition
x_tf = psi;
s_tf = Mf'*Qf*Mf;
s_tf = reshape(s_tf, [16,1]);
g_tf = -Mf'*Qd*psi;
state_tf = [x_tf; s_tf; g_tf];

LQT = @(t, state) NC(t, state, A, B, C, D, Q, R, N, Qd, yd);
[t, state] = ode45(LQT, [5 0], state_tf);

% Plot of result
figure()
plot(t, state(:,1))
xlabel("t"); ylabel("u")
grid on

figure()
plot(t, state(:,2))
xlabel("t"); ylabel("w")
grid on

figure()
plot(t, state(:,3))
xlabel("t"); ylabel("p")
grid on

figure()
plot(t, state(:,4))
xlabel("t"); ylabel("\theta")
grid on

%% function of necessary condition
function dstate = NC(t, state, A, B, C, D, Q, R, N, Qd, yd)
    % state define: [x(1:4), s(5:20), g(21:24)]'
    
    x = state(1:4);
    s = reshape(state(5:20), [4,4]);
    g = state(21:24);
    lambda = s*x + g;
    u = inv(R)*(-N'*x-B'*lambda);
    
    inv_R = inv(R);
    
    dx = A*x + B*u;
    ds = -s*(A-B*inv_R*N') - (A-B*inv_R*N')'* - Q + N*inv_R*N' + s*B*inv_R*B'*s;
    dg = (-(A-B*inv_R*N')' + s*B*inv_R*B')*g + C'*Qd*yd;
    
    dstate = zeros(24,1);
    dstate(1:4) = dx;
    dstate(5:20) = reshape(ds, [16,1]);
    dstate(21:24) = dg;

end
