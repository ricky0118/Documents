%% 
%
%   This function finds the r and v value by given orbit elements.
%
%   Input:
%       a:      semi-major axis
%       ecc:    eccenticity
%       theta:  true anomaly
%       GM:     product of gravity constant and the center mass
%
%   Output:
%       r:      the radius value between the orbit and the focus
%       v:      the velocity value of the orbit with respect to the focus
%       FPA:    flight path angle
%
%   Author: PO-HSUN WU
%   Last edit date: 2021/12/31 19:09

%%
function [r, v, FPA] = Elements2RV(a, ecc, theta, GM)
    E = 2*atan(sqrt((1-ecc)/(1+ecc))*tan(theta/2));
    
    r = a*(1-ecc*cos(E));
    v = sqrt(GM*(2/r-1/a));
    
    FPA = atan(ecc*sin(theta)/(1+ecc*cos(theta)));
end