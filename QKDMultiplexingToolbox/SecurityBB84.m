function [Q, K] = SecurityBB84(eta,mu,pnoise,V,alpha, L ,rho_AP,IL,tau_dead,p_dc,t_gate, pdark,rep_rate,Nd,de)
    alph=alpha/(4.343);
    beta = 1;
    t_IL = 10^(-0.1*IL);
    tf = exp(-alph*L);
    d = (1-V)./(2-mu./tf);
    P = 0.5+sqrt(d.*(1-d));
    H = -P.*log2(P)-(1-P).*log2(1-P);
    pdc = p_dc*t_gate;
    I_AE = ((1-mu./(2*tf)).*(1-H)+mu./(2*tf))./(1+Nd*pdc./(mu.*tf.*eta));
    
    p_mu = mu.*t_IL.*de.*tf;
    p_AP = rho_AP*(p_mu + Nd*pdark + pnoise);
    
    eta_dead = (1 + tau_dead*rep_rate*(p_mu + Nd*pdark + pnoise)).^(-1);
    
    l_A = 10;
    eta_duty = l_A./(L+l_A);
    
    Rsift = 1/2*(beta*p_mu + Nd*pdark +p_AP + pnoise)*rep_rate.*eta_duty.*eta_dead;
    
    Q = 1/2*(p_mu*(1-V)+Nd*pdark + p_AP + pnoise)./(beta*p_mu + Nd*pdark + p_AP + pnoise);
    
    eta_ec = 6/5; 
    
    Hq = -Q.*log2(Q)-(1-Q).*log2(1-Q);
    I_AB = 1 - eta_ec*Hq;
    K = Rsift.*(I_AB - I_AE);

end

