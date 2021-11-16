%% #1
clear;clc;close all
L = 1;
H = 1;
step = 0.01;
[x,y] = meshgrid(0:step:L, 0:step:H);
sizes = size(x);

for i = 1:sizes(1)
    for j = 1:sizes(2)
%         f = @(n) (1/(2*n-1))*sinh((2*n-1)*pi/H*(L-x(i,j)))*sin((2*n-1)*pi()*y(i,j)/H)/sinh((2*n-1)*pi()*L/H);
        f = @(n) (1/(2*n-1))*exp(-(2*n-1)*pi()*x(i,j)/H)*sin((2*n-1)*pi()*y(i,j)/H);
        T(i,j) = 4/pi()*limsum(f,1);
    end
end
figure()
surf(x,y,T, 'edgecolor', 'none')

%% #1__
clear;clc;%close all
% figure()
for i = 1
L = i
H = 1;
step = 0.01;
[x,y] = meshgrid(0:step:L, 0.5);
sizes = size(x);

    for j = 1:sizes(2)
        f = @(n) (1/(2*n-1))*sinh((2*n-1)*pi/H*(L-x(j)))*sin((2*n-1)*pi()*y(j)/H)/sinh((2*n-1)*pi()*L/H);
        f = @(n) (1/(2*n-1))*exp(-(2*n-1)*pi()*x(j)/H)*sin((2*n-1)*pi()*y(j)/H);
        T(j) = 4/pi()*limsum(f,1);
    end
% T(501)

hold on
plot(x,T)
drawnow
pause(1)
end
title('$T(x,0.5) = \frac{4}{\pi} \sum\limits^{\infty}_{n=1,3,5,...} \frac{1}{n} \frac{\sinh{\frac{n\pi}{H}(L-x)}}{\sinh{\frac{n\pi}{H}L}}\sin{\frac{n\pi}{H}y}$','FontSize',13,'interpreter','latex')
legend()
grid()

%% #1__
clear;clc;close all
figure()
% for i = 1:10
L = 5;
H = 1;
step = 0.001;
[x,y] = meshgrid(0:step:L, 0.5);
sizes = size(x);

    for j = 1:sizes(2)
%         f = @(n) (1/(2*n-1))*sinh((2*n-1)*pi/H*(L-x(j)))*sin((2*n-1)*pi()*y(j)/H)/sinh((2*n-1)*pi()*L/H);
        f = @(n) (1/(2*n-1))*exp(-(2*n-1)*pi()*x(j)/H)*sin((2*n-1)*pi()*y(j)/H);
        T(j) = 4/pi()*limsum(f,1);
    end

% hold on
plot(x,T)
% drawnow
% end
title('$T(x,0.5) = \frac{4}{\pi} \sum\limits^{\infty}_{n=1,3,5,...} \frac{1}{n} e^{-\frac{n\pi}{L}x}\sin{\frac{n\pi}{2H}}$','FontSize',15,'interpreter','latex')
% legend()
grid()

%%
clc;close all
T_ = [.25 .5];
xx = {};
xx_ = {};
yy = {};
n = 1;
for TT = T_
    error = abs(T-TT);
    error = error < 0.001;
    [y_, x_] = find(error);
    [y_, I] = sort(y_);
    x_ = x_(I);
    xx{n} = x_*step;
    yy{n} = y_*step;
    
    yy_ = T(.5/step+1,:);
    find(abs(yy_-TT) < 0.001)
    xx_{n} = find(abs(yy_-TT) < 0.001)*step;
    n = n+1;
end

%%
clc;close all
figure()
hold on
% contour(x,y,T,[.25 .5], 'ShowText', 'on', 'Color', 'k', 'LineWidth', 1.3)
for i = 1:length(xx)
    plot(xx{i}, yy{i}, 'color', 'k', 'linewidth', 1.3)
    line = plot(xx_{i}(1), 0.5, 'x', 'markersize', 15, 'linewidth', 1.5);
    text(xx_{i}(1)-0.2, 0.5+0.1*(-1)^i, sprintf("(%.4f,%.2f,%.2f)", xx_{i}(1), 0.5, T_(i)), 'fontsize', 15, 'color', line.Color)
end
title(sprintf('L=%.0f, H=%.0f', L, H), 'fontsize', 15)
grid(); daspect([1 1 1])
xticks(0:0.1:2); xlim([0 2])

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
