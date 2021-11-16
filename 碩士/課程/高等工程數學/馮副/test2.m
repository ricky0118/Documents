%% #1__
clear;clc;close all
n = 1;

L = 10;
H = 1;
y = 0.5;
x = 0:0.01:L;
T = zeros(1,1001);
T_ = [];


for j = 1:length(x)
    T_(n) = inffun(x(j), y, H, 1);
    n = n+1;
end

n = 1;
for L = .1:0.1:2
%     x = linspace(0,L,1000);

    for j = 1:L/0.01+1
        T(n,j) = rangefun(x(j), y, L, H, 1);
%         T(n,j) = inffun(x(j), y, L, H, 1);
    end
    
    hold on
    plot(x,abs(T(n,:)-T_)./T_)

    n = n+1;
end

% plot(x,T)
% title('$T(x,0.5) = \frac{4}{\pi} \sum\limits^{\infty}_{n=1,3,5,...} \frac{1}{n} \frac{\sinh{\frac{n\pi}{H}(L-x)}}{\sinh{\frac{n\pi}{H}L}}\sin{\frac{n\pi}{H}y}$','FontSize',13,'interpreter','latex')
legend()
grid()

%%
clear;clc;close all
T = [];
n = 1;
for L = 0.1:0.1:10
    T(n,1) = L;
    T(n,2) = rangefun(0.25, 0.5, L, 1, 0);
    T(n,3) = rangefun(0.5, 0.5, L, 1, 0);
    T(n,4) = rangefun(L/2, 0.5, L, 1, 0);
    n = n+1;
end

%%
clear;clc;close all
T = [];
n = 1;
for x = 0.1:0.1:10
    T(n,1) = x;
    T(n,2) = inffun(x, 0.5, 1, 0);
    n = n+1;
end

%%
inffun(0.25, 0.5, 1, 0)

%% function of range
function T = rangefun(x, y, L, H, output)
    f = @(n) (1/(2*n-1))*sinh((2*n-1)*pi/H*(L-x))*sin((2*n-1)*pi()*y/H)/sinh((2*n-1)*pi()*L/H);
    T = 4/pi()*limsum(f,output);
end

%% function of infinity
function T = inffun(x, y, H, output)
    f = @(n) (1/(2*n-1))*exp(-(2*n-1)*pi()*x/H)*sin((2*n-1)*pi()*y/H);
    T = 4/pi()*limsum(f,output);
end

%% function of limsum
function sum = limsum(f,output)
    sum = 0;
    n = 1;
    while 1
        error = f(n);
        sum = sum + error;
        if abs(error) < 1e-6 && n > 0 || isnan(sum)
            break
        end
        n = n+1;
    end
    if output == 1
        fprintf("Iteration times: %d \nValue: %f \nError: %f\n\n", n, sum, abs(error))
    end
end
