function SNU = PowerSNU(Power, frep, wl_q)
    h = 6.62607015*10^-34;
    c = 299792458;
    fq = c/(wl_q*10^-9);
    tau = 1/frep;
    SNU = 2*Power/(frep*fq*h);
end