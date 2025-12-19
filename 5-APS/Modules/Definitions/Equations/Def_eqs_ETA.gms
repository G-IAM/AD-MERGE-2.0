supelec(rg,pp,sw)$st(pp,sw)..
                sum(etnonpeak,PE(etnonpeak,pp,"nonpeak",rg,sw)) =g=
                (1-peakshare(pp,rg,sw)+CU(pp,rg,sw))*E(rg,pp,sw) + eeis(pp,rg) * (EISS(pp,rg,sw) - eisdemand(pp,rg))+
                htrth2("electrolysis",pp,rg) * PH("electrolysis",pp,rg,sw)+DAC1ELC(pp)*SUM((ps), cabDAC(pp,rg,ps)*DAC1(pp,rg,ps,sw))+DAC2ELC(pp)*SUM((ps), cabDAC(pp,rg,ps)*DAC2(pp,rg,ps,sw));
                
supelecpeak(rg,pp,sw)$st(pp,sw)..
                sum(etpeak, PE(etpeak,pp,"peak",rg,sw)) =g=
                (peakshare(pp,rg,sw)-Res_marg_share(pp,rg,sw)*sscap(pp,rg,sw))*E(rg,pp,sw);

Nuc_SMR_peak(rg,pp,sw)$st(pp,sw)..
                PE("nuc-smr",pp,"peak",rg,sw) =l= pkSMR*PE("nuc-smr",pp,"nonpeak",rg,sw);

prodwindon(pp,ts,rg,sw)$st(pp,sw)..
                PE("windon",pp,ts,rg,sw)=e=sum((wind_class,wind_dist),PE_W("windon",wind_class,wind_dist,pp,ts,rg,sw));
prodwindoff(pp,ts,rg,sw)$st(pp,sw)..
                PE("windoff",pp,ts,rg,sw)=e=sum((wind_depth,wind_class,wind_dist),PE_Woff("windoff",wind_class,wind_depth,wind_dist,pp,ts,rg,sw));

prodsolar(etsolar,pp,ts,rg,sw)$st(pp,sw)..
                PE(etsolar,pp,ts,rg,sw)=e=sum((solar_class,solar_dist),PE_S(etsolar,solar_class,solar_dist,pp,ts,rg,sw));

Windonpotential(wind_class,wind_dist,pp,rg,sw)$st(pp,sw)..
                sum(ts,PE_W("windon",wind_class,wind_dist,pp,ts,rg,sw))=l= windon_pot(wind_class,wind_dist,rg);
Windoffpotential(wind_class,wind_depth,wind_dist,pp,rg,sw)$st(pp,sw)..
                sum(ts,PE_Woff("windoff",wind_class,wind_depth,wind_dist,pp,ts,rg,sw))=l= windoff_pot(wind_class,wind_depth,wind_dist,rg);

Solarpotential(solar_class,solar_dist,pp,rg,sw)$st(pp,sw)..
                sum(ts,PE_S("SolarPV",solar_class,solar_dist,pp,ts,rg,sw))=l= solarpv_pot(solar_class,solar_dist,rg);
CSPpotential(solar_class,solar_dist,pp,rg,sw)$st(pp,sw)..
                sum(ts,PE_S("CSP",solar_class,solar_dist,pp,ts,rg,sw))=l= CSP_pot(solar_class,solar_dist,rg);

elecgfrac(rg,pp,sw)$st(pp,sw)..
                PE("gas-r",pp,"peak",rg,sw)+PE("gas-n",pp,"peak",rg,sw)+PE("gas-a",pp,"peak",rg,sw) =l= 
                elgfrac(RG)*(peakshare(pp,rg,sw)-Res_marg_share(pp,rg,sw)*sscap(pp,rg,sw))*E(rg,pp,sw);

supnon(rg,pp,sw)$st(pp,sw)..
                PN("cldu",pp,rg,sw)
              + PN("synf",pp,rg,sw)
              + PN("rnew",pp,rg,sw)
              + PN("neb-hc",pp,rg,sw)
              + PN("neb-lc",pp,rg,sw)
              + PN("lbdn",pp,rg,sw)
              + OILNON(pp,rg,sw)
              + GASNON(pp,rg,sw)+PN("H2",pp,rg,sw)=g=
                N(rg,pp,sw)
              + neis(pp,rg) * (EISS(pp,rg,sw)
              - eisdemand(pp,rg));

