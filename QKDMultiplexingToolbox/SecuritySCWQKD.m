function [Q, K] = SecuritySCWQKD(m, tau, de, L, IL, alpha, nu, dPH, sigma, mu0, pdark, pnoise, infT, N)
    mu = m^2/2*mu0; 
    alph=alpha/(4.343);
    eff = tau*de*exp(-alph*L)*10^(-0.1*IL);
    chi = hbin((1-exp(-2*mu))/2);
    Q = (mu*eff*(1-nu)*(1 - 2*sigma*cos(dPH) + sigma^2) + nu*mu0*eff + pdark + pnoise)./(2*mu*eff*(1-nu)*(1 + sigma^2) + 2*nu*mu0*eff + 2*pdark + 2*pnoise);
    K = ((2*mu*eff*(1-nu)*(1 + sigma^2) + 2*nu*mu0*eff + 2*pdark + 2*pnoise)/(N*infT)).*(1-hbin(Q)-chi);
end