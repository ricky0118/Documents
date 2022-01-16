%% 
%
%   This function was finding the time of flight by given start and ended
%   true anomaly.
%
%   Input:
%       GM:             product of gravity constant and the center mass
%       a:              semi-major axis
%       ecc:            eccenticity
%       theta_start:    true anomaly of start point
%       theta_end:      true anomaly of end point
%
%   Output:
%       TOF:            time of flight(in days)
%
%   Author: PO-HSUN WU
%   Last edit date: 2022/01/01 14:10

%%
function TOF = CalculatTOF(GM, a, ecc, theta_start, theta_end)
    M = GetMeanAnomaly(ecc, theta_end)-GetMeanAnomaly(ecc, theta_start);
    n = sqrt(GM/a^3);
    
    TOF = M/n;
    TOF = TOF/24/60/60;
    
end

function M = GetMeanAnomaly(ecc, theta)
    E = 2*atan(sqrt((1-ecc)/(1+ecc))*tan(theta/2));
    E = deg2rad(wrapTo360(rad2deg(E)));
    M = E-ecc*sin(E);
    
end