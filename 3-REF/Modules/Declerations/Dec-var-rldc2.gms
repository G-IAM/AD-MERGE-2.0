PVshare(tp,rg,sw)=sum((ts,etsolar),PE.L(etsolar,tp,ts,rg,sw))/E.L(rg,tp,sw);
WINDshare(tp,rg,sw)=sum((ts,etwind),PE.L(etwind,tp,ts,rg,sw))/E.L(rg,tp,sw);
VREshare(tp,rg,sw)= WINDshare(tp,rg,sw)+ PVshare(tp,rg,sw);
RESE(rg,pp,sw)=Res_marg_share(pp,rg,sw)* E.L(rg,pp,sw);
H1(tp,rg,sw) =  h1a00(rg) 
            +h1a10(rg)*WINDshare(tp,rg,sw)
            +h1a01(rg)*PVshare(tp,rg,sw)
            +h1a20(rg)*sqr(WINDshare(tp,rg,sw))
            +h1a11(rg)*WINDshare(tp,rg,sw)*PVshare(tp,rg,sw)
            +h1a02(rg)*sqr(PVshare(tp,rg,sw))
            +h1a30(rg)*WINDshare(tp,rg,sw)**3
            +h1a21(rg)*sqr(WINDshare(tp,rg,sw))*PVshare(tp,rg,sw)
            +h1a12(rg)*WINDshare(tp,rg,sw)*sqr(PVshare(tp,rg,sw))
            +h1a03(rg)*PVshare(tp,rg,sw)**3;        
H2(tp,rg,sw) =  h2a00(rg) 
            +h2a10(rg)*WINDshare(tp,rg,sw)
            +h2a01(rg)*PVshare(tp,rg,sw)
            +h2a20(rg)*sqr(WINDshare(tp,rg,sw))
            +h2a11(rg)*WINDshare(tp,rg,sw)*PVshare(tp,rg,sw)
            +h2a02(rg)*sqr(PVshare(tp,rg,sw))
            +h2a30(rg)*WINDshare(tp,rg,sw)**3
            +h2a21(rg)*sqr(WINDshare(tp,rg,sw))*PVshare(tp,rg,sw)
            +h2a12(rg)*WINDshare(tp,rg,sw)*sqr(PVshare(tp,rg,sw))
            +h2a03(rg)*PVshare(tp,rg,sw)**3;            
H3(tp,rg,sw) =  h3a00(rg) 
            +h3a10(rg)*WINDshare(tp,rg,sw)
            +h3a01(rg)*PVshare(tp,rg,sw)
            +h3a20(rg)*sqr(WINDshare(tp,rg,sw))
            +h3a11(rg)*WINDshare(tp,rg,sw)*PVshare(tp,rg,sw)
            +h3a02(rg)*sqr(PVshare(tp,rg,sw))
            +h3a30(rg)*WINDshare(tp,rg,sw)**3
            +h3a21(rg)*sqr(WINDshare(tp,rg,sw))*PVshare(tp,rg,sw)
            +h3a12(rg)*WINDshare(tp,rg,sw)*sqr(PVshare(tp,rg,sw))
            +h3a03(rg)*PVshare(tp,rg,sw)**3;            
H4(tp,rg,sw) =  h4a00(rg) 
            +h4a10(rg)*WINDshare(tp,rg,sw)
            +h4a01(rg)*PVshare(tp,rg,sw)
            +h4a20(rg)*sqr(WINDshare(tp,rg,sw))
            +h4a11(rg)*WINDshare(tp,rg,sw)*PVshare(tp,rg,sw)
            +h4a02(rg)*sqr(PVshare(tp,rg,sw))
            +h4a30(rg)*WINDshare(tp,rg,sw)**3
            +h4a21(rg)*sqr(WINDshare(tp,rg,sw))*PVshare(tp,rg,sw)
            +h4a12(rg)*WINDshare(tp,rg,sw)*sqr(PVshare(tp,rg,sw))
            +h4a03(rg)*PVshare(tp,rg,sw)**3;
            
Hp(tp,rg,sw) =  hpa00(rg) 
            +hpa10(rg)*WINDshare(tp,rg,sw)
            +hpa01(rg)*PVshare(tp,rg,sw)
            +hpa20(rg)*sqr(WINDshare(tp,rg,sw))
            +hpa11(rg)*WINDshare(tp,rg,sw)*PVshare(tp,rg,sw)
            +hpa02(rg)*sqr(PVshare(tp,rg,sw))
            +hpa30(rg)*WINDshare(tp,rg,sw)**3
            +hpa21(rg)*sqr(WINDshare(tp,rg,sw))*PVshare(tp,rg,sw)
            +hpa12(rg)*WINDshare(tp,rg,sw)*sqr(PVshare(tp,rg,sw))
            +hpa03(rg)*PVshare(tp,rg,sw)**3;          
