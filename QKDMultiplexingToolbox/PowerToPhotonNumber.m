function PhotNum = PowerToPhotonNumber(Power,t_gate,wl_q,de,IL)
    c = 299792458; % [m/sec]
    h = 6.62607015*10^-34;% [J*sec]
    PhotNum = Power*(wl_q*10^-9)/(h*c)*t_gate*de*10^(-0.1*IL);
end