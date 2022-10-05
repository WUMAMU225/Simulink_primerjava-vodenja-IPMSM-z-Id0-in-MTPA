clear all
run podatki_PMSM.m

% fazna napetost
U_s = U_dc/sqrt(3);
% amplituda fazne napetosti
U_base = U_s*sqrt(2);
I_base = I_max;

w_1 = 2*pi*50;

%rotacijska matrika
M = [0 -1; 1 0];
%matrika induktivnosti
X = [1/L_d 0;
     0     1/L_q];

%% PWM parametri:
T_Z = 1/3 * [2 -1 -1;
             -1 2 -1;
             -1 -1 2];
f_sw = 5000;
%% Hitrostna regulacija
alpha_s = 2*pi*25;
b = 0;
% kompenzacija (feed-forward)
b_a = 2*(alpha_s * J_m - b) / (3*p_p^2*psi_r);
% proporcionalni del regulatorja
k_ps = 2*alpha_s * J_m / (3*p_p^2*psi_r);
% integralni del regulatorja
k_is = 2*alpha_s^2 * J_m / (3*p_p^2*psi_r);

%% Tokovna regulacija
alpha_c = 2*pi*1200;
% proporcionalni del regulatorja
k_pd = alpha_c * L_d;
k_pq = alpha_c * L_q;
% integralni del regulatorja
k_id = alpha_c * R_s;
k_iq = alpha_c * R_s;

%% Hitrostna regulacija MTPA
alpha_s_MTPA = 2*pi*60;
b = 0;
% kompenzacija (feed-forward)
b_a_MTPA = 2*(alpha_s_MTPA * J_m - b) / (3*p_p^2*psi_r);
% proporcionalni del regulatorja
k_ps_MTPA = 2*alpha_s_MTPA * J_m / (3*p_p^2*psi_r);
% integralni del regulatorja
k_is_MTPA = 2*alpha_s_MTPA^2 * J_m / (3*p_p^2*psi_r);




