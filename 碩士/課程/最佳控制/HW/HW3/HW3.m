%% Optimal control HW.3
% Programer: PO-HSUN WU
% Last edit date: 2022/03/18 21:00

%% #4
clear;clc;close all
% global V alpha gamma lambda

% Setup parameters
g = 9.81;               % gravity(m/s^2)
m = 95000;              % mass(kg)
S = 153;                % wing area(m^2)
rho = 0.7782;           % air density(kg/m^2)
epsilon = 3;            % angle between thrust and fuselage(deg)
T = 60000;              % thrust(N)
C_L0 = 0;               % (1)
C_D0 = 0.07351;         % (1)
C_La = 0.1;             % (1/deg)
C_Da = 0.05;            % (1/deg)

% Setup unknown variables
syms alpha              % angle of attack(deg)
syms gamma              % flight path angle(deg)
syms V                  % velocity(m/s)

% Calculate aerodynamic parameters
C_L = C_L0 + C_La*alpha;
C_D = C_D0 + C_Da*alpha;
L = 0.5*rho*(V*cosd(alpha))^2*S*C_L;
D = 0.5*rho*(V*cosd(alpha))^2*S*C_D;

% Calculate force vectors in body fix coordinate([et; en])
Thrust = T*[cosd(alpha+epsilon); sind(alpha+epsilon)];
Weight = m*g*[-sind(gamma); -cosd(gamma)];
Lift = L*[0; 1];
Drag = D*[-1; 0];
Acceleration = [0; 0];

% Create equation of motion(EOM) and rate of climb(RC)
EOM = Thrust + Weight + Lift + Drag - m*Acceleration;
RC = V*sind(gamma);

% Setup the minimize equation and Hamiltonian
syms lambda1 lambda2
L = -RC;
lambda = [lambda1; lambda2];
f = EOM;
H = L + lambda'*f;

% Setup the necessary condition and constrain equation
dH = [diff(H, V); diff(H, alpha); diff(H, gamma)];
sym_eqns = [dH; f];

% Setup the solver option
opt = optimoptions('fsolve', 'Display', 'none', 'OutputFcn', @outputfun, 'UseParallel', true);

% Setup the equation function and initial condition
fun_eqn = @(x) double(subs(sym_eqns, [V alpha gamma lambda1 lambda2], x));
x0 = [100 20 20 0 0];

% Using "fsolve" to figure out the nonlinear equations
sol = fsolve(fun_eqn, x0, opt);
max_RC = sol(1)*sind(sol(3))

%% Function to plot the iteration state
function stop = outputfun(x, optimValue, state)
    stop = false;
    iter_num = optimValue.iteration;
    
    switch state
        case 'init'
            name = ["Velocity", "Flight Path Angle", "Angle of Attack", "Rate of Climb"];
            for i = 1:3
                figure(i)
                plot(iter_num, x(i), '.-')
                xlabel('Iter times'); ylabel(name(i))
            end
            figure(4)
            plot(iter_num, x(1)*sind(x(3)), '.-')
            xlabel('Iter times'); ylabel(name(4))
            
        case 'iter'
            if (iter_num ~= 0)
                xdata = 0:iter_num;
                for i = 1:3
                    V_plot = figure(i).Children;
                    V_plot = V_plot.Children;
                    set(V_plot, 'XData', xdata, 'YData', [V_plot.YData x(i)])
                end
                V_plot = figure(4).Children;
                V_plot = V_plot.Children;
                set(V_plot, 'XData', xdata, 'YData', [V_plot.YData x(1)*sind(x(3))])
            end
            
        case 'done'
            for i = 1:4
                figure(i); grid on
            end
    end
end
