 %% Digital Control Midterm
% Programer: PO-HSUN WU
% Last edit date: 2021/11/18 17:55

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
