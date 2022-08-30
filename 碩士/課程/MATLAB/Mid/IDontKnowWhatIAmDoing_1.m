%% MATLAB midterm
% Programer: PO-HSUN WU
% Last edit date: 2022/04/22 20:05

%%
clear;clc;close all
% Parameter define
R = 10;
V = 10:5:30;

% Calculate the power
P = ElectricPower(V, R);

% Plot the figure
figure()
plot(V, P, '.', 'MarkerSize', 12)

title("Power vs Voltage @ 10Ω")
xlabel("Voltage"); ylabel("Power")
xticks(V)
grid on

function P = ElectricPower(V, R)
    %   Description:
    %       Calculate the electric power with given voltage and resistance.
    %
    %   Input argument:
    %       - V: Voltage(Volt, V)
    %       - R: Resistance(Ohm, Ω)
    %
    %   Output argument:
    %       - P: Power(Watt, W)

    P = (V.^2)./R;
end
