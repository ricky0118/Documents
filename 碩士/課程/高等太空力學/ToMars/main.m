%% 
%
%   Main function for transfar orbit from Earth to Mars
%
%   Author: PO HSUN WU
%   Last edit date: 2022/01/01 16:20
addpath('./lib')

%% Some parameter
clear;clc;close all
GM = 1.32712440018e11;      % product of gravity constant and sun mass
ended = 30;
datas = zeros(ended+1, 7);

%% Setup the departure time and the orbit element
for n = 0:1:ended
    departure_time = utc2jd(2024, 10, 28+n, 0, 0, 0);
    [a_dep, ecc_dep, inc_dep, longP_dep, Omega_dep, LLong_dep, theta_dep] = ...
        PlanetRV(3, 'ODA', departure_time);
    [r_dep, v_dep, gamma_dep] = Elements2RV(a_dep, ecc_dep, theta_dep, GM);

    %% Setup the arrival time and the orbit element
    arrival_time = utc2jd(2025, 8, 1, 0, 0, 0);
    [a_arr, ecc_arr, inc_arr, longP_arr, Omega_arr, LLong_arr, theta_arr] = ...
        PlanetRV(4, 'ODA', arrival_time);
    [r_arr, v_arr, gamma_arr] = Elements2RV(a_arr, ecc_arr, theta_arr, GM);

    TOF_target = arrival_time - departure_time;

    dTA = deg2rad(wrapTo360(rad2deg(LLong_arr-LLong_dep)));

    %% Find out the transfar orbit
    for theta_dep_trans = 0:0.000001:2*pi
        theta_arr_trans = theta_dep_trans+dTA;
        ecc_trans = (r_arr-r_dep)/(r_dep*cos(theta_dep_trans)-r_arr*cos(theta_arr_trans));
        rp_trans = r_dep*(1+ecc_trans*cos(theta_dep_trans))/(1+ecc_trans);
        a_trans = rp_trans/(1-ecc_trans);

        if ecc_trans>0 && ecc_trans<1 && a_trans>0
            TOF = CalculatTOF(GM, a_trans, ecc_trans, theta_dep_trans, theta_arr_trans);
        end
        if abs(TOF-TOF_target)<=1e-3
            break
        end
    end

    %% Find out the plane change parameter
    [r_trans, v_trans, gamma_trans] = Elements2RV(a_trans, ecc_trans, theta_dep_trans, GM);

    a = Omega_arr + pi - LLong_dep;
    b = LLong_arr - (Omega_arr + pi);
    alpha = pi - inc_arr;
    c = acos(cos(a)*cos(b) + sin(a)*sin(b)*cos(alpha));

    i_trans_dep = asin(sin(alpha)*sin(b)/sin(c));
    T_trans_dep = [1          0                0;
                   0  cos(i_trans_dep) sin(i_trans_dep);
                   0 -sin(i_trans_dep) cos(i_trans_dep)];

    vv_dep = [v_dep*sin(gamma_dep); v_dep*cos(gamma_dep); 0];
    vv_trans = T_trans_dep*[v_trans*sin(gamma_trans); v_trans*cos(gamma_trans); 0];

    V_HE = norm(vv_trans-vv_dep);
    C3 = V_HE^2;

    %% Save datas
    datas(n+1,:) = [n, C3, V_HE, a_trans, ecc_trans, theta_dep_trans, theta_arr_trans];

end

%% Plot the result
[min_C3, index_min_C3] = min(datas(:,2));
figure(); grid on; hold on
plot(datas(:,1), datas(:,2))
plot(datas(index_min_C3,1), datas(index_min_C3,2), "ro")
text(datas(index_min_C3,1), datas(index_min_C3,2)+1, sprintf("(%02d, %.4f)", datas(index_min_C3,1), datas(index_min_C3,2)), ...
     'HorizontalAlignment', 'center', 'FontSize', 14)
xlabel("date"); ylabel("C3")











rmpath('./lib')
