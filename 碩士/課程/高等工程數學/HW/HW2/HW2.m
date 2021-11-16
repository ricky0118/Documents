%% Advanced engineering mathematics HW.2
% Programer: PO-HSUN WU
% Last edit date: 2021/11/04 

%% #1
clear;clc;close all
[x, y] = meshgrid(linspace(0,5,100),linspace(0,pi(),100));
len = size(x);
for i = 1:len(1)
    for j = 1:len(2)
        f = @(n) exp(-(2.*n-1).*x(i,j)).*sin((2.*n-1).*y(i,j))./(2.*n-1);
        T(i,j) = 4/pi()*limsum(f);
    end
end

f = @(n) 4/pi()*exp(-(2.*n-1).*1).*sin((2.*n-1).*(pi()/2))./(2.*n-1);
sum = 0;
n = 1;
while 1
    error = f(n);
    sum = sum + error;
    if abs(error) < 1e-6
        break
    end
    n = n+1;
end
fprintf("For T(1,pi/2): \n    Iteration times: %d \n    Value: %f \n    Error: %f\n\n", n, sum, error)

f = @(n) 4/pi()*exp(-(2.*n-1).*0.0369).*sin((2.*n-1).*(0.01*pi()))./(2.*n-1);
sum = 0;
n = 1;
while 1
    error = f(n);
    sum = sum + error;
    if abs(error) < 1e-6
        break
    end
    n = n+1;
end
fprintf("For T(0.0369,0.01pi): \n    Iteration times: %d \n    Value: %f \n    Error: %f\n\n", n, sum, error)

figure()
plot(x(1,:), T(1,:))
title("T(x,0)",'FontSize',15,'interpreter','latex')

figure()
plot(y(:,1), T(:,1))
title("T(0,y)",'FontSize',15,'interpreter','latex')

%% #2(a)
clear;clc;close all
syms x rho theta
x = (2*rho*sin(theta))/(1-rho^2);
eqn = 1/2*atan(x);

for n = 1:5
    fprintf("==================================================================")
    n
    simplify(diff(eqn,rho,n))
    subs(diff(eqn,rho,n),rho,0)/factorial(n)*rho^n;
    simplify(ans)
end

%% #2(b)
clear;clc;close all
syms x rho theta
x = (2*rho*sin(theta))/(1-rho^2);
eqn = 1/2*atan(x);

for n = 1:5
    fprintf("==================================================================")
    n
    simplify(diff(eqn,rho,n))
    subs(diff(eqn,rho,n),rho,0)/factorial(n)*rho^n;
    simplify(ans)
end

%% #3
clear;clc;close all
[x, y] = meshgrid(0:0.01:1,0:0.01:1);
len = size(x);
for i = 1:len(1)
    for j = 1:len(2)
        f = @(n) 2*exp(-n*pi().*y(i,j)).*sin(n*pi()/3).*sin(n*pi()*x(i,j));
        T(i,j) = limsum(f);
    end
end

figure()
surf(x,y,T, 'edgecolor', 'none')
title("$2\sum\limits^{\infty}_{n=1} e^{-n \pi y}\sin{\frac{n\pi}{3}}\sin{n \pi x}$ 3D Plot",'FontSize',15,'interpreter','latex')

figure()
plot(x(1,:), T(1,:))
% contour(x,y,T,'ShowText','on')
title("$2\sum\limits^{\infty}_{n=1} e^{-n \pi y}\sin{\frac{n\pi}{3}}\sin{n \pi x}$ 2D Plot",'FontSize',15,'interpreter','latex')

x = 0;
ended = 1;
step = 0.0001;
sum = 0;
while x<=ended
    f = @(n) 2*sin(n*pi()/3).*sin(n*pi()*x);
    sum = sum + limsum(f)*step;
    x = x+step;
end
fprintf("The answer of integral of T(x,0) from 0 to 1 is %.4f. \n", sum)

%% #4(b)
clear;clc;close all

f = @(n) (4/pi).*(1./(2.*n-1)).*exp(-(2.*n-1).*0.88).*sin((2.*n-1).*pi/2);
sum = 0;
n = 1;
while 1
    error = f(n);
    sum = sum + error;
    if abs(error) < 1e-6
        break
    end
    n = n+1;
end
fprintf("For T0=1, then T(0.88,pi/2): \n    Iteration times: %d \n    Value: %f \n    Error: %f\n\n", n, sum, error)

%% #4(c)
clear;clc;close all
T0 = 1;
x = 0.88;
y = pi()/2;
T = 2*T0/pi()*atan2(sin(y),sinh(x));
fprintf("T(0.88,pi/2) = %.4f\n", T)

%% function of #1
function sum = limsum(f)
    sum = 0;
    n = 1;
    for i = 1:10000
        error = f(n);
        sum = sum + error;
        n = n+1;
    end
end
