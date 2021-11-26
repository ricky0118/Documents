 %% Digital Control Midterm
% Programer: PO-HSUN WU
% Last edit date: 2021/11/18 15:50

%% #4
clear;clc;close all
y = [];
n = 0:10;
for i = n
    switch i 
        case 0
            y(i+1) = -2;
        case 1
            y(i+1) = -2-y(i);
        otherwise
            y(i+1) = -2-y(i)+2*y(i-1);
    end
end

y_ = -2/3-2/9.*n-2/9.*2.^n;
figure()
stem(n, y)
figure()
stem(n,y)

%% #3
clear;clc;close all
figure()
hold on
n = 0:10;
for w = [10 10+20*pi 10+40*pi]
    y = sin(0.1*w.*n);
    plot(n,y,'x')
    pause(1)
end
