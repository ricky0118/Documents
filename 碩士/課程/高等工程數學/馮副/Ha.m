%%
clear;clc;close all
[ x , y ] = meshgrid( 0:0.01:1 , 0:0.01:1 );
T1=sinh(pi.*(1-x)).*sin(pi.*y);
figure(1)
mesh(x, y, T1)

syms xx
T_ = [.25 .5];
yy = 0.5;

figure(2)
hold on
contour(x, y, T1, [.25 .5], 'showtext', 'on', 'color', 'k', 'linewidth', 1.3)
xx_ = [];
n = 1
for TT = T_
    eqn = TT == sinh(pi.*(1-xx)).*sin(pi.*yy);
    xx_(length(xx_)+1) = vpasolve(eqn);
end
plot(xx_(1), yy, "rx", 'markersize', 15, 'linewidth', 1.3)
text(xx_(1)-0.2, yy+.05, sprintf('(%.2f,%.2f,%.2f)', xx_(1), yy, TT), 'color', 'r', 'fontsize', 15)
plot(xx_(2), yy, "bx", 'markersize', 15, 'linewidth', 1.3)
text(xx_(2)-0.2, yy-.05, sprintf('(%.2f,%.2f,%.2f)', xx_(2), yy, TT), 'color', 'b', 'fontsize', 15)

grid()

%%
clear;clc;close all
[ x , y ] = meshgrid( 0:0.01:1 , 0:0.01:1 );
T2=sinh(3*pi.*(1-x)).*sin(3*pi.*y);
figure(3)
mesh(x, y, T2)

syms xx
T_ = [.25 .5];
yy = 0.5;

figure(4)
hold on
contour(x, y, T2, [.25 .5], 'showtext', 'on', 'color', 'k', 'linewidth', 1.3)
xx_ = [];
n = 1
for TT = T_
    eqn = TT == sinh(3*pi.*(1-xx)).*sin(3*pi.*yy);
    xx_(length(xx_)+1) = vpasolve(eqn)
end
plot(xx_(1), yy, "rx", 'markersize', 15, 'linewidth', 1.3)
text(xx_(1)-0.2, yy+.05, sprintf('(%.2f,%.2f,%.2f)', xx_(1), yy, TT), 'color', 'r', 'fontsize', 15)
plot(xx_(2), yy, "bx", 'markersize', 15, 'linewidth', 1.3)
text(xx_(2)-0.2, yy-.05, sprintf('(%.2f,%.2f,%.2f)', xx_(2), yy, TT), 'color', 'b', 'fontsize', 15)

grid()

%%
clear;clc;close all
[ x , y ] = meshgrid( 0:0.01:1 , 0:0.01:1 );
T3=exp(-pi.*x).*sin(pi.*y);
figure(5)
mesh(x, y, T3)

syms xx
T_ = [.25 .5];
yy = 0.5;

figure(6)
hold on
contour(x, y, T3, [.25 .5], 'showtext', 'on', 'color', 'k', 'linewidth', 1.3)
xx_ = [];
n = 1
for TT = T_
    eqn = TT == exp(-pi.*xx).*sin(pi.*yy);
    xx_(length(xx_)+1) = vpasolve(eqn)
end
plot(xx_(1), yy, "rx", 'markersize', 15, 'linewidth', 1.3)
text(xx_(1)-0.2, yy+.05, sprintf('(%.2f,%.2f,%.2f)', xx_(1), yy, TT), 'color', 'r', 'fontsize', 15)
plot(xx_(2), yy, "bx", 'markersize', 15, 'linewidth', 1.3)
text(xx_(2)-0.2, yy-.05, sprintf('(%.2f,%.2f,%.2f)', xx_(2), yy, TT), 'color', 'b', 'fontsize', 15)

grid()

%%
clear;clc;close all
[ x , y ] = meshgrid( 0:0.01:1 , 0:0.01:1 );
T4=exp(-3*pi.*x).*sin(3*pi.*y);
figure(7)
mesh(x, y, T4)

syms xx
T_ = [.25 .5];
yy = 0.5;

figure(8)
hold on
contour(x, y, T4, [.25 .5], 'showtext', 'on', 'color', 'k', 'linewidth', 1.3)
xx_ = [];
n = 1;
for TT = T_
    eqn = TT == exp(-3*pi.*xx).*sin(3*pi.*yy);
    answer = vpasolve(eqn)
    if ~isempty(answer)
        xx_(length(xx_)+1) = vpasolve(eqn)
    end
end
for i = 1:length(xx_)
    plot(xx_(i), yy, "rx", 'markersize', 15, 'linewidth', 1.3)
    text(xx_(i)-0.2, yy+.05, sprintf('(%.2f,%.2f,%.2f)', xx_(i), yy, TT), 'color', 'r', 'fontsize', 15)
end

grid()

%%
% clear;clc;close all
[ x , y ] = meshgrid( 0:0.01:1 , 0:0.01:1 );
Z5 = 0;
for n = 1:1:100;
  Z5 = Z5 + 1/(2.*n-1)*(sinh(pi*(2.*n-1).*(1-x)).*sin(pi*(2.*n-1).*y)./sinh(pi*(2.*n-1)));
end
T5=4*Z5/pi;
figure(9)
mesh(x, y, T5)

syms xx
T_ = [.25 .5];
yy = 0.5;

figure(10)
hold on
contour(x, y, T5, [.25 .5], 'showtext', 'on', 'color', 'k', 'linewidth', 1.3)

grid()