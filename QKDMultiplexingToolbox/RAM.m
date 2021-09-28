function p_ram = RAM(CH_NUM,CH_SPAC,Rx,IL,wl_q,BW,eta,t_gate,f_err,alpha,t_il,ti,L,t_b,mu,E)

    p_ram_f = (RamanNoisePowerOptimized(CH_NUM,CH_SPAC,Rx,IL,alpha,L,wl_q,BW,'forward'))*eta*t_gate/E;
    p_ram_b = (RamanNoisePowerOptimized(CH_NUM,CH_SPAC,Rx,IL,alpha,L,wl_q,BW,'backward'))*eta*t_gate/E;
    p_ram = p_ram_f+p_ram_b;
    
end