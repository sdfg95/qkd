function p_isi = ISI(Rx,eta,f_err,alpha,t_il,ti,L,t_b,mu,E)

   
    alph=alpha/(4.343);
    t_f = exp(-alph*L);
    p_isi = 2*f_err*mu*t_il*t_f*t_b*eta;
    

end