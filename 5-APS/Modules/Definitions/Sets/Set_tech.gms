
*================================== DATA ======================================*

* -------------------- Set definitions ------------------------*

* ------------------------------------------------------------------------------*
*  This section of the code contains the set definitions
*  (M5.SET + TP.SET + CLIMATE.TAB + FOREST.TAB).
*
*  This GAMS model is designed so that the time intervals may be of unequal
*  length.
* ------------------------------------------------------------------------------*


SETS



    at           All technologies
                 /hydro, nuc-LWR, nuc-SMR, nuc-VHTR, nuc-SFR, oil-r, gas-r, gas-n, gas-a,
                  coal-r, coal-n, coal-a, igcc,
                  adv-lc,adv-hc, lbde, SolarPV,CSP,windon,windoff, Storage,

                  gas-1, gas-2, gas-3, gas-4, gas-5,
                  gas-6, gas-7, gas-8, gas-9, gas-10,
                  gas-11, gas-12,

                  oil-1, oil-2, oil-3, oil-4, oil-5,
                  oil-6, oil-7, oil-8, oil-9, oil-10,
                  oil-11,oil-12,oil-13,
                  
                  coal-1,coal-2,coal-3,coal-4,coal-5,
                  
                  rnew, synf, cldu, neb-hc, neb-lc, lbdn, load,H2
                  ,electrolysis,coal-h2,gas-h2,gas-h2-CCS,coal-h2-CCS/
    ura          ura resources
                 /ura-1, ura-2, ura-3, ura-4/

    et(at)       Electricity technologies
                 /hydro, nuc-LWR, nuc-SMR, nuc-VHTR, nuc-SFR, oil-r, gas-r, gas-n, gas-a,
                  coal-r, coal-n, coal-a, igcc,
                  adv-lc,adv-hc, lbde, SolarPV, CSP,windon,windoff, Storage, load/
                  
    nonvre(et)   non-VRE Electricity technologies
                 /hydro, nuc-LWR, nuc-SMR, nuc-VHTR, nuc-SFR, oil-r, gas-r, gas-n, gas-a,
                  coal-r, coal-n, coal-a, igcc,
                  adv-lc,adv-hc, lbde,Storage,CSP/
                  
    vre(et)      VRE Electricity technologies
                /SolarPV,windon, windoff/
            
    etsolar(et)  Solar Electricity technologies
                  /SolarPV, CSP/
                  
    etWind(et)   Wind Electricity technologies
                  /windon,windoff/
                  
    etwindoff(et)     Wind offshore Electricity technologies
                 /windoff/
                  
    etwindon(et)     Wind onshore Electricity technologies
                 /windon/
                 
    etPV(et)     PV Electricity technology
                 /SolarPV/
    
    etCSP(et)    CSP Electricity technologies
                 /CSP/
                 

    etNUC(et)   Nuc Electricity technologies
                /nuc-LWR, nuc-SMR, nuc-VHTR, nuc-SFR/

    nt(at)       Nonelectric energy supply technologies

                 /gas-1, gas-2, gas-3, gas-4, gas-5,
                  gas-6, gas-7, gas-8, gas-9, gas-10,
                  gas-11, gas-12,

                  oil-1, oil-2, oil-3, oil-4, oil-5,
                  oil-6, oil-7, oil-8, oil-9, oil-10,
                  oil-11,oil-12,oil-13,
                  
                  coal-1,coal-2,coal-3,coal-4,coal-5,

                  rnew, synf, cldu,
                  neb-hc, neb-lc, lbdn,H2/
                  

    ht(at)       hydrogen energy supply technologies
                /electrolysis,coal-h2,gas-h2,gas-h2-CCS,coal-h2-CCS/

    dle(et)       Electricity technologies subject to decline limits
                 /gas-n, gas-a, coal-n, coal-a, igcc, lbde,nuc-LWR, nuc-SMR, nuc-VHTR, nuc-SFR,SolarPV,CSP, windon, windoff/

    dln(nt)      Nonelectric technologies subject to decline limits
                 /synf, cldu, neb-hc, neb-lc, lbdn,H2/

    xle(et)      Electricity technologies subject to expansion limits
                 /lbde, adv-lc,adv-hc, gas-a, coal-a, SolarPV,CSP,windon,gas-n,windoff/

    xlg(et)      Gas-fired electricity technologies subject to expansion limits
                  /gas-r, gas-n/

    xln(nt)      Nonelectric technologies subject to expansion limits
                 /rnew, synf, lbdn, neb-lc,H2/

    x(nt)        Exhaustible fossil fuel resources
                 /gas-1, gas-2, gas-3, gas-4, gas-5,
                  gas-6, gas-7, gas-8, gas-9, gas-10,
                  gas-11, gas-12,

                  oil-1, oil-2, oil-3, oil-4, oil-5,
                  oil-6, oil-7, oil-8, oil-9, oil-10,
                  oil-11,oil-12,oil-13,
                  
                  coal-1,coal-2,coal-3,coal-4,coal-5

                  /                  
    etpeak(et)     Peak Electricity generating technologies 
                 /gas-r,gas-a,gas-n,Hydro,
                  coal-n, coal-a, igcc,
                  Storage,CSP,nuc-SMR/
                  
    etnonpeak(et)  non-Peak Electricity generating technologies 
                 /hydro, nuc-LWR, nuc-SMR, nuc-VHTR, nuc-SFR, oil-r, gas-r, gas-n, gas-a,
                  coal-r, coal-n, coal-a, igcc,
                  adv-lc,adv-hc, lbde, SolarPV,CSP, windon, Storage, windoff/

    oilc(nt)     Oil cost categories
                 /oil-1, oil-2, oil-3, oil-4, oil-5,
                  oil-6, oil-7, oil-8, oil-9, oil-10
                  ,oil-11, oil-12, oil-13/

    gasc(nt)     Gas cost categories
                 /gas-1, gas-2, gas-3, gas-4, gas-5,
                  gas-6, gas-7, gas-8, gas-9, gas-10
                  ,gas-11, gas-12/
                  
    coalc(nt)     coal cost categories
                 /coal-1,coal-2,coal-3,coal-4,coal-5/
                 
    urac(ura)   ura cost categories
                /ura-1, ura-2, ura-3, ura-4/
                
    cycstp      Supply steps
                /conv, SWU, fuelfabUOX, SNFCaP, SNFRep, DUDeconv, DUST, SUOXCaP, UOXSEP, MOXFAB, RPS, RepUDisp, FPCaP, FPRep/    
    
    sc           scenario
                /APS/

    trd          Tradeable goods
                 /nmr, oil, gas, crt, eis,H2,ura/
;

SET ITER2 /1*3/;