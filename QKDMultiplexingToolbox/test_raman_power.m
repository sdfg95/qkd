CH_NUM = 10;
CH_SPAC = 100;
Rx = -32;
IL = 8;
L = (0:0.1:300);
BW = 15;
wl_q = 1535;
type = 'forward';
alpha = 0.18;
alpha_1310 = 0.35;
t_gate = 1*10^-9;
de = 0.1;
m = 0.319;
mu0 = 4;
nu = 10^-3;
sigma = 0.99;
dPH = 5*pi/180;
pdark = 1*10^-6;
tau = 1;
rep_rate = 100*10^6;
infT = 1/rep_rate;
N = 2;
ISOL = 110;
ti;

Power1 = RamanNoisePowerOptimized(CH_NUM,CH_SPAC,Rx,IL,alpha,L,wl_q,BW,type);
Power2 = RamanNoisePowerOptimized(CH_NUM,CH_SPAC,Rx,IL,alpha,L,wl_q,BW,'backward');
SNU = PowerSNU(Power1,rep_rate,wl_q);
LCXT = LCXTPower(CH_NUM, Rx, IL, ISOL);
PhotNum = PowerToPhotonNumber(Power1 + Power2,t_gate,wl_q,de,IL);
pchiso = PowerToPhotonNumber(LCXT,t_gate,1550,de,IL);
[Qd, Kd] = SecuritySCWQKD(m, tau, de, L, IL, alpha, nu, dPH, sigma, mu0, pdark, 0, infT, N);
[Q, K] = SecuritySCWQKD(m, tau, de, L, IL, alpha, nu, dPH, sigma, mu0, pdark, PhotNum, infT, N);

% синхра

% 
% BW = 0.2:0.1:15;
% distance = zeros(1,length(BW));
% for i = 1:length(BW)
%     Power = RamanNoisePowerOptimized(CH_NUM,CH_SPAC,Poutdbm,IL,alpha,L,wl_q,BW(i),type);
%     PhotNum = PowerToPhotonNumber(Power,t_gate,wl_q,de,IL);
%     [Q, K] = SecuritySCWQKD(m, tau, de, L, IL, alpha, nu, dPH, sigma, mu0, pdark, PhotNum, infT, N);
%     distance(i) = MaxAchDistance(L,K);
% end;
% 
% figure;
% plot(BW, distance);

Rasymm = 1.0;
mu_a = 0.2;
mu_b = 0.2;
e_0 = 0.5;
e_d = 0.015;
f = 1.16;
de = 0.1;
L_a = L/(1 + 1/Rasymm);
L_b = L/(1 + Rasymm);

Power_A = RamanNoisePowerOptimized(CH_NUM,CH_SPAC,Rx,IL,alpha,L_a,wl_q,BW,type);
noise_A = PowerToPhotonNumber(Power_A,t_gate,wl_q,de,IL);

Power_B = RamanNoisePowerOptimized(CH_NUM,CH_SPAC,Rx,IL,alpha,L_b,wl_q,BW,type);
noise_B = PowerToPhotonNumber(Power_B,t_gate,wl_q,de,IL);

[Q1, K1] = SecurityMDISimple(mu_a, mu_b ,L , Rasymm, alpha, IL, pdark, e_0, e_d, f, de, 0, 0, rep_rate);
[Q2, K2] = SecurityMDISimple(mu_a, mu_b ,L , Rasymm, alpha, IL, pdark, e_0, e_d, f, de, noise_A, noise_B, rep_rate);



tau_dead = 0.002*10^-6;
rho_AP = 0.008;
mu = 0.2;
Nd = 1;

Power = RamanNoisePowerOptimized(CH_NUM,CH_SPAC,Rx,IL,alpha,L,wl_q,BW,type);
PhotNum = PowerToPhotonNumber(Power,t_gate,wl_q,de,IL);
[Q2, K2] = SecurityCOW(mu, L, alpha, pdark, IL, de, rho_AP, tau_dead, rep_rate, 0, Nd);
semilogy(L,K2);