CU(tp,rg,sw) =  cua00(rg) 
            +cua10(rg)*WINDshare(tp,rg,sw)
            +cua01(rg)*PVshare(tp,rg,sw)
            +cua20(rg)*sqr(WINDshare(tp,rg,sw))
            +cua11(rg)*WINDshare(tp,rg,sw)*PVshare(tp,rg,sw)
            +cua02(rg)*sqr(PVshare(tp,rg,sw))
            +cua30(rg)*WINDshare(tp,rg,sw)**3
            +cua21(rg)*sqr(WINDshare(tp,rg,sw))*PVshare(tp,rg,sw)
            +cua12(rg)*WINDshare(tp,rg,sw)*sqr(PVshare(tp,rg,sw))
            +cua03(rg)*PVshare(tp,rg,sw)**3;
peakshare(tp,rg,sw)= (Hp(tp,rg,sw) - H3(tp,rg,sw)) * 2200 /
               ((H1(tp,rg,sw) - H2(tp,rg,sw)) * 700 + (H2(tp,rg,sw) - H3(tp,rg,sw)) * 2200
               + (H3(tp,rg,sw) - H4(tp,rg,sw)) * 4400 + H4(tp,rg,sw) * 8760);              
Res_marg_share(tp,rg,sw)=(Hp(tp,rg,sw) - H2(tp,rg,sw)) * 700 /
               ((H1(tp,rg,sw) - H2(tp,rg,sw)) * 700 + (H2(tp,rg,sw) - H3(tp,rg,sw)) * 2200
               + (H3(tp,rg,sw) - H4(tp,rg,sw)) * 4400 + H4(tp,rg,sw) * 8760);
sscap(tp,rg,sw) =  sscapa00(rg) 
               +sscapa10(rg)*WINDshare(tp,rg,sw)
               +sscapa01(rg)*PVshare(tp,rg,sw)
               +sscapa20(rg)*sqr(WINDshare(tp,rg,sw))
               +sscapa11(rg)*WINDshare(tp,rg,sw)*PVshare(tp,rg,sw)
               +sscapa02(rg)*sqr(PVshare(tp,rg,sw))
               +sscapa30(rg)*WINDshare(tp,rg,sw)**3
               +sscapa21(rg)*sqr(WINDshare(tp,rg,sw))*PVshare(tp,rg,sw)
               +sscapa12(rg)*WINDshare(tp,rg,sw)*sqr(PVshare(tp,rg,sw))
               +sscapa03(rg)*PVshare(tp,rg,sw)**3;         
ssc(tp,rg,sw) =  ssca00(rg) 
               +ssca10(rg)*WINDshare(tp,rg,sw)
               +ssca01(rg)*PVshare(tp,rg,sw)
               +ssca20(rg)*sqr(WINDshare(tp,rg,sw))
               +ssca11(rg)*WINDshare(tp,rg,sw)*PVshare(tp,rg,sw)
               +ssca02(rg)*sqr(PVshare(tp,rg,sw))
               +ssca30(rg)*WINDshare(tp,rg,sw)**3
               +ssca21(rg)*sqr(WINDshare(tp,rg,sw))*PVshare(tp,rg,sw)
               +ssca12(rg)*WINDshare(tp,rg,sw)*sqr(PVshare(tp,rg,sw))
               +ssca03(rg)*PVshare(tp,rg,sw)**3;
PE.FX("HYDRO",pp,"peak",RG,SW)=shyd*RESE(rg,pp,sw);
Residualpeak(pp,rg,sw)=peakshare(pp,rg,sw)-Res_marg_share(pp,rg,sw)*E.L(rg,pp,sw)*sscap(pp,rg,sw);
SSprod(pp,rg,sw)=Res_marg_share(pp,rg,sw)*sscap(pp,rg,sw);
H2curtail(pp,rg,sw)=CU(pp,rg,sw)*E.L(rg,pp,sw)-Res_marg_share(pp,rg,sw)*E.L(rg,pp,sw)*sscap(pp,rg,sw);
tot_cost_SS(tp,rg,sw)=ssc(tp,rg,sw)*Res_marg_share(tp,rg,sw)*E.L(rg,tp,sw)*sscap(tp,rg,sw)/700*(10**6);
display h1a00 ,h1a10 ,h1a01 ,h1a20 ,h1a11,h1a02,h1a30 ,h1a21 ,h1a12 ,h1a03

,h2a00 ,h2a10,h2a01 ,h2a20,h2a11 ,h2a02 ,h2a30 ,h2a21 ,h2a12 ,h2a03

,h3a00,h3a10 ,h3a01 ,h3a20,h3a11,h3a02 ,h3a30,h3a21 ,h3a12 ,h3a03

,h4a00 ,h4a10 ,h4a01 ,h4a20,h4a11 ,h4a02 ,h4a30 ,h4a21 ,h4a12 ,h4a03

,hpa00 ,hpa10 ,hpa01 ,hpa20,hpa11 ,hpa02,hpa30 ,hpa21,hpa12,hpa03

,cua00 ,cua10 ,cua01 ,cua20,cua11 ,cua02 ,cua30 ,cua21 ,cua12 ,cua03;

display H1, H2, H3, H4,Hp, CU, PVshare, WINDshare, peakshare,Res_marg_share, Residualpeak, VREshare, SSprod, tot_cost_SS, H2curtail;




SOLVE M5 MAXIMIZING NWEL USING NLP;




