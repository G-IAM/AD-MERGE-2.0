*------------------------------ REPORT.GMS -----------------------------*

*  This section of the code contains the model output calculations and
*  display statements.

SET
     nr          Nonelectric energy supply technologies - for reporting
                 /cldu, synf, rnew, neb-hc, neb-lc, lbdn, oilnon, gasnon, H2/

     tmp         Values in temperature report
                 /rad, ptr, atr, ati/
;
PARAMETERS
    VALUESUM(sw,*,tp,rr)   SUMMARY REPORT
    FOSSPROD(sw,*,tp,*)    FOSSIL FUEL PRODUCTION - EXAJOULES
    FOSSAV(*,*)            FOSSIL FUEL RESOURCES AVAILABLE - EXAJOULES

    PREMIT(sw,tp,ghg)    PRICE OF GREENHOUSE GASES - $ PER TON
    PREMITO(sw,tp,ghg)   PRICE OF OTHER GREENHOUSE GASES - RELATIVE TO CARBON

    PRELEC(SW,RG,TP)     SUPPLY PRICE OF ELECTRICITY -  MILLS PER KWH
    MAC(SW,RG,TP)      MARGINAL ABATEMENT COST - $ PER TON
    PRNON(SW,RG,TP)      SUPPLY PRICE OF NONELECTRIC - $ PER BBL
    PRGAS(SW,RG,TP)      SUPPLY PRICE OF GAS - $ PER GJ

    TOTCARB(*,TP,SW)     TOTAL CARBON EMISSIONS - BILLION TONS
    STOCK(SW,TP,GHG)     STOCK OF GREENHOUSE GASES - BILLION TONS
    CH4CON(SW,TP)        METHANE CONCENTRATIONS
    N2OCON(SW,TP)        N2O CONCENTRATIONS

    RF(SW,TP,*)          RADIATIVE FORCING FOR EACH GREENHOUSE GAS  - FROM 2000 - EXCLUDES COOLING FROM SULFUR
    GDPCH(SW,RG)         GDP CHANGE (ANNUAL) WITHIN A PERIOD
    IGDP(SW,YR,RG)       GDP FOR EACH YEAR

    FVX(sw,rg,tp,*)      FUTURE VALUE OF NET EXPORTS - TRILLION DOLLARS
    PVNTX(sw,tp,rg)      PRESENT VALUE OF NET EXPORTS

    PVCUMX(RG)           PRESENT VALUE OF CUMULATIVE NET EXPORTS
    PVCUMR(RG)           PV OF CUM NET EXPORTS RELATIVE TO SUM ABS VALUES;
FTPI(SW,TRD,PP)$(ST(PP,SW))
    =  1000*ABS(TRDBAL.M(PP,TRD,SW)/TRDBAL.M(PP,"NMR",SW));
FTPI(SW,"NMR",PP)   =   1000;
FVX(sw,rg,pp,trd)   =   NTX.L(trd,pp,rg,sw) * FTPI(sw,trd,pp);
FVX(sw,rg,pp,trd)   =   FVX(sw,rg,pp,trd)/1000;
FVX(sw,rg,pp,"total") =   SUM(trd, FVX(sw,rg,pp,trd));
FVX(sw,rg,"2015","total")  = 0;
FTPI(SW,"NMR",PP)   =   1.0;
FTPI(SW,TRD,"2015")  = 0;
VALUESUM(SW,RG,TP,"CON") = C.L(RG,TP,SW);
VALUESUM(SW,RG,TP,"INVD") = I.L(RG,TP,SW);
VALUESUM(SW,RG,TP,"INVF") = SUM(trd, FVX(sw,rg,tp,trd));
VALUESUM(SW,RG,TP,"GDP") = C.L(RG,TP,SW) + I.L(RG,TP,SW)
                                         + SUM(trd, FVX(sw,rg,tp,trd));
VALUESUM(SW,RG,TP,"ELEC") = E.L(RG,TP,SW);
VALUESUM(SW,RG,TP,"NELEC") = N.L(RG,TP,SW)
                                + PN.L("SYNF",TP,RG,SW)*SYNTPE;

VALUESUM(SW,RG,TP,"TPE") =  SUM((ET,TS), PE.L(ET,TP,TS,RG,SW) * HTRT(ET,tp,RG))
                                +  N.L(RG,TP,SW)
                                + PN.L("SYNF",TP,RG,SW)*SYNTPE;

VALUESUM(SW,"world",TP,RR) = SUM(RG, VALUESUM(SW,RG,TP,RR));

VALUESUM(SW,"world",PP,"INVF") =       0;

FOSSPROD(sw,rg,tp,"gas")  =   sum(gasc, PN.L(gasc,tp,rg,sw));
FOSSPROD(sw,rg,tp,"oil ") =   sum(oilc, PN.L(oilc,tp,rg,sw));
FOSSPROD(sw,rg,tp,"coal") =   sum(coalc, PN.L(coalc,tp,rg,sw));

FOSSPROD(sw,"world",tp,"gas ") =   sum(rg, FOSSPROD(sw,rg,tp,"gas "));
FOSSPROD(sw,"world",tp,"oil ") =   sum(rg, FOSSPROD(sw,rg,tp,"oil "));
FOSSPROD(sw,"world",tp,"coal") =   sum(rg, FOSSPROD(sw,rg,tp,"coal"));

FOSSAV("gas", rg)  =  RSV("gas-1",rg)
                   +  SUM(x, RSC(x,rg) $ gasc(x));

FOSSAV("oil", rg)  =  RSV("oil-1",rg)
                   +  SUM(x, RSC(x,rg) $ oilc(x));

FOSSAV("coal",rg)  =  RSV("coal-1 ",rg)
                  +   SUM(x, RSC(x,rg) $ coalc(x));

FOSSAV("gas ","world") =  sum(rg, FOSSAV("gas ",rg));
FOSSAV("oil ","world") =  sum(rg, FOSSAV("oil ",rg));
FOSSAV("coal","world") =  sum(rg, FOSSAV("coal",rg));

PRELEC(SW,RG,PP)$((CC.M(RG,PP,SW) LE -1E-9) AND (ST(PP,SW)))  =
                     1000*SUPELEC.M(RG,PP,SW)/CC.M(RG,PP,SW);
PRNON(SW,RG,PP)$((CC.M(RG,PP,SW) LE -1E-9) AND (ST(PP,SW)))    =
                     1000*6.0*SUPNON.M(RG,PP,SW)/CC.M(RG,PP,SW);

PRGAS(SW,RG,PP)$((CC.M(RG,PP,SW) LE -1E-9) AND (ST(PP,SW)))    =
                     1000*SUPGAS.M(RG,PP,SW)/CC.M(RG,PP,SW);

MAC(SW,RG,PP)$((CC.M(RG,PP,SW) LE -1E-9) AND (ST(PP,SW)))    =
                     1000*carlev.M(RG,PP,SW)/CC.M(RG,PP,SW);

PRELEC(SW,RG,PP)    =  MAX( PRELEC(SW,RG,PP), 0);
PRNON(SW,RG,PP)     =  MAX( PRNON(SW,RG,PP),  0);
PRGAS(SW,RG,PP)     =  MAX( PRGAS(SW,RG,PP),  0);

TOTCARB(RG,TP,SW)      = CLEV.L(TP,RG,SW);
TOTCARB(RG,"2020",SW)       = CARLIM("sw1","2020",rg);
TOTCARB("TOTAL",TP,SW) = SUM(RG, TOTCARB(RG,TP,SW));

RF(SW,PP,"CO2") = RFFAC("CO2") * LOG(S.L("CO2",PP,SW)/BASESTOCK("CO2"));

RF(SW,PP,GHG) $ (ORD(GHG) GT 1) = INTER(GHG) * RFFAC(GHG)* (
                                 (SM(GHG)*S.L(GHG,PP,SW))**RFEX
                               - (SM(GHG)*BASESTOCK(GHG))**RFEX  );

RF(SW,PP,GHG) $ (ORD(GHG) GT 3) =
                              rffac(ghg) * (S.L(ghg,pp,sw) - basestock(ghg));

RF(SW,PP,"TOTAL") = SUM(GHG, RF(SW,PP,GHG));

Display "WATTS PER SQUARE METER"
DISPLAY RF;

RF(SW,PP,GHG)     = 100*RF(SW,PP,GHG)/RF(SW,PP,"TOTAL");
RF(SW,PP,"TOTAL") = 0;

PVNTX(SW,PP,RG)$(ST(PP,SW))  =  SUM(TRD, PVPI(TRD,PP,SW)*NTX.L(TRD,PP,RG,SW));
PVCUMX(RG)                   =  SUM((PP,SW)$(ST(PP,SW)), PVNTX(SW,PP,RG));
PVCUMR(RG)  = PVCUMX(RG) / SUM((PP,SW)$(ST(PP,SW)), ABS(PVNTX(SW,PP,RG)));

STOCK(SW,TP,GHG)   = S.L(GHG,TP,SW);
STOCK(SW,TP,"CO2") = STOCK(SW,TP,"CO2")*CONLIM("2015",SW)/BASESTOCK("CO2");

PARAMETERS
    RLZGDP(tp,*)         REALIZED GDP - TRILLION DOLLARS
    RPTGDP(tp,*)         REALIZED TO POTENTIAL GDP - PERCENT
    TPEGDP(tp,*)         ENERGY-GDP RATIO - EXAJOULES PER TRILLION DOLLARS
    CARGDP(tp,*)         CARBON PER UNIT OF GDP - GRAMS PER DOLLAR
    
    SelectedPEL(sw,*,tp,*) SELECTED TECHNOLOGIES FOR ELECTRIC ENERGY - TWH
    WSelectedPEL(sw,tp,*) WORLD SELECTED TECHNOLOGIES FOR ELECTRIC ENERGY - TKWH
    CANSelectedPEL(sw,tp,*) CANADA SELECTED TECHNOLOGIES FOR ELECTRIC ENERGY - TWH
    PEL(sw,*,tp,et)      PRODUCTION OF ELECTRIC ENERGY - TKWH
    PELPEAK(sw,*,tp,et)  PRODUCTION OF ELECTRIC ENERGY at PEAK- TKWH
    PELnonPEAK(sw,*,tp,et) PRODUCTION OF ELECTRIC ENERGY at non PEAK- TKWH
    PEPCT(sw,*,tp,et)    PERCENTAGE OF TOTAL ELECTRIC ENERGY

    PNL(sw,*,tp,nr)      PRODUCTION OF NONELECTRIC ENERGY - EXAJ
    PHL(sw,*,tp,ht)      PRODUCTION OF Hydrogen ENERGY - PJ
    WPHL(sw,tp,ht)       WORLD PRODUCTION OF Hydrogen ENERGY - EXAJ
    CANPHL(sw,tp,ht)     CANADA PRODUCTION OF Hydrogen ENERGY - PJ
    PNPCT(sw,*,tp,nr)    PERCENTAGE OF TOTAL NONELECTRIC ENERGY
    

    FEU(sw,*,tp,*)       FINAL ENERGY USE - PJ
    WFEU(sw,tp,*)        WORLD FINAL ENERGY USE - EXAJ

    NETX(sw,rg,tp,trd)   NET EXPORTS

    SDEIS(sw,tp,rg)      RATIO OF DOMESTIC EIS SUPPLY TO DEMAND
    XABATE(sw,ghg,tp,*)  GREENHOUSE GAS ABATEMENT - BILLION TCE
    XAFF(sw,sy,ps)       AFFORESTATION PROGRAM - FRACTION ADOPTED
    XSINKS(tp,sw)        GLOBAL TOTAL CO2 ABATEMENT - BILLION TONS

    XTOTCARB(sw,tp,*)    TOTAL CARBON EMISSIONS - BILLION TONS
    XRATCARB(SW,TP,*)    RATIO OF CARBON EMISSIONS - IEO 2003 TO MERGE PROJECTIONS

    ELCARB(SW,TP,*)      ELECTRICITY SECTOR - CARBON EMISSIONS - BILLION TONS

    XEM(sw,tp,ghg)       world energy-related emissions - billion tons
    XEM2(sw,tp,ghg)      world energy-related emissions - billion tons CO2


    XTOTEM(sw,tp,ghg)    total world emissions (energy and non-energy less abatement)

    RAD(tp,sw)           RADIATIVE FORCING - WATTS PER SQ M - INCREASE FROM 1750
    PTR(tp,sw)           POTENTIAL GLOBAL TEMPERATURE VALUES - INCREASE FROM 1750
    ATR(tp,sw)           ACTUAL GLOBAL TEMPERATURE VALUES - INCREASE FROM 2000
    ATI(tp,sw)           ACTUAL GLOBAL TEMPERATURE INCREASE -BY PERIOD
    TEMP(sw,tp,tmp)      TEMPERATURE REPORT

    RGD(sw,tp,*)        REPORT ON GD
    RND(sw,tp,*)        REPORT ON Net Damages
    RMD(sw,tp,rg)       REPORT ON MD 
    RELF(sw,tp,rg)       REPORT ON ELF
    
    ECUMI(RG,TP)           unit Mitigation Cost - $ per EJ
    ECT(RG,TP)           Energy Cost 
    ECGDP(RG,TP)         Energy Cost per GDP
    

;
ECUMI(RG,TP) = (EC.L(rg,tp,"sw1"))/VALUESUM("sw1",rg,tp,"tpe");
ECT(RG,TP) = (EC.L(rg,tp,"sw1"));
ECGDP(RG,TP) = (EC.L(rg,tp,"sw1"))/VALUESUM("sw1",rg,tp,"gdp");

RLZGDP(tp,rg)           =  VALUESUM("sw1",rg,tp,"gdp");
RLZGDP(tp, "world")     =  SUM(rg, VALUESUM("sw1",rg,tp,"gdp"));

RPTGDP(tp,rg)          =   100 * VALUESUM("sw1",rg,tp,"gdp")/POTGDP(tp,rg);
RPTGDP(tp,"world")     =   100 * SUM(rg, VALUESUM("sw1",rg,tp,"gdp"))/
                                                      POTGDP(tp,"world");

TPEGDP(tp,rg)           =  VALUESUM("sw1",rg,tp,"tpe")/
                           VALUESUM("sw1",rg,tp,"gdp");

TPEGDP(tp,"world")      =  SUM(rg, VALUESUM("sw1",rg,tp,"tpe"))/
                           SUM(rg, VALUESUM("sw1",rg,tp,"gdp"));

CARGDP(tp,rg)           =  1000*        TOTCARB(rg,tp,"sw1")/
                                        VALUESUM("sw1",rg,tp,"gdp");

CARGDP(tp,"world")      =  1000*SUM(rg, TOTCARB(rg,tp,"sw1"))/
                           SUM(rg,      VALUESUM("sw1",rg,tp,"gdp"));

PEL(sw,rg,tp,et)        =  sum(ts,PE.L(et,tp,ts,rg,sw))
;

PELPEAK(sw,rg,tp,et)    = PE.L(et,tp,"peak",rg,sw);


PELnonPEAK(sw,rg,tp,et)    = PE.L(et,tp,"nonpeak",rg,sw);

PEL(sw,"world",tp,et)   =  SUM ((rg,ts), PE.L(et,tp,ts,rg,sw));
PELPEAK(sw,"world",tp,et)   =  SUM ((rg), PE.L(et,tp,"peak",rg,sw));
PELnonPEAK(sw,"world",tp,et)    = SUM ((rg),PE.L(et,tp,"nonpeak",rg,sw));

