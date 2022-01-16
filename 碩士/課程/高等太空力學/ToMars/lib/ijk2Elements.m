%% 
%
% This function finds the orbital element by giving the position vector and
% velocity vector
%
% Author: PO-HSUN WU
% Last edit date: 2021/12/12 16:26

%%
function [a, ecc, i, Omega, omega, theta] = ijk2Elements(r, v)
    GM = 3.986e5;
    ui = [1 0 0];
    uk = [0 0 1];
    
    mag_r = norm(r);
    mag_v = norm(v);
    
    Ener = mag_v^2/2 - GM/mag_r;
    a = -GM/(2*Ener);
    
    h = cross(r,v)/norm(cross(r,v));
    i = acos(dot(h,uk));
    
    ecc = -(cross(cross(r,v),v)/GM + r/mag_r);
    mag_ecc = norm(ecc);
    
    N = cross(uk,h);
    mag_N = norm(N);
    
    cos_Omega = dot(ui,N)/mag_N;
    sin_Omega = cross(ui,N)/mag_N;
    
    Omega = atan2(sin_Omega(3), cos_Omega);
    if Omega<0
        Omega = Omega+2*pi();
    end    
    
    cos_omega = dot(N,ecc)/(mag_N*mag_ecc);
    sin_omega = dot(cross(N,ecc)/(mag_N*mag_ecc), h);
    omega = atan2(sin_omega, cos_omega);
    if omega<0
        omega = omega+2*pi();
    end
    
    cos_theta = dot(ecc,r)/(mag_ecc*mag_r);
    sin_theta = dot(cross(ecc,r)/(mag_ecc*mag_r), h);
    theta = atan2(sin_theta,cos_theta);
    if theta<0
        theta = theta+2*pi();
    end

end