function Pchiso = LCXTPower(CH_NUM, Rx, IL, ISOL)
    Pchiso = Rx + IL - ISOL;
    Pchiso = CH_NUM*10^((Pchiso-30)/10); 
end