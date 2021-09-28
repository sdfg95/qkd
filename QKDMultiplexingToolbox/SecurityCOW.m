function [Q, K] = SecurityCOW(mu, L, alpha, pdark, IL, de, rho_AP, tau_dead, rep_rate, pnoise, Nd)
    beta = 1;
    V = 0.98;
    alph=alpha/(4.343);
    t_IL = 10^(-0.1*IL);
    t_f = exp(-alph*L);
    p_mu = mu*t_f*t_IL*de;
    p_AP = rho_AP*(p_mu + Nd*pdark + pnoise);
    eta_dead = (1 + tau_dead*rep_rate*(p_mu + Nd*pdark + pnoise)).^(-1);
    l_A = 10;
    eta_duty = l_A./(L+l_A);
    Rsift = 1/2*(beta*p_mu + Nd*pdark +p_AP + pnoise)*rep_rate.*eta_duty.*eta_dead;
    Q = 1/2*(Nd*pdark + p_AP + pnoise)./(beta*p_mu + Nd*pdark + p_AP + pnoise);
    eta_ec = 6/5;
    I_AB = 1 - eta_ec*hbin(Q);
    I_AE = mu*(1 - t_f) + (1 - V)*(1 + exp(-mu*t_f))./(2*exp(-mu*t_f));
    K = Rsift.*(I_AB - I_AE);
end