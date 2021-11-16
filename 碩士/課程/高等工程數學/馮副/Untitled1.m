
%% #5(b)
clear;clc;close all
[x, y] = meshgrid(0:0.05:3,0:0.05:pi());
T = 2./pi().*atan2(sin(y),sinh(x));

yy_ = pi()/2;
xx_ = [];
TT_ = [0.25 0.5]
for T_ = TT_
    syms x_
    eqn = T_ == 2./pi().*atan2(sin(yy_),sinh(x_));
    xx_(length(xx_)+1) = vpasolve(eqn);
end

figure()
surf(x,y,T)

% xticks(0:0.5:3)
% ylim([0 pi()])
% yticks([0 pi()/4 pi()/2 3*pi()/4 pi()])
% yticklabels({'0' '\pi/4' '\pi/2' '3\pi/4' '\pi'})
% title("$\frac{2}{\pi}\tan^{-1}{(\frac{\sin{y}}{\sinh{x}})}$ 3D Plot",'FontSize',15,'interpreter','latex')

figure()
hold on
contour(x,y,T,[0.25 0.5],'ShowText','on','color','k','LineWidth',1)
plot(xx_, yy_, "x", 'LineWidth', 1.5, 'color', 'r', 'MarkerSize', 15)
text(xx_(1)-0.2, yy_+0.2, sprintf('(%.2f,%.2f,%.2f)', xx_(1), yy_, TT_(1)), 'color', 'b', 'fontsize',15)
text(xx_(2)-0.6, yy_+0.2, sprintf('(%.2f,%.2f,%.2f)', xx_(2), yy_, TT_(2)), 'color', 'b', 'fontsize',15)

grid()
xticks(0:0.2:3)
ylim([0 pi()])
yticks([0 pi()/4 pi()/2 3*pi()/4 pi()])
yticklabels({'0' '\pi/4' '\pi/2' '3\pi/4' '\pi'})
% title("Plot by Ricky Wu")

