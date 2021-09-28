function p_lcxt = LCXT(Rx,eta,ti,E)

    n_d = 10^(Rx/10)/E*10^(-12);

    p_lcxt = n_d*eta*10^(-ti)/10;
    
end