supgas(rg,pp,sw)$st(pp,sw)..
                sum(gasc, PN(gasc,pp,rg,sw))  =g=
                htrt("gas-r",pp,rg) * sum(ts,PE("gas-r",pp,ts,rg,sw))
              + htrt("gas-n",pp,rg) * sum(ts,PE("gas-n",pp,ts,rg,sw))
              + htrt("gas-a",pp,rg) * sum(ts,PE("gas-a",pp,ts,rg,sw))
                                 + GASNON(pp,rg,sw)
                                 + NTX("gas",pp,rg,sw)                               
                                 + htrth2("gas-h2",pp,rg) * PH("gas-h2",pp,rg,sw)
                                 + htrth2("gas-h2-CCS",pp,rg) * PH("gas-h2-CCS",pp,rg,sw)
                                + DACGAS(pp)*SUM((ps), cabDAC(pp,rg,ps)*DAC1(pp,rg,ps,sw))
                                 ;
supoil(rg,pp,sw)$st(pp,sw)..
                sum(oilc, PN(oilc,pp,rg,sw))  =g=
                htrt("oil-r",pp,rg) * sum(ts,PE("oil-r",pp,ts,rg,sw))
                                 + OILNON(pp,rg,sw)
                                 + NTX("oil",pp,rg,sw);
supcoal(rg,pp,sw)$st(pp,sw)..
                 sum(coalc, PN(coalc,pp,rg,sw))  =e=
                htrt("coal-r",pp,rg) * sum(ts,PE("coal-r",pp,ts,rg,sw))
              + htrt("coal-n",pp,rg) * sum(ts,PE("coal-n",pp,ts,rg,sw))
              + htrt("coal-a",pp,rg) * sum(ts,PE("coal-a",pp,ts,rg,sw))
              + htrt("igcc  ",pp,rg) * sum(ts,PE("igcc  ",pp,ts,rg,sw))
                                  + PN("cldu",pp,rg,sw)
                   + (1 + syntpe) * PN("synf",pp,rg,sw)
                   + htrth2("coal-h2",pp,rg) * PH("coal-h2",pp,rg,sw)
                   + htrth2("coal-h2-CCS",pp,rg) * PH("coal-h2-CCS",pp,rg,sw);

supura(rg,pp,sw)$st(pp,sw)..

                 sum(urac, PNF(urac,pp,rg,sw))  =g=
                htrt("nuc-LWR",pp,rg) * sum(ts,PE("nuc-LWR",pp,ts,rg,sw))
              + htrt("nuc-SMR",pp,rg) * sum(ts,PE("nuc-SMR",pp,ts,rg,sw))
              + htrt("nuc-VHTR",pp,rg) * sum(ts,PE("nuc-VHTR",pp,ts,rg,sw))            
              + htrt("nuc-SFR",pp,rg) * sum(ts,PE("nuc-SFR",pp,ts,rg,sw))              
              + NTX("ura",pp,rg,sw)              
              - MOX(pp,rg,sw);
prodMOX(tp+1,rg,sw)$st(tp+1,sw)..
    
    MOX(tp+1,rg,sw)     =l=     10**6*W(tp,rg,sw);

supeis(rg,pp,sw)$st(pp,sw)..
                           EISS(pp,rg,sw)      =g=
                           eisdemand(pp,rg)     + NTX("eis",pp,rg,sw);
                           
suphydrogen(rg,pp,sw)$st(pp,sw)..
              sum(ht, PH(ht,pp,rg,sw))+Wh2KJConv*H2curtail(pp,rg,sw) =g=
               PN("H2",pp,rg,sw)
               + NTX("h2",pp,rg,sw);
gfrac(rg,pp,sw)$st(pp,sw)..
                GASNON(pp,rg,sw) =l= gasfrac * N(rg,pp,sw);
coalpeaksh(rg,pp,sw)$st(pp,sw)..
                PE("coal-n",pp,"peak",rg,sw)+PE("coal-a",pp,"peak",rg,sw)+PE("IGCC",pp,"peak",rg,sw) =l= pkcoal*(peakshare(pp,rg,sw)-Res_marg_share(pp,rg,sw)*sscap(pp,rg,sw))*E(rg,pp,sw);
                      
flex(rg,pp,sw)$st(pp,sw)..
sum((et,ts), f(et)*PE(et,pp,ts,rg,sw))+f("load")*E(rg,pp,sw)=g=0;

