function Power = RamanNoisePowerOptimized(CH_NUM,CH_SPAC,Poutdbm,IL,alpha,L,wl_q,BW,type)
    
    alph=alpha/(4.343);
    c = 299792458; % [m/sec]
    Poutdbm = Poutdbm + IL;
    Pout = 10^-3*10^(0.1*Poutdbm);
    FREQ_ARRAY = 191.6 + (1:CH_NUM)*CH_SPAC*10^-3; %frequency grid according to ITU standard THz
    WL_ARRAY = c./(FREQ_ARRAY*10^12);
    BW_wl = (BW*10^9)*WL_ARRAY(1)^2/c*(10^9); %bandwidth in [nm]
    
    [wl_raman,css] = importfile('Default Dataset.csv');

    [pump_cs, pump_i] = max(css);
    pump_wl = wl_raman(pump_i);

    css_q = zeros(1,CH_NUM);

    for i = 1:CH_NUM    
        dwl = (WL_ARRAY(i) - pump_wl*10^-9);
        wl_raman_shift = (dwl + wl_raman*10^-9)*10^9;
        css_q(i) = interpolate_point(wl_q,wl_raman_shift,css); 
    end;
    
    if strcmp(type, 'forward')
        Power = Pout*L*BW_wl*sum(css_q);
    elseif strcmp(type, 'backward')
        Power = Pout*sinh(alph*L)/alph*BW_wl*sum(css_q);
    else
        display('Unidentified type of scattering')
    end;
end