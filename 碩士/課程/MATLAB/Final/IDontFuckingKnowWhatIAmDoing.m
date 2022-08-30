%% MATLAB final
% Programer: PO-HSUN WU
% Last edit date: 2022/06/11 22:30

%%
clear;clc;close all
% Input and Target
P_2D = [1 1 1 1
        0 0 0 1
        0 0 0 1
        0 0 0 1
        1 1 1 1
        0 0 0 1
        0 0 0 1
        0 0 0 1
        1 1 1 1];
P = reshape(P_2D, 36, 1);
T = [0 0 1 1]';

% Initial W and b
W = randn(4, 36);
b = randn(4, 1);

% Call learn_p
[FW,Fb] = learn_p(P, T, W, b, 1, 0.001, 0)

% Check result
A = hardlim(FW*P+Fb)

%% Check unlearned input patterns
P_2D = [1 1 1 0
        0 0 1 1
        0 0 0 1
        0 0 0 1
        1 1 1 1
        0 0 0 1
        0 0 0 1
        0 0 1 1
        1 1 1 0];
P = reshape(P_2D, 36, 1);
A = hardlim(FW*P+Fb)