costnrg(rg,tp,sw)$(pp(tp) and st(tp,sw))..    EC(rg,tp,sw) =g= .001 * (
                      sum((nonvre,ts), PE(nonvre,tp,ts,rg,sw)*ecst(nonvre,tp,rg)* cstred(tp))
                    + sum((wind_class,wind_dist,ts), PE_W("windon",wind_class,wind_dist,tp,ts,rg,sw)
                                                  *windcst("windon",wind_class,wind_dist,tp,rg))
                    + sum((wind_depth,wind_class,wind_dist,ts), PE_Woff("windoff",wind_class,wind_depth,wind_dist,tp,ts,rg,sw)
                                                  *windcst("windoff",wind_class,wind_dist,tp,rg)*
                                                  depth_coef(wind_depth))
                    + sum((solar_class,solar_dist,ts), PE_S("SolarPV",solar_class,solar_dist,tp,ts,rg,sw)
                                                            *solarcst("SolarPV",solar_class,solar_dist,tp,rg))
                    + sum((solar_class,solar_dist,ts), PE_S("CSP",solar_class,solar_dist,tp,ts,rg,sw)
                                                            *solarcst("CSP",solar_class,solar_dist,tp,rg))
                    + tot_cost_SS(tp,rg,sw)
                    
                    + sum((ts,etwind),LCoT_cost*((1+WINDshare(tp,rg,sw))**b-1)*PE(etwind,tp,ts,rg,sw))
                    + sum((ts,etPV),LCoT_cost*((1+PVshare(tp,rg,sw))**b-1)*PE(etPV,tp,ts,rg,sw))
                    + sum((wind_dist,wind_class,ts),LCoT_cost*grid_wind_dis_cost("windon",wind_dist)/grid_cost
                                                    *PE_W("windon",wind_class,wind_dist,tp,ts,rg,sw))
                    + sum((wind_depth,wind_dist,wind_class,ts),LCoT_cost*grid_wind_dis_cost("windoff",wind_dist)/grid_cost
                                                               *PE_Woff("windoff",wind_class,wind_depth,wind_dist,tp,ts,rg,sw))
                    + sum((solar_dist,solar_class,ts),LCoT_cost*grid_Solar_dis_cost("SolarPV",solar_dist)/grid_cost
                                                               *PE_S("solarPV",solar_class,solar_dist,tp,ts,rg,sw))
                                                               
                    + sum((solar_dist,solar_class,ts),LCoT_cost*grid_Solar_dis_cost("CSP",solar_dist)/grid_cost
                                                               *PE_S("CSP",solar_class,solar_dist,tp,ts,rg,sw))
                     + sum(ht, PH(ht,tp,rg,sw)*(hcst(ht,tp,rg)+H2T(tp, rg))* cstred(tp))

                   + sum(nt, PN(nt,tp,rg,sw)*ncst(nt,tp,rg)* cstred(tp)*c_mod(nt,tp))
                    + ogpd(rg)*GASNON(tp,rg,sw)
                    + xntax(rg)*N(rg,tp,sw)
                    + xetax(rg)*E(rg,tp,sw)
                    + ctax(tp,rg)*CLEV(tp,rg,sw)
                    - taxrev(rg,tp,sw)
                    + rcl(tp)*CRLX(tp,rg,sw)
                    + sh(tp,rg) *  acf *
               SUM((sy,ps), price(sy,tp,ps)*cab(sy,tp,ps)*AFF(sy,ps,sw))
                    + SUM((ps), priceDAC1(tp,ps)*cabDAC(tp,rg,ps)*DAC1(tp,rg,ps,sw))
                    + SUM((ps), priceDAC2(tp,ps)*cabDAC(tp,rg,ps)*DAC2(tp,rg,ps,sw)*HUSC(rg,ps))
                    + sum ((ghg,abx), abcst(abx,ghg)*ABATE(ghg,abx,tp,rg,sw))
                    + sum(trd, cstexp(trd)*EXPRT(trd,tp,rg,sw))
       + hofrac(tp)  *   ceis(tp,rg) * EISS(tp,rg,sw)
+ .5 * (1-hofrac(tp)) *  ceis(tp,rg) * EISS(tp,rg,sw) * EISS(tp,rg,sw)/eisdemand(tp,rg)
        - hofrac(tp)  *  ceis(tp,rg) * eisdemand(tp,rg)
- .5 * (1-hofrac(tp)) *  ceis(tp,rg) * eisdemand(tp,rg)
                                              );