SelectedPEL(sw,rg,tp,"Coal-CCS")=  (sum(ts,PE.L("coal-a",tp,ts,rg,sw))+sum(ts,PE.L("IGCC",tp,ts,rg,sw)))*1000+0.00000001;
SelectedPEL(sw,rg,tp,"Coal")=  (sum(ts,PE.L("coal-r",tp,ts,rg,sw))+sum(ts,PE.L("coal-n",tp,ts,rg,sw)))*1000+0.00000001;

SelectedPEL(sw,rg,tp,"Gas-CCS")=  (sum(ts,PE.L("gas-a",tp,ts,rg,sw)))*1000+0.00000001;
SelectedPEL(sw,rg,tp,"Gas")=  (sum(ts,PE.L("gas-r",tp,ts,rg,sw))+sum(ts,PE.L("gas-n",tp,ts,rg,sw)))*1000+0.00000001;

SelectedPEL(sw,rg,tp,"Oil")=  (sum(ts,PE.L("Oil-r",tp,ts,rg,sw)))*1000+0.00000001;

SelectedPEL(sw,rg,tp,"Wind")=  sum((ts,etwind),PE.L(etwind,tp,ts,rg,sw))*1000+0.00000001;
SelectedPEL(sw,rg,tp,"Solar")=  sum((ts,etsolar),PE.L(etsolar,tp,ts,rg,sw))*1000+0.00000001;

SelectedPEL(sw,rg,tp,"Storage")=  (sum(ts,PE.L("Storage",tp,ts,rg,sw))+PE.L("Hydro",tp,"peak",rg,sw))*1000+0.00000001;

SelectedPEL(sw,rg,tp,"Hydro")=  (sum(ts,PE.L("Hydro",tp,ts,rg,sw)))*1000+0.00000001;

SelectedPEL(sw,rg,tp,"Nuclear")=  sum(ts,PE.L("nuc-LWR",tp,ts,rg,sw))*1000+0.00000001;

SelectedPEL(sw,rg,tp,"Biomass")=  (sum(ts,PE.L("adv-lc",tp,ts,rg,sw))+sum(ts,PE.L("adv-hc",tp,ts,rg,sw)))*1000+0.00000001;

SelectedPEL(sw,"world",tp,"Oil")=sum(rg,SelectedPEL(sw,rg,tp,"Oil"))/1000+0.00000001;;
SelectedPEL(sw,"world",tp,"Coal-CCS")=sum(rg,SelectedPEL(sw,rg,tp,"Coal-CCS"))/1000+0.00000001;;
SelectedPEL(sw,"world",tp,"Coal")=sum(rg,SelectedPEL(sw,rg,tp,"Coal"))/1000+0.00000001;;
SelectedPEL(sw,"world",tp,"Gas-CCS")=sum(rg,SelectedPEL(sw,rg,tp,"Gas-CCS"))/1000+0.00000001;
SelectedPEL(sw,"world",tp,"Gas")=sum(rg,SelectedPEL(sw,rg,tp,"Gas"))/1000+0.00000001;
SelectedPEL(sw,"world",tp,"Wind")=sum(rg,SelectedPEL(sw,rg,tp,"Wind"))/1000+0.00000001;
SelectedPEL(sw,"world",tp,"Solar")=sum(rg,SelectedPEL(sw,rg,tp,"Solar"))/1000+0.00000001;
SelectedPEL(sw,"world",tp,"Storage")=sum(rg,SelectedPEL(sw,rg,tp,"Storage"))/1000+0.00000001;
SelectedPEL(sw,"world",tp,"Hydro")=sum(rg,SelectedPEL(sw,rg,tp,"Hydro"))/1000+0.00000001;
SelectedPEL(sw,"world",tp,"Nuclear")=sum(rg,SelectedPEL(sw,rg,tp,"Nuclear"))/1000+0.00000001;
SelectedPEL(sw,"world",tp,"Biomass")=sum(rg,SelectedPEL(sw,rg,tp,"Biomass"))/1000+0.00000001;

WSelectedPEL(sw,tp,"Oil") = SelectedPEL(SW,"world",TP,"Oil") + 0.000000001;
WSelectedPEL(sw,tp,"Coal-CCS") = SelectedPEL(SW,"world",TP,"Coal-CCS") + 0.000000001;
WSelectedPEL(sw,tp,"Coal")= SelectedPEL(SW,"world",TP,"Coal") + 0.000000001;
WSelectedPEL(sw,tp,"Gas-CCS")= SelectedPEL(SW,"world",TP,"Gas-CCS") + 0.000000001;
WSelectedPEL(sw,tp,"Gas")= SelectedPEL(SW,"world",TP,"Gas") + 0.000000001;
WSelectedPEL(sw,tp,"Wind")= SelectedPEL(SW,"world",TP,"Wind") + 0.000000001;
WSelectedPEL(sw,tp,"Solar") = SelectedPEL(SW,"world",TP,"Solar") + 0.000000001;
WSelectedPEL(sw,tp,"Storage")= SelectedPEL(SW,"world",TP,"Storage") + 0.000000001;
WSelectedPEL(sw,tp,"Hydro") = SelectedPEL(SW,"world",TP,"Hydro") + 0.000000001;
WSelectedPEL(sw,tp,"Nuclear") = SelectedPEL(SW,"world",TP,"Nuclear") + 0.000000001;
WSelectedPEL(sw,tp,"Biomass") = SelectedPEL(SW,"world",TP,"Biomass") + 0.000000001;
                
CANSelectedPEL(sw,tp,"Oil") = SelectedPEL(SW,"CAN",TP,"Oil")*1000 + 0.000000001;
CANSelectedPEL(sw,tp,"Coal-CCS") = SelectedPEL(SW,"CAN",TP,"Coal-CCS")*1000  + 0.000000001;
CANSelectedPEL(sw,tp,"Coal")= SelectedPEL(SW,"CAN",TP,"Coal")*1000  + 0.000000001;
CANSelectedPEL(sw,tp,"Gas-CCS")= SelectedPEL(SW,"CAN",TP,"Gas-CCS")*1000  + 0.000000001;
CANSelectedPEL(sw,tp,"Gas")= SelectedPEL(SW,"CAN",TP,"Gas")*1000  + 0.000000001;
CANSelectedPEL(sw,tp,"Wind")= SelectedPEL(SW,"CAN",TP,"Wind")*1000  + 0.000000001;
CANSelectedPEL(sw,tp,"Solar") = SelectedPEL(SW,"CAN",TP,"Solar")*1000  + 0.000000001;
CANSelectedPEL(sw,tp,"Storage")= SelectedPEL(SW,"CAN",TP,"Storage")*1000  + 0.000000001;
CANSelectedPEL(sw,tp,"Hydro") = SelectedPEL(SW,"CAN",TP,"Hydro")*1000  + 0.000000001;
CANSelectedPEL(sw,tp,"Nuclear") = SelectedPEL(SW,"CAN",TP,"Nuclear")*1000  + 0.000000001;
CANSelectedPEL(sw,tp,"Biomass") = SelectedPEL(SW,"CAN",TP,"Biomass")*1000  + 0.000000001;
FEU(sw,rg,tp,"Coal")       =       PN.L("cldu",  tp,rg,sw)*1000 +0.00000001;
FEU(sw,rg,tp,"Synthetic Fuel")  =  PN.L("synf",  tp,rg,sw)*1000 +0.00000001;
FEU(sw,rg,tp,"Bioenergy")       =  PN.L("rnew",  tp,rg,sw)*1000+PN.L("neb-hc",tp,rg,sw)*1000+0.00000001 ;
FEU(sw,rg,tp,"lbdn")       =       PN.L("lbdn",  tp,rg,sw)*1000 +0.00000001;
FEU(sw,rg,tp,"Oil Products")    =  OILNON.L(tp,rg,sw)*1000      +0.00000001;
FEU(sw,rg,tp,"Gas")     =          GASNON.L(tp,rg,sw)*1000      +0.00000001;
FEU(sw,rg,tp,"Hydrogen")     =     PN.L("H2",  tp,rg,sw)*1000   +0.00000001;
FEU(sw,rg,tp,"Electricity")     =  VALUESUM("sw1",rg,tp,"ELEC")*3.6*1000+0.00000001 ;
FEU(sw,"WORLD",tp,"coal")          =   sum(rg,FEU(sw,rg,tp,"Coal"))+ 0.000000001 ;
FEU(sw,"WORLD",tp,"Synthetic Fuel")=   sum(rg,FEU(sw,rg,tp,"Synthetic Fuel")) + 0.000000001;
FEU(sw,"WORLD",tp,"Bioenergy")       = sum(rg,FEU(sw,rg,tp,"Bioenergy"))+ 0.000000001;
FEU(sw,"WORLD",tp,"neb-hc")        =   sum(rg,FEU(sw,rg,tp,"neb-hc")) ;
FEU(sw,"WORLD",tp,"neb-lc")        =   sum(rg,FEU(sw,rg,tp,"neb-lc")) ;
FEU(sw,"WORLD",tp,"lbdn")          =   sum(rg,FEU(sw,rg,tp,"lbdn"))   ;
FEU(sw,"WORLD",tp,"Oil Products")  =   sum(rg,FEU(sw,rg,tp,"Oil Products"))+ 0.000000001 ;
FEU(sw,"WORLD",tp,"Gas")           =   sum(rg,FEU(sw,rg,tp,"Gas"))+ 0.000000001 ;
FEU(sw,"WORLD",tp,"Hydrogen")      =   sum(rg,FEU(sw,rg,tp,"Hydrogen"))+ 0.000000001 ;
FEU(sw,"WORLD",tp,"Electricity")   =   sum(rg,FEU(sw,rg,tp,"Electricity")) + 0.000000001;


