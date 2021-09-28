function p_isi = P_ISI(f_err,alpha,t_il,L,t_b,eta,mu)
    alph=alpha/(4.343);
    t_f = exp(-alph*L);
    
    p_isi = 2*f_err*mu*t_il*t_f*t_b*eta
end