cc(rg,pp,sw)$st(pp,sw)..     Y(rg,pp,sw) =e=
                      C(rg,pp,sw) + I(rg,pp,sw) + EC(rg,pp,sw) + MD(rg,pp,sw)
                                                       + NTX("nmr",pp,rg,sw);

trdbal(pp,trd,sw)$st(pp,sw)..
                 sum(rg, NTX(trd, pp, rg,sw)) =e= 0;
ntdef(trd,tp,rg,sw) $ (cstexp(trd) and st(tp,sw))..
                 NTX(trd,tp,rg,sw) =l= EXPRT(trd,tp,rg,sw);

RNEWConstraint(rg,tp20,nt,sw)$st(tp20,sw)..
                    NCAP("RNEW",tp20,rg) =g=  
                    PN("RNEW",tp20,rg,sw)+PN("neb-hc",tp20,rg,sw);
dece(rg,tp+1,dle,sw)$st(tp+1,sw)..
                 sum(ts,PE(dle,tp+1,ts,rg,sw)) =g=
                  sum(ts,PE(dle,tp,ts,rg,sw))*(decf(rg)**nyper(tp));
decn(rg,tp+1,dln,sw)$st(tp+1,sw)..
                 PN(dln,tp+1,rg,sw) =g=
                 PN(dln,tp,rg,sw)*(decf(rg)**nyper(tp));
deco(rg,tp+1,sw)$st(tp+1,sw)..
                 OILNON(tp+1,rg,sw) =g=
                 OILNON(tp,rg,sw)*(decfo(rg)**nyper(tp));

decg(rg,tp+1,sw)$st(tp+1,sw)..
                 GASNON(tp+1,rg,sw) =g=
                 GASNON(tp,rg,sw)*(decfo(rg)**nyper(tp));
                 
dech2(ht,rg,tp10+1,sw)$st(tp10+1,sw)..      
                 PH(ht,tp10+1,rg,sw) =g=
                 PH(ht,tp10,rg,sw)*(decfh2(rg)**nyper(tp10));               
exph2(rg,tp10+1,ht,sw)$st(tp10+1,sw)..
             PH(ht,tp10+1,rg,sw) - nshf(rg) * N(rg,tp10+1,sw)
       =l=            (hxpf(rg)**nyper(tp10)) * PH(ht,tp10,rg,sw); 

expe(rg,tp+1,xle,sw)$st(tp+1,sw)..
             sum(ts,PE(xle,tp+1,ts,rg,sw))  - nshf(rg) *0.5* E(rg,tp+1,sw)
       =l=            (expf(rg)**nyper(tp)) * sum(ts,PE(xle,tp,ts,rg,sw));

expnuc(rg,tp+1,etNUC,sw)$st(tp+1,sw)..
     sum(ts,PE(etNUC,tp+1,ts,rg,sw))  - nshf(rg) *0.5* E(rg,tp+1,sw)
       =l=            (expnu(rg)**nyper(tp)) * sum(ts,PE(etNUC,tp,ts,rg,sw));


expg(rg,tp+1,sw)$st(tp+1,sw)..
    sum((xlg,ts), PE(xlg,tp+1,ts,rg,sw)) - nshf(rg) * E(rg,tp+1,sw)
       =l=   (expf(rg)**nyper(tp)) * sum((xlg,ts), PE(xlg,tp,ts,rg,sw));

expn(rg,tp+1,xln,sw)$st(tp+1,sw)..
             PN(xln,tp+1,rg,sw)  - nshf(rg) * N(rg,tp+1,sw)
       =l=            (nxpf(rg)**nyper(tp)) * PN(xln,tp,rg,sw);

cpedf(tp+1,sw)$st(tp+1,sw)..
                         CPE(tp+1,sw) =e=
         .5*nyper(tp) *  sum((rg,ts), PE("lbde",tp+1,ts,rg,sw) + PE("lbde",tp,ts,rg,sw))
                      +  CPE(tp,sw);
cpndf(tp+1,sw)$st(tp+1,sw)..
                         CPN(tp+1,sw) =e=
         .5*nyper(tp) *  sum(rg, PN("lbdn",tp+1,rg,sw) + PN("lbdn",tp,rg,sw))
                      +  CPN(tp,sw);
rscav(rg,tp+1,x,sw)$st(tp+1,sw)..
                 URSC(rg,x,tp+1,sw) + .5*nyper(tp) * RA(rg,x,tp+1,sw) =e=
                 URSC(rg,x,tp,sw)    -.5*nyper(tp) * RA(rg,x,tp,  sw);