WFEU(sw,tp,"Electricity")   =FEU(sw,"WORLD",tp,"Electricity")/1000+ 0.000000001   ;
WFEU(sw,tp,"coal")          =FEU(sw,"WORLD",tp,"coal")/1000 + 0.000000001         ;
WFEU(sw,tp,"Synthetic Fuel")=FEU(sw,"WORLD",tp,"Synthetic Fuel")/1000;
WFEU(sw,tp,"Bioenergy")       =FEU(sw,"WORLD",tp,"Bioenergy")/1000  + 0.000000001     ;
WFEU(sw,tp,"neb-hc")        =FEU(sw,"WORLD",tp,"neb-hc") /1000       ;
WFEU(sw,tp,"neb-lc")        =FEU(sw,"WORLD",tp,"neb-lc") /1000       ;
WFEU(sw,tp,"lbdn")          =FEU(sw,"WORLD",tp,"lbdn")   /1000       ;
WFEU(sw,tp,"Oil Products")  =FEU(sw,"WORLD",tp,"Oil Products")/1000+ 0.000000001  ;
WFEU(sw,tp,"Gas")           =FEU(sw,"WORLD",tp,"Gas") /1000+ 0.000000001          ;
WFEU(sw,tp,"Hydrogen")      =FEU(sw,"WORLD",tp,"Hydrogen") /1000+ 0.000000001     ;
PEPCT(sw,rg,tp,et)      =  100*PEL(sw,rg,tp,et) /E.L(rg,tp,sw);
PEPCT(sw,"world",tp,et) =  100*PEL(sw,"world",tp,et)/
                                        VALUESUM(sw,"world",tp,"elec");
PEPCT(sw,rg,tp,et)      = PEPCT(sw,rg,tp,et)$ (PEPCT(sw,rg,tp,et) ge .1);
PEPCT(sw,"world",tp,et) = PEPCT(sw,"world",tp,et)$ (PEPCT(sw,"world",tp,et) ge .1);
PNL(sw,rg,tp,"cldu")       =  PN.L("cldu",  tp,rg,sw) $ (PN.L("cldu",  tp,rg,sw) GE .1);
PNL(sw,rg,tp,"synf")       =  PN.L("synf",  tp,rg,sw) $ (PN.L("synf",  tp,rg,sw) GE .1);
PNL(sw,rg,tp,"rnew")       =  PN.L("rnew",  tp,rg,sw) $ (PN.L("rnew",  tp,rg,sw) GE .1);
PNL(sw,rg,tp,"neb-hc")     =  PN.L("neb-hc",tp,rg,sw) $ (PN.L("neb-hc",tp,rg,sw) GE .1);
PNL(sw,rg,tp,"neb-lc")     =  PN.L("neb-lc",tp,rg,sw) $ (PN.L("neb-lc",tp,rg,sw) GE .1);
PNL(sw,rg,tp,"lbdn")       =  PN.L("lbdn",  tp,rg,sw) $ (PN.L("lbdn",  tp,rg,sw) GE .1);
PNL(sw,rg,tp,"oilnon")     =  OILNON.L(tp,rg,sw)      $ (OILNON.L(tp,rg,sw)      GE .1);
PNL(sw,rg,tp,"gasnon")     =  GASNON.L(tp,rg,sw)      $ (GASNON.L(tp,rg,sw)      GE .1);
PNL(sw,rg,tp,"H2")         =  PN.L("H2",  tp,rg,sw)   $ (PN.L("H2",  tp,rg,sw) GE .1);
PNL(sw,"world",tp,nr)        =  SUM (rg, PNL(sw,rg,tp,nr));
PNPCT(sw,rg,tp,nr)           =  100*PNL(sw,rg,tp,nr)/N.L(rg,tp,sw);
PNPCT(sw,"world",tp,nr)      =  100 * SUM(rg, PNL(sw,rg,tp,nr))/
                                      SUM(rg, N.L(rg,tp,sw));

PNPCT(sw,rg,tp,nr)      =  PNPCT(sw,rg,tp,nr) $ (PNPCT(sw,rg,tp,nr) ge .1);
PNPCT(sw,"world",tp,nr) =  PNPCT(sw,"world",tp,nr) $ (PNPCT(sw,"world",tp,nr) ge .1);

PHL(sw,rg,tp,"electrolysis")     =  (PH.L("electrolysis",  tp,rg,sw)+3.6*H2curtail(tp,rg,sw)+0.0000001)*1000;
PHL(sw,rg,tp,"coal-h2")          =       (PH.L("coal-h2",  tp,rg,sw) +0.0000001)*1000;
PHL(sw,rg,tp,"gas-h2")           =        (PH.L("gas-h2",  tp,rg,sw) +0.0000001)*1000;
PHL(sw,rg,tp,"gas-h2-CCS")       =    (PH.L("gas-h2-CCS",  tp,rg,sw) +0.0000001)*1000;
PHL(sw,rg,tp,"coal-h2-CCS")      =   (PH.L("coal-h2-CCS",  tp,rg,sw) +0.0000001)*1000;
WPHL(sw,tp,"electrolysis")     = sum(rg,PHL(sw,rg,tp,"electrolysis"))/1000+0.0000001;     
WPHL(sw,tp,"coal-h2")          = sum(rg,PHL(sw,rg,tp,"coal-h2")/1000)+0.0000001;     
WPHL(sw,tp,"gas-h2")           = sum(rg,PHL(sw,rg,tp,"gas-h2"))/1000+0.0000001;     
WPHL(sw,tp,"gas-h2-CCS")       = sum(rg,PHL(sw,rg,tp,"gas-h2-CCS"))/1000+0.0000001;     
WPHL(sw,tp,"coal-h2-CCS")      = sum(rg,PHL(sw,rg,tp,"coal-h2-CCS"))/1000+0.0000001;     

CANPHL(sw,tp,"electrolysis")     = PHL(sw,"can",tp,"electrolysis") +0.0000001;     
CANPHL(sw,tp,"coal-h2")          = PHL(sw,"can",tp,"coal-h2") +0.0000001;     
CANPHL(sw,tp,"gas-h2")           = PHL(sw,"can",tp,"gas-h2") +0.0000001;     
CANPHL(sw,tp,"gas-h2-CCS")       = PHL(sw,"can",tp,"gas-h2-CCS") +0.0000001;     
CANPHL(sw,tp,"coal-h2-CCS")      = PHL(sw,"can",tp,"coal-h2-CCS") +0.0000001; 

PHL(sw,"world",tp,ht)        =  SUM (rg, PHL(sw,rg,tp,ht))/1000;


NETX(sw,rg,pp,trd)   =       NTX.L(trd,pp,rg,sw);
SDEIS(sw,pp,rg)      =       EISS.L(pp,rg,sw) / EISDEMAND(pp,rg);
XABATE(sw,ghg,tp,rg) =       SUM(abx, ABATE.L(ghg,abx,tp,rg,sw));
XABATE(sw,ghg,tp,"world")  = sum (rg, XABATE(sw,ghg,tp,rg));

XSINKS(tp,sw)   =  SUM((sy,ps) , cab(sy,tp,ps) * AFF.L(sy,ps,sw));
XAFF(sw,sy,ps)  =  AFF.L(sy,ps,sw);

XTOTCARB(SW,TP,RG)       = CLEV.L(TP,RG,SW) + 0.000000001;
XTOTCARB("sw1","2020",RG)       = CARLIM("sw1","2020",rg);
XTOTCARB(SW,TP,"total")  = SUM(RG, XTOTCARB(SW,TP,RG));
XTOTCARB(SW,TP,"annexB") = SUM(RG$ anb(RG) ,XTOTCARB(SW,TP,RG));
XTOTCARB(SW,TP,"notanB") = SUM(RG$nanb(RG), XTOTCARB(SW,TP,RG));

XRATCARB(SW,TP,RG) $ CLEV.L(TP,RG,SW)    = CARBIEO(TP,RG)/CLEV.L(TP,RG,SW) ;
XRATCARB(SW,TP,"total") $ SUM(RG, XTOTCARB(SW,TP,RG))  = CARBIEO(TP,"WORLD")/
                                               SUM(RG, XTOTCARB(SW,TP,RG)) ;

ELCARB(sw,tp,rg)         = SUM((et,ts), CECE(et,tp,rg)*PE.L(et,tp,ts,rg,sw));
ELCARB(sw,tp,"total")    = SUM(rg, ELCARB(sw,tp,rg));

XEM(sw,tp,ghg)           =     EM.L(ghg,tp,sw);
XEM(sw,"2020","CO2")           =     sum(rg,CARLIM("sw1","2020",rg));

XEM2(sw,tp,ghg)        =  XEM(sw,tp,ghg)*44/12;
XTOTEM(sw,tp,ghg)        =  TOTEM.L(ghg,tp,sw) + 0.000000001;
XTOTEM(sw,"2020","CO2")        =   sum(rg,CARLIM("sw1","2020",rg))    + nonem("CO2","2020") + 0.000000001;

XTOTEM(sw,tp,ghg) $ (ord(ghg) ge 2) = 1000 * XTOTEM(sw,tp,ghg);

RAD(TP,SW)                 =  PT.L(TP,SW)/(RFCONV(sw));
PTR(TP,SW)                 =  PT.L(TP,SW);
ATR(TP,SW)                 = ATP.L(TP,SW);
ATI(TP+1,SW)               = ATP.L(TP+1,SW) - ATP.L(TP,SW);;
TEMP(sw,tp,"rad")          = RAD(tp,sw);
TEMP(sw,tp,"ptr")          = PTR(tp,sw);
TEMP(sw,tp,"atr")          = ATR(tp,sw);
TEMP(sw,tp,"ati")          = ATI(tp,sw);
RGD(sw,tp,rg)             = (ALPHA(rg)*(ATP.L(tp,sw)+0.9)**ALPHA1(rg)+ ALPHA2(rg)*(ATP.L(tp,sw)+0.9)**ALPHA3(rg))*100;
RND(sw,tp,rg)             = (ALPHA(rg)*(ATP.L(tp,sw)+0.9)**ALPHA1(rg)+ ALPHA2(rg)*(ATP.L(tp,sw)+0.9)**ALPHA3(rg))*100;
RMD(sw,tp,rg)             = RGD(sw,tp,rg)*POTGDP(tp,rg)/100;
RND(sw,tp,"World")=sum(rg,RND(sw,tp,rg)*POTGDP(tp,rg)/100)/POTGDP(tp,"World")*100;
RGD(sw,tp,"World")=sum(rg,RGD(sw,tp,rg)*POTGDP(tp,rg)/100)/POTGDP(tp,"World")*100;

OPTION DECIMALS = 3;

DISPLAY VALUESUM;

OPTION DECIMALS = 1;
DISPLAY RLZGDP, RPTGDP, TPEGDP, CARGDP;

DISPLAY PEL, PELPEAK;
DISPLAY PEPCT;

DISPLAY PNL, PHL;
DISPLAY PNPCT;

$onText
parameters
grorate(sw,*,tp,*)   percentage annual growth rates;

grorate(sw,rg,tp,"lbde")  =  sum(ts,PE.L("lbde",tp+1,ts,rg,sw))/
                             sum(ts,PE.L("lbde",tp,ts,rg,sw))  $ (sum(ts,PE.L("lbde",tp,ts,rg,sw)) ge .001);

grorate(sw,rg,tp,"lbde")  =  (grorate(sw,rg,tp,"lbde")**.1)$ (sum(ts,PE.L("lbde",ts,tp,rg,sw)));
grorate(sw,rg,tp,"lbde")  =  (100 * (grorate(sw,rg,tp,"lbde") - 1)) $ (sum(ts,(PE.L("lbde",tp,ts,rg,sw))) ge .001);

grorate(sw,rg,tp,"lbdn")  =  (PN.L("lbdn",tp+1,rg,sw)/
                             PN.L("lbdn",tp,rg,sw))  $ (sum(ts,(PE.L("lbde",tp,ts,rg,sw))) ge .001);

grorate(sw,rg,tp,"lbdn")  =  (grorate(sw,rg,tp,"lbdn")**.1)$ PN.L("lbdn",tp,rg,sw);
grorate(sw,rg,tp,"lbdn")  =  (100 * (grorate(sw,rg,tp,"lbdn") - 1)) $ (sum(ts,(PE.L("lbde",tp,ts,rg,sw))) ge .001);

grorate(sw,rg,tlast,"lbde") = 0;
grorate(sw,rg,tlast,"lbdn") = 0;

display grorate;

$offText

DISPLAY FOSSPROD, FOSSAV;

parameters

carbfuel(sw,tp,*)  global carbon emissions - by fuel - billion tons
tpefuel (sw,tp,*)  global total primary emissions - by fuel - exajoules;


carbfuel(sw,tp,"gas ")   = FOSSPROD(sw,"world",tp,"gas ") * CECN("gas ",tp,"usa");
carbfuel(sw,tp,"oil ")   = FOSSPROD(sw,"world",tp,"oil ") * CECN("oil ",tp,"usa");
carbfuel(sw,tp,"coal")   = FOSSPROD(sw,"world",tp,"coal") * CECN("cldu",tp,"usa");

carbfuel(sw,tp,"total")  = carbfuel(sw,tp,"gas ")
                         + carbfuel(sw,tp,"oil ")
                         + carbfuel(sw,tp,"coal");

carbfuel(sw,tp,"ratio") $st(tp,sw)
                         =  carbfuel(sw,tp,"total")/ xtotcarb(sw,tp,"total");

tpefuel(sw,tp,"gas  ")   =  fossprod(sw,"world",tp,"gas ");
tpefuel(sw,tp,"oil  ")   =  fossprod(sw,"world",tp,"oil ");
tpefuel(sw,tp,"coal ")   =  fossprod(sw,"world",tp,"coal");
tpefuel(sw,tp,"other")   =  100;
tpefuel(sw,tp,"total")   =  valuesum(sw,"world",tp,"tpe");
tpefuel(sw,tp,"other")   =  tpefuel(sw,tp,"total")
                                             - tpefuel(sw,tp,"gas  ")
                                             - tpefuel(sw,tp,"oil  ")
                                             - tpefuel(sw,tp,"coal ");

option decimals = 3;
display carbfuel, tpefuel;

PARAMETERS
    PNLUSA(tp,nt)     production of nonelectric energy in USA - exaj;

    PNLUSA(tp,nt)  =  PN.L(nt,tp,"usa","sw1")
                    $(PN.L(nt,tp,"usa","sw1") GE .1);

option decimals = 1;
display PNLUSA;

OPTION DECIMALS = 3;

DISPLAY NETX, FVX;

DISPLAY SDEIS;

DISPLAY CRLX.L, XABATE, XAFF, XSINKS;

DISPLAY XTOTCARB, XRATCARB, ELCARB, DC.L;

DISPLAY XEM;

DISPLAY "Carbon is expressed in billions of tons; other gases in million tons.";

OPTION DECIMALS = 6;

DISPLAY XTOTEM;

DISPLAY "Carbon is expressed in ppmv;  other gases in billion tons.";

OPTION DECIMALS = 3;

DISPLAY STOCK;

DISPLAY "PERCENT OF TOTAL RADIATIVE FORCING FROM 2015";

DISPLAY RF, TEMP, RMD;


PRELEC(SW,RG,"2015") = 0;
PRNON(SW,RG, "2015") = 0;
PRGAS(SW,RG, "2015") = 0;

*DISPLAY PREMIT, PREMITO
DISPLAY GWP;

*PREMITO(sw,pp,ghg) = PREMITO(sw,pp,ghg)/GWP(ghg);
*DISPLAY "Efficiency price relative to carbon-equivalent GWP."
*DISPLAY PREMITO;

DISPLAY PRELEC, PRNON, PRGAS, FTPI;
parameters

wcrtpr(tp,sw)     future world price of carbon - dollars per ton
crtpr(sw,tp,rg)   future price of carbon emission rights - dollars per ton;

wcrtpr(pp,sw)$st(pp,sw) =  1000 * wcardf.m(pp,sw)    /trdbal.m(pp,"nmr",sw);
crtpr(sw,pp,rg)$st(pp,sw)
                  = -1000 * clevbd.m(pp,rg,sw)    /trdbal.m(pp,"nmr",sw);

option decimals = 3;

display crtpr;
display wcrtpr, crtpr;

$ontext
$offtext

OPTION DECIMALS = 6;

DISPLAY PVCUMX, PVCUMR, NWTITR;
DISPLAY NWEL.L;

parameters

lrnge(tp,sw)          learning costs - mills per kwh
lrngn(tp,sw)          learning costs - $ per GJ;

lrnge(tp,sw)     =    inlce * (CPE.L(tp,sw) /cpe0 )**lrne;
lrngn(tp,sw)     =    inlcn * (CPN.L(tp,sw) /cpn0 )**lrnn;

display lrnge, lrngn, CPE.L, CPN.L;

display K.L;

OPTION DECIMALS = 6;
display carlim;

parameter WINICH4LIM    World CH4 emissions (billion tons);
WINICH4LIM = sum(rg, INICH4LIM(rg));
display INICH4LIM, WINICH4LIM;

parameter WININ2OLIM    World N2O emissions (billion tons);
WININ2OLIM = sum(rg, ININ2OLIM(rg));
display ININ2OLIM, WININ2OLIM;

parameter WINISLFLIM    World HFC emissions (million tons);
WINISLFLIM = sum(rg, INISLFLIM(rg));
display INISLFLIM, WINISLFLIM;

parameter WINILLFLIM    World SF6 emissions (million tons);
WINILLFLIM = sum(rg, INILLFLIM(rg));
display INILLFLIM, WINILLFLIM;

display CARLIM, OGGLIM;

parameter XGHGLIM(sw,tp,*) Overall GHG limits in billion tce (total value has been corrected);

XGHGLIM(sw,tp,rg)       = carlim(sw,tp,rg) + sum(ogg, ogglim(ogg,tp,rg)*gwp(ogg));
* Total GHG emissions must be corrected for total non energy carbon emissions and afforestation
XGHGLIM(sw,tp,"total")  = SUM(RG, XGHGLIM(sw,tp,rg)) + nonem("co2",tp)
                        - SUM((sy,ps) , cab(sy,tp,ps) * AFF.L(sy,ps,sw)) * co2fac("co2");

PARAMETERS
   XTOTCH4(sw,tp,*)    TOTAL CH4 EMISSIONS - BILLION TONS
   XTOTN2O(sw,tp,*)    TOTAL N2O EMISSIONS - BILLION TONS
   XTOTHFC(sw,tp,*)    TOTAL HFC EMISSIONS - MILLION TONS
   XTOTSF6(sw,tp,*)    TOTAL SF6 EMISSIONS - MILLION TONS
   XTOTGHG(sw,tp,*)    TOTAL GHG EMISSIONS (energy + non-energy - abatement) in BILLION TCE (total value corrected)
   XTOTGHG2(SW,TP)     TOTAL GHG EMISSIONS (energy + non-energy - abatement) in BILLION TCO2E (total value corrected)
   
   ;

XTOTCH4(SW,TP,RG)       = MLEV.L(TP,RG,SW);
XTOTCH4(SW,TP,"total")  = SUM(RG, XTOTCH4(SW,TP,RG));

XTOTN2O(SW,TP,RG)       = OLEV.L("N2O",TP,RG,SW);
XTOTN2O(SW,TP,"total")  = SUM(RG, XTOTN2O(SW,TP,RG));

XTOTHFC(SW,TP,RG)       = 1000 * OLEV.L("slf",TP,RG,SW);
XTOTHFC(SW,TP,"total")  = SUM(RG, XTOTHFC(SW,TP,RG));

XTOTSF6(SW,TP,RG)       = 1000 * OLEV.L("llf",TP,RG,SW);
XTOTSF6(SW,TP,"total")  = SUM(RG, XTOTSF6(SW,TP,RG));

XTOTGHG(SW,"2015",RG)   = XTOTCARB(SW,"2015",RG) + INICH4LIM(RG) + ININ2OLIM(RG)
                          + (INISLFLIM(RG) + INILLFLIM(RG))*0.001 + 0.000000001;
XTOTGHG(SW,"2015","total")  = SUM(RG, XTOTGHG(SW,"2015",RG));

XTOTGHG(SW,PP,RG)       = TOTRGEM.L(PP,RG,SW) + 0.000000001;
* Total GHG emissions must be corrected for total non energy carbon emissions and afforestation
XTOTGHG(SW,PP,"total")  = SUM(RG, XTOTGHG(SW,PP,RG)) + nonem("co2",pp)
                        - SUM((sy,ps) , cab(sy,pp,ps) * AFF.L(sy,ps,sw)) * co2fac("co2");

XTOTGHG2(SW,TP)       = sum(rg,XTOTGHG(SW,TP,RG))*44/12 + 0.001;
XTOTGHG2(SW,"2015")  = 52.5;


display XTOTCH4, XTOTN2O, XTOTHFC, XTOTSF6;

DISPLAY XTOTGHG, XGHGLIM;

DISPLAY AFF.L;

*---------------------------------------
*OB/12.2008: NEW DISPLAY OF INFORMATION
*---------------------------------------

DISPLAY '--------------------------------------------------------------------------------'

*OB/12.2008: EMISSIONS AND TEMPERATURE

OPTION DECIMALS = 6;
DISPLAY XTOTCARB;

DISPLAY "Carbon is expressed in billions of tons; other gases in million tons.";
OPTION DECIMALS = 6;
DISPLAY XTOTEM;

DISPLAY "Carbon is expressed in ppmv;  other gases in billion tons.";
OPTION DECIMALS = 3;
DISPLAY STOCK;

DISPLAY TEMP;

DISPLAY XTOTGHG;

*OB/2009-01: PRIMARY ENERGY

PARAMETERS
   PRIMCOAL(SW,TP,*)   PRIMARY COAL (EXAJOULES)
   PRIMOIL(SW,TP,*)    PRIMARY OIL  (EXAJOULES)
   PRIMBIO(SW,TP,*)   PRIMARY Biomass  (EXAJOULES)
   PRIMGAS(SW,TP,*)    PRIMARY GAS  (EXAJOULES)
   PRIMNURE(SW,TP,*)   PRIMARY NUCLEAR AND RENEWABLES (EXAJOULES)
   WORLDPRIM(SW,TP,*)  WORLD PRIMARY ENERGY PER SOURCE (EXAJOULES)
   CANPRIM(SW,TP,*)    CANADA PRIMARY ENERGY PER SOURCE (PJ)
   WPRIM(SW,TP,*,*)    Regional PRIMARY ENERGY PER SOURCE (PJ)
   TOTPRIM1(SW,TP,*)   TOTAL PRIMARY ENERGY (EXAJOULES)
   TOTPRIM2(SW,TP,*)   TOTAL PRIMARY ENERGY (DIRECT COMPUTATION)
   PRIMNU(SW,TP,*)     PRIMARY NUCLEAR (EXAJOULES)
   PRIMSolar(SW,TP,*)  PRIMARY Solar (EXAJOULES)
   PRIMwind(SW,TP,*)   PRIMARY wind (EXAJOULES)
   PRIMhydro(SW,TP,*)  PRIMARY hydro (EXAJOULES)
   PRIMGAS2(SW,TP,*);

PRIMCOAL(SW,TP,RG) = SUM(COALC, PN.L(COALC,TP,RG,SW));
PRIMCOAL(SW,TP,"WORLD") = SUM(RG,PRIMCOAL(SW,TP,RG));

PRIMOIL(SW,TP,RG) = SUM(OILC, PN.L(OILC,TP,RG,SW)) - NTX.L("OIL",TP,RG,SW);
PRIMOIL(SW,TP,"WORLD") = SUM(RG,PRIMOIL(SW,TP,RG));

*PRIMGAS(SW,TP,RG) =  SUM(GASC, PN.L(GASC,TP,RG,SW)) - NTX.L("GAS",TP,RG,SW);
PRIMGAS(SW,TP,RG) = HTRT("GAS-R",tp,RG)*PEL(sw,rg,tp,"GAS-R") + HTRT("GAS-N",tp,RG)*PEL(sw,rg,tp,"GAS-N") +
                    HTRT("GAS-A",tp,RG)*PEL(sw,rg,tp,"GAS-A") + GASNON.L(TP,RG,SW);
PRIMGAS(SW,TP,"WORLD") = SUM(RG,PRIMGAS(SW,TP,RG));

PRIMBIO(SW,TP,RG) = PN.L("RNEW",TP,RG,SW)+PN.L("neb-hc",TP,RG,SW);
PRIMBIO(SW,TP,"WORLD") =sum(rg,PN.L("RNEW",TP,RG,SW))+sum(rg,PN.L("neb-hc",TP,RG,SW));

PRIMGAS2(SW,TP,RG) = SUM(GASC, PN.L(GASC,TP,RG,SW));
PRIMGAS2(SW,TP,"WORLD") = SUM(RG,PRIMGAS(SW,TP,RG));

PRIMNURE(SW,TP,RG) = sum(ts,PE.L("HYDRO",TP,ts,RG,SW))*HTRT("HYDRO",tp,RG) + sum(ts,PE.L("nuc-LWR",TP,ts,RG,SW))*HTRT("nuc-LWR",tp,RG) +
                     sum((ts,etsolar),PE.L(etsolar,TP,ts,RG,SW))*HTRT("SolarPV",tp,RG) + sum((ts,etwind),PE.L(etwind,TP,ts,RG,SW))*HTRT("windon",tp,RG)+
                     sum(ts,PE.L("ADV-LC",TP,ts,RG,SW))*HTRT("ADV-LC",tp,RG) +
                     sum(ts,PE.L("LBDE",TP,ts,RG,SW))*HTRT("LBDE",tp,RG) + PN.L("RNEW",TP,RG,SW) + PN.L("NEB-HC",TP,RG,SW) +
                     PN.L("NEB-LC",TP,RG,SW) + PN.L("LBDN",TP,RG,SW);
PRIMNURE(SW,TP,"WORLD") = SUM(RG,PRIMNURE(SW,TP,RG));

PRIMNU(SW,TP,RG) = sum(ts,PE.L("nuc-LWR",TP,ts,RG,SW))*3.6;
PRIMNU(SW,TP,"WORLD") = SUM(RG,PRIMNU(SW,TP,RG));

PRIMSolar(SW,TP,RG) = sum((ts,etsolar),PE.L(etsolar,TP,ts,RG,SW))*3.6;
PRIMSolar(SW,TP,"WORLD") = SUM(RG,PRIMSolar(SW,TP,RG));


PRIMwind(SW,TP,RG) = sum((ts,etwind),PE.L(etwind,TP,ts,RG,SW))*3.6;
PRIMwind(SW,TP,"WORLD") = SUM(RG,PRIMwind(SW,TP,RG));

PRIMhydro(SW,TP,RG) = sum(ts,PE.L("HYDRO",TP,ts,RG,SW))*3.6;
PRIMhydro(SW,TP,"WORLD") = SUM(RG,PRIMhydro(SW,TP,RG));

TOTPRIM1(SW,TP,RG) = PRIMCOAL(SW,TP,RG) + PRIMOIL(SW,TP,RG) + PRIMGAS(SW,TP,RG)+PRIMBIO(SW,TP,RG) + PRIMNU(SW,TP,RG)+PRIMSolar(SW,TP,RG)+PRIMhydro(SW,TP,RG)+PRIMwind(SW,TP,RG);
TOTPRIM1(SW,TP,"WORLD") = SUM(RG,TOTPRIM1(SW,TP,RG));

WORLDPRIM(SW,TP,"COAL") = PRIMCOAL(SW,TP,"WORLD") + 0.000000001;
WORLDPRIM(SW,TP,"OIL") = PRIMOIL(SW,TP,"WORLD") + 0.000000001;
WORLDPRIM(SW,TP,"GAS") = PRIMGAS(SW,TP,"WORLD") + 0.000000001;
WORLDPRIM(SW,TP,"BIOMASS") = PRIMBIO(SW,TP,"WORLD") + 0.000000001;
WORLDPRIM(SW,TP,"Nuc") = PRIMNU(SW,TP,"WORLD") + 0.000000001;
WORLDPRIM(SW,TP,"SOLAR") = PRIMSolar(SW,TP,"WORLD") + 0.000000001;
WORLDPRIM(SW,TP,"WIND") = PRIMwind(SW,TP,"WORLD") + 0.000000001;
WORLDPRIM(SW,TP,"HYDRO") = PRIMhydro(SW,TP,"WORLD") + 0.000000001;
WORLDPRIM(SW,TP,"TOT") = TOTPRIM1(SW,TP,"WORLD") + 0.000000001;

CANPRIM(SW,TP,"COAL") = PRIMCOAL(SW,TP,"CAN")*1000  + 0.000000001;
CANPRIM(SW,TP,"OIL") = PRIMOIL(SW,TP,"CAN")*1000  + 0.000000001;
CANPRIM(SW,TP,"GAS") = PRIMGAS(SW,TP,"CAN")*1000  + 0.000000001;
CANPRIM(SW,TP,"BIOMASS") = PRIMBIO(SW,TP,"CAN")*1000  + 0.000000001;
CANPRIM(SW,TP,"Nuc") = PRIMNU(SW,TP,"CAN")*1000  + 0.000000001;
CANPRIM(SW,TP,"SOLAR") = PRIMSolar(SW,TP,"CAN")*1000  + 0.000000001;
CANPRIM(SW,TP,"WIND") = PRIMwind(SW,TP,"CAN")*1000  + 0.000000001;
CANPRIM(SW,TP,"HYDRO") = PRIMhydro(SW,TP,"CAN")*1000  + 0.000000001;
CANPRIM(SW,TP,"TOT") = TOTPRIM1(SW,TP,"CAN")*1000  + 0.000000001;

WPRIM(SW,TP,"COAL",rg) = PRIMCOAL(SW,TP,rg)*1000  + 0.000000001;
WPRIM(SW,TP,"OIL",rg) = PRIMOIL(SW,TP,rg)*1000  + 0.000000001;
WPRIM(SW,TP,"GAS",rg) = PRIMGAS(SW,TP,rg)*1000  + 0.000000001;
WPRIM(SW,TP,"BIOMASS",rg) = PRIMBIO(SW,TP,rg)*1000  + 0.000000001;
WPRIM(SW,TP,"Nuc",rg) = PRIMNU(SW,TP,rg)*1000  + 0.000000001;
WPRIM(SW,TP,"SOLAR",rg) = PRIMSolar(SW,TP,rg)*1000  + 0.000000001;
WPRIM(SW,TP,"WIND",rg) = PRIMwind(SW,TP,rg)*1000  + 0.000000001;
WPRIM(SW,TP,"HYDRO",rg) = PRIMhydro(SW,TP,rg)*1000  + 0.000000001;
WPRIM(SW,TP,"TOT",rg) = TOTPRIM1(SW,TP,rg)*1000  + 0.000000001;


TOTPRIM2(SW,TP,RG) = VALUESUM(SW,RG,TP,"TPE") + NEIS(TP,RG)*(EISS.L(TP,RG,SW) - EISDEMAND(TP,RG));
TOTPRIM2(SW,TP,"WORLD") = SUM(RG,TOTPRIM2(SW,TP,RG));

DISPLAY WORLDPRIM;

PARAMETER  WORLDPEL(SW,TP,ET)  WORLD ELECTRICITY GENERATION (TKWH);
WORLDPEL(SW,TP,ET) = PEL(SW,"world",TP,ET) + 0.000000001;
PARAMETER  WORLDPELPEAK(SW,TP,ET)  WORLD ELECTRICITY GENERATION (TKWH);
WORLDPELPEAK(SW,TP,ET) = PELPEAK(SW,"world",TP,ET) + 0.000000001;
DISPLAY WORLDPEL, WORLDPELPEAK;

PARAMETER  REPGDP(SW,TP,*)  GDP - TRILLION US DOLLARS;
REPGDP(SW,TP,RG) = VALUESUM(SW,RG,TP,"GDP");
REPGDP(SW,TP,"WORLD") = SUM(RG, REPGDP(SW,TP,RG));
DISPLAY REPGDP;

PARAMETER  WORLDPNL(SW,TP,nr)  WORLD PRODUCTION OF NONELECTRIC ENERGY (EXAJ);
WORLDPNL(SW,TP,nr) = PNL(sw,"world",tp,nr) + 0.000000001;

PARAMETER worldPHL(SW,TP,ht) WORLD PRODUCTION OF Hydrogen ENERGY (EXAJ);
WORLDPHL(SW,TP,ht) = PHL(SW,"world",TP,ht) + 0.000000001;

DISPLAY WORLDPNL, worldPHL;

PARAMETERS
   RGPRIMCOAL(SW,TP,RG)   REGIONAL PRIMARY COAL (EXAJOULES)
   RGPRIMOIL(SW,TP,RG)    REGIONAL PRIMARY OIL  (EXAJOULES)
   RGPRIMGAS(SW,TP,RG)    REGIONAL PRIMARY GAS  (EXAJOULES)
   RGPRIMNURE(SW,TP,RG)   REGIONAL PRIMARY NUCLEAR AND RENEWABLES (EXAJOULES);
RGPRIMCOAL(SW,TP,RG) = PRIMCOAL(SW,TP,RG) + 0.000000001;
RGPRIMOIL(SW,TP,RG) = PRIMOIL(SW,TP,RG) + 0.000000001;
RGPRIMGAS(SW,TP,RG) = PRIMGAS(SW,TP,RG) + 0.000000001;
RGPRIMNURE(SW,TP,RG) = PRIMNURE(SW,TP,RG) + 0.000000001;
DISPLAY RGPRIMCOAL, RGPRIMOIL, RGPRIMGAS, RGPRIMNURE;
PARAMETERS
E_H1(tp,rg,sw)    Electricity demand of First Height Load band of RLDC
E_H2(tp,rg,sw)    Electricity demand of Second Height Load band of RLDC
E_H3(tp,rg,sw)    Electricity demand of ThirdHeight Load band of RLDC
E_H4(tp,rg,sw)    Electricity demand of Frouth Height Load band of RLDC
E_Hp(tp,rg,sw)    Electricity demand of peak Height Load band of RLDC
E_CU(tp,rg,sw)    Electricity demand of Curtialment Height Load band of RLDC
E_sscap(tp,rg,sw) Electricity demand of short-term storage capacity
E_ssc(tp,rg,sw)   Total short-term storage cost ($)
E_peak(tp,rg,sw)  Peak demand (PWh)
E_Res_marg(tp,rg,sw) Super Peak demand (PWh)
E_SSprod(tp,rg,sw)
Elec_H2curtail(tp,rg,sw)             
;
E_H1(tp,rg,sw)   = H1(tp,rg,sw)   * E.L(RG,TP,SW);   
E_H2(tp,rg,sw)   = H2(tp,rg,sw)   * E.L(RG,TP,SW);   
E_H3(tp,rg,sw)   = H3(tp,rg,sw)   * E.L(RG,TP,SW);   
E_H4(tp,rg,sw)   = H4(tp,rg,sw)   * E.L(RG,TP,SW);   
E_Hp(tp,rg,sw)   = Hp(tp,rg,sw)   * E.L(RG,TP,SW);   
E_CU(tp,rg,sw)   = CU(tp,rg,sw)   * E.L(RG,TP,SW);   
E_sscap(tp,rg,sw)= sscap(tp,rg,sw)* E.L(RG,TP,SW);
E_ssc(tp,rg,sw)  = ssc(tp,rg,sw)  * E.L(RG,TP,SW);  
E_peak(tp,rg,sw)=peakshare(tp,rg,sw)*E.L(RG,TP,SW);
E_Res_marg(tp,rg,sw)=Res_marg_share(tp,rg,sw)*E.L(RG,TP,SW);
E_SSprod(pp,rg,sw)=Res_marg_share(pp,rg,sw)*sscap(pp,rg,sw)*E.L(RG,pP,SW);
Elec_H2curtail(pp,rg,sw)=(CU(pp,rg,sw)-Res_marg_share(pp,rg,sw)*sscap(pp,rg,sw))*E.L(RG,pP,SW);
DISPLAY E_H1 ,E_H2 , E_H3, E_H4, E_Hp, E_CU, E_sscap,E_ssc,E_peak, E_Res_marg, E_SSprod,Elec_H2curtail;
