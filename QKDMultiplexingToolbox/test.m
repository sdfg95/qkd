CH_NUM = 10;
CH_SPAC = 100;
Rx = -32;
IL = 8;
L = (0:0.1:300);
BW = 15;
wl_q = 1535;
c = 299792458;
h = 6.62607015*10^-34;
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

rho_AP = 0.008;
eta = 0.07;
ti = 59;
lambda = 1300*10^(-9);
Nd = 2;

f_err = 0.001;
t_b = 2.65;
t_il = 1.95;
pnoise = 0.00001;
tau_dead = 0.002*10^-6;



Power = RamanNoisePowerOptimized(CH_NUM,CH_SPAC,Rx,IL,alpha,L,wl_q,BW,'forward');
PhotNum = PowerToPhotonNumber(Power,t_gate,wl_q,de,IL);
[Q2, K2] = SecurityCOW(mu, L, alpha, pdark, IL, de, rho_AP, tau_dead, rep_rate, 0, Nd);

plot(L,Q2);