rscuraav(rg,tp+1,ura,sw)$st(tp+1,sw)..
                URSCURA(rg,ura,tp+1,sw) + 0.5*nyper(tp)*RAURA(rg,ura,tp+1,sw) =e=           
                URSCURA(rg,ura,tp,sw) - 0.5*nyper(tp)*RAURA(rg,ura,tp,sw);


rsvav(rg,tp+1,x,sw)$st(tp+1,sw)..
   PRSV(rg,x,tp+1,sw) - .5*nyper(tp) * (RA(rg,x,tp+1,sw) - PN(x,tp+1,rg,sw)) =e=
   PRSV(rg,x,tp,sw)   + .5*nyper(tp) * (RA(rg,x,tp,sw) -   PN(x,tp,rg,sw));

rsvavura(rg,tp+1,ura,sw)$st(tp+1,sw)..
    PRSVURA(rg,ura,tp+1,sw) - .5*nyper(tp) * (RAURA(rg,ura,tp+1,sw)-PNF(ura,tp+1,rg,sw)) =e=
    PRSVURA(rg,ura,tp,sw) + .5*nyper(tp) * (RAURA(rg,ura,tp,sw)-PNF(ura,tp,rg,sw));

rdflim(rg,pp,x,sw)$st(pp,sw)..
                 RA(rg,x,pp,sw)    =l=
                 rdf(x,rg) * URSC(rg,x,pp,sw);
rdfuralim(rg,pp,ura,sw)$st(pp,sw)..

                RAURA(rg,ura,pp,sw)   =l=
               rdfura(ura,rg)*URSCURA(rg,ura,pp,sw);

prvlim(rg,pp,x,sw)$st(pp,sw)..
                 PN(x,pp,rg,sw)    =l=
                 prv(x,rg) * PRSV(rg,x,pp,sw);
prvuralim(rg,pp,ura,sw)$st(pp,sw)..
                PNF(ura,pp,rg,sw)    =l=
                prvura(ura,rg) * PRSVURA(rg,ura,pp,sw);

rsvPu(tp+1,rg,sw)$st(tp+1,sw)..
        Pu(tp+1,rg,sw) - 0.5*nyper(tp)*(0.01*W(tp+1,rg,sw)-0.09*((10**3)/500)*MOX(tp+1,rg,sw))
        =e= Pu(tp,rg,sw) + 0.5*nyper(tp)*(0.01*W(tp,rg,sw)-0.09*((10**3)/500)*MOX(tp,rg,sw));  
    
rsvRepU(tp+1,rg,sw)$st(tp+1,sw)..
        RepU(tp+1,rg,sw) - 0.5*nyper(tp)*(0.94*W(tp+1,rg,sw))     
        =e= RepU(tp,rg,sw) + 0.5*nyper(tp)*(0.94*W(tp,rg,sw));
    
rsvDU(tp+1,rg,sw)$st(tp+1,sw)..
        DU(tp+1,rg,sw) - 0.5*nyper(tp)*(0.9*sum(ura,PNF(ura,tp+1,rg,sw)) - 0.91*MOX(tp+1,rg,sw))*((10**3)/500)        
        =e= DU(tp,rg,sw) + 0.5*nyper(tp)*(0.9*sum(ura,PNF(ura,tp,rg,sw)) - 0.91*MOX(tp,rg,sw))*((10**3)/500);

        
waste(pp,rg,sw)$st(pp,sw)..
        W(pp,rg,sw) =e=  (htrt("nuc-LWR",pp,rg) * sum(ts,PE("nuc-LWR",pp,ts,rg,sw))
              + htrt("nuc-SMR",pp,rg) * sum(ts,PE("nuc-SMR",pp,ts,rg,sw))
              + htrt("nuc-VHTR",pp,rg) * sum(ts,PE("nuc-VHTR",pp,ts,rg,sw))          
              + htrt("nuc-SFR",pp,rg) * sum(ts,PE("nuc-SFR",pp,ts,rg,sw)))*(10**3)/500 ;

rsvFP(pp,rg,sw)$st(pp,sw)..
        FP(pp,rg,sw) =e= 0.035*W(pp,rg,sw) ;
        
expMOX(tp+1,rg,sw)$st(tp+1,sw)..
                 MOX(tp+1,rg,sw)  - nshf(rg) * sum(urac,PNF(urac,tp+1,rg,sw))
       =l=            (expnu(rg)**nyper(tp)) * sum(urac,PNF(urac,tp,rg,sw));
