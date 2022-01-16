%% #2(a)
clear;clc;close all
[x, y] = meshgrid(0:0.01:1,0:0.01:1);
len = size(x);
phi_12 = sin(1*pi*x).*sin(2*pi*y);
phi_21 = sin(2*pi*x).*sin(1*pi*y);
phi_13 = sin(1*pi*x).*sin(3*pi*y);
phi_31 = sin(3*pi*x).*sin(1*pi*y);

figure()
surf(x,y,phi_12, 'edgecolor', 'none')
title("$\phi_{12}$ 3D Plot", "fontsize", 14, "interpreter", "latex")
figure()
surf(x,y,phi_21, 'edgecolor', 'none')
title("$\phi_{21}$ 3D Plot", "fontsize", 14, "interpreter", "latex")

figure()
contour(x,y,phi_12,'ShowText','on')
title("$\phi_{12}$ 2D Plot", "fontsize", 14, "interpreter", "latex")
figure()
contour(x,y,phi_21,'ShowText','on')
title("$\phi_{21}$ 2D Plot", "fontsize", 14, "interpreter", "latex")

%% #2(b)(c)(d)(e)
clear;clc;close all
[x, y] = meshgrid(0:0.01:1,0:0.01:1);
len = size(x);
phi_12 = sin(1*pi*x).*sin(2*pi*y);
phi_21 = sin(2*pi*x).*sin(1*pi*y);
phi_13 = sin(1*pi*x).*sin(3*pi*y);
phi_31 = sin(3*pi*x).*sin(1*pi*y);

figure()
surf(x,y,phi_12+phi_21, 'edgecolor', 'none')
title("$\phi_{12}+\phi_{21}$ 3D Plot", "fontsize", 14, "interpreter", "latex")
figure()
surf(x,y,phi_13+phi_31, 'edgecolor', 'none')
title("$\phi_{13}+\phi_{31}$ 3D Plot", "fontsize", 14, "interpreter", "latex")
figure()
surf(x,y,phi_13-phi_31, 'edgecolor', 'none')
title("$\phi_{13}-\phi_{31}$ 3D Plot", "fontsize", 14, "interpreter", "latex")
figure()
surf(x,y,phi_13+phi_31/3, 'edgecolor', 'none')
title("$\phi_{13}+\frac{1}{3}\phi_{31}$ 3D Plot", "fontsize", 14, "interpreter", "latex")

figure()
contour(x,y,phi_12+phi_21,'ShowText','on')
title("$\phi_{12}+\phi_{21}$ 2D Plot", "fontsize", 14, "interpreter", "latex")
figure()
contour(x,y,phi_13+phi_31,'ShowText','on')
title("$\phi_{13}+\phi_{31}$ 2D Plot", "fontsize", 14, "interpreter", "latex")
figure()
contour(x,y,phi_13-phi_31,'ShowText','on')
title("$\phi_{13}-\phi_{31}$ 2D Plot", "fontsize", 14, "interpreter", "latex")
figure()
contour(x,y,phi_13+phi_31/3,'ShowText','on')
title("$\phi_{13}+\frac{1}{3}\phi_{31}$ 2D Plot", "fontsize", 14, "interpreter", "latex")
