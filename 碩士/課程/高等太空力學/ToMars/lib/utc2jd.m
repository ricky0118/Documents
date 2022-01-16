%% 
%
% This function finds the Julian date by given Year, Month, Day, and Time.
%
% Author: PO-HSUN WU
% Last edit date: 2021/12/12 16:26

%%
function JD = utc2jd(year, month, day, hour, minute, second)
    JD = 367*year - fix(7*(year + fix((month+9)/12))/4) + fix(275*month/9) + day + 1721013.5 + hour/24 + minute/1440 + second/86400;
end

