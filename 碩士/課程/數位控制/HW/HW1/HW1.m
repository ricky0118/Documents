%% Digital Control HW.1
% Example 1.1 Syncronization
% Programer: PO-HSUN WU
% Last edit date: 2021/09/29 20:40

%% Step input
clear;clc;close all
% Setting the initial config
count = 0;

for i = [1 1.33 1.66 2]
    % Renew the setting for the blocks
    count = count + 1;
    delay = i;
    % Run the Simulink model
    out = sim('HW1_step');
    % Get the datas and plot it
    t = out.tout;
    u = out.u.Data;
    yc = out.yc.Data;
    td = out.yd.Time;
    yd = out.yd.Data;
    subplot(2,2,count)
    plot(t, u, t, yc, td, yd, 'o')
    ylim([-0.1 1.1])
    title("D = "+delay)
end
saveas(gcf, 'step.jpg')

%% Pulse input
clear;clc;close all
% The block configs for the Simulink model 
delay_set = [1.33 1.33 1 0.33];
pulse_amp_set = [30 2 1 0.5];
pulse_pw_set = [0.3 5 10 20];

% Run all the case of the config
for i = 1:4
    % Renew the setting for the blocks
    delay = delay_set(i);
    pulse_amp = pulse_amp_set(i);
    pulse_pw = pulse_pw_set(i);
    % Run the Simulink model
    out = sim('HW1_pulse');
    % Get the datas and plot it
    t = out.tout;
    u = out.u.Data;
    yc = out.yc.Data;
    td = out.yd.Time;
    yd = out.yd.Data;
    subplot(2,2,i)
    plot(t, u, t, yc, td, yd, 'o')
    yticks(0:0.2:1)
    ylim([-0.1 1.1])
end
saveas(gcf, 'pulse.jpg')