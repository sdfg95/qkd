CH_NUM = 2;
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
mu = 0.2;
rho_AP = 0.008;
eta = 0.17;
ti = 59;
Nd = 2;
tau_dead = 0.002*10^-6;
f_err = 0.001;
t_b = 2.65;
t_il = 1.95;
V = 0.98;
p_dc = 6*10^-6;


E = 1.278818*10^(-19);
pnoise = NOISE(CH_NUM,CH_SPAC,Rx,IL,wl_q,BW,eta,t_gate,f_err,alpha,t_il,ti,L,t_b,mu,E);
[Q,K] = SecurityCOW(mu, L, alpha, pdark, IL, de, rho_AP, tau_dead, rep_rate, pnoise, Nd);
set(0,'DefaultAxesFontSize',14,'DefaultAxesFontName','Times New Roman');

semilogy(L,K,'LineWidth',3);
xlabel('Distance');
ylabel('Secret Key Rate');
grid on;
hold on;
[Q,K] = SecurityCOW(mu, L, alpha, pdark, IL, de, rho_AP, tau_dead, rep_rate, 0, Nd);
set(0,'DefaultAxesFontSize',14,'DefaultAxesFontName','Times New Roman');
semilogy(L,K,'LineWidth',3);

hold on ; 
[Q, K] = SecurityBB84(eta,mu,pnoise,V,alpha, L ,rho_AP,IL,tau_dead,p_dc,t_gate, pdark,rep_rate,Nd,de);
semilogy(L,K,'LineWidth',3);

legend('COW,','COW без потерь','BB84');