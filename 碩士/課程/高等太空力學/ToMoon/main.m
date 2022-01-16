%% 
%
%   Main function for transfar orbit from Earth to Moon
%
%   Author: PO HSUN WU
%   Last edit date: 2022/01/09 20:20
addpath('./lib')

%% Some parameter
clear;clc;close all
GM = 3.986004418e5;      % product of gravity constant and earth mass
GM_moon = GM/81.3;
mass_moon = 7.34767309e22;
mass_earth = 5.972e24;

%%
arrival_time = utc2jd(2024, 10, 28, 0, 0, 0);
[r_dep, v_dep] = planetEphemeris(arrival_time, 'Earth', 'Moon');
[SMA, ~, ~, ~, ~, ~] = RV2Elements(r_dep, v_dep);

D = norm(r_dep);

Rs = SMA*(mass_moon/mass_earth)^(2/5);

Datas = [];
count = 1;
for r = 500:100:1000
    r0 = r+6378.137;
    for v0 = 10:0.1:11
        for phi0 = 0:0.1:2*pi
            for lambda1 = 0:0.1:2*pi

                epsilon = v0^2/2 - GM/r0;
                h = r0*v0*cos(phi0);
                r1 = sqrt(D^2 + Rs^2 - 2*D*Rs*cos(lambda1));
                v1 = sqrt(2*(epsilon+GM/r1));
                phi1 = acos(h/(r1*v1));

                gamma1 = asin(Rs/r1*sin(lambda1));

                p = h^2/GM;
                a = -GM/(2*epsilon);
                ecc = sqrt(1-p/a);

                theta0 = acos((p-r0)/(r0*ecc));
                theta1 = acos((p-r1)/(r1*ecc));

                try
                    TOF = CalculateTOF(GM, a, ecc, theta0, theta1);
                    gamma0 = theta1 - theta0 - gamma1 - 2.649e-6*(TOF*86400);
                    
                catch
                    break

                end
                
                r2 = Rs;
                vm = 1.018;
                v2 = sqrt(v1^2 + vm^2 - 2*v1*vm*cos(phi1-gamma1));
                
                epsilon2 = asin(vm*cos(lambda1)-v1*cos(lambda1+gamma1-phi1));
                
                epsilon_moon = v2^2/2 - GM_moon/r2;
                h = r2*v2*sin(epsilon2);
                
                p_moon = h^2/GM_moon;
                a_moon = -GM_moon/(2*epsilon_moon);
                ecc_moon = sqrt(1-p_moon/a_moon);
                
                rp_moon = p_moon/(1+ecc_moon);
                vp_moon = sqrt(2*(epsilon_moon + GM_moon/rp_moon)) ;
                
                if ecc_moon>=1 && ecc_moon<10 && rp_moon>1737.1 && imag(a_moon)==0 && imag(ecc_moon)==0
                    Datas(count,:) = [r; v0; phi0; lambda1; TOF; rp_moon; a_moon; ecc_moon];
                    count = count+1;
                end
                
            end
        end
    end
end























rmpath('./lib')
