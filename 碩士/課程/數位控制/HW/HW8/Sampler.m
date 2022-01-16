%% Sampler
% Programer: PO-HSUN WU
% Last edit date: 2021/12/27 13:41

%%
function y = Sampler(t)
    T = 1;
    shift = 0;
    if rem(t-shift,T) == 0
        y = 1;
    else
        y = 0;
    end
end
