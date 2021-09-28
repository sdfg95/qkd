function pnoise = NOISE(CH_NUM,CH_SPAC,Rx,IL,wl_q,BW,eta,t_gate,f_err,alpha,t_il,ti,L,t_b,mu,E)

    p_ram_f = (RamanNoisePowerOptimized(CH_NUM,CH_SPAC,Rx,IL,alpha,L,wl_q,BW,'forward'))*eta*t_gate/E;
    p_ram_b = (RamanNoisePowerOptimized(CH_NUM,CH_SPAC,Rx,IL,alpha,L,wl_q,BW,'backward'))*eta*t_gate/E;
    p_ram = p_ram_f+p_ram_b;
    
    
    alph=alpha/(4.343);
    t_f = exp(-alph*L);
    p_isi = 2*f_err*mu*t_il*t_f*t_b*eta;
    n_d = 10^(Rx/10)/E*10^(-12);

    p_lcxt = n_d*eta*10^(-ti)/10;
    
    
    pnoise = p_ram+p_lcxt+p_isi;

end

