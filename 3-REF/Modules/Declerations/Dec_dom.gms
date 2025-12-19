E.FX(RG,TBASE,SW) = E0(RG);
N.FX(RG,TBASE,SW) = N0(RG);
Y.FX(RG,TBASE,SW) = Y0(RG);
K.FX(RG,TBASE,SW) = K0(RG);
C.FX(RG,TBASE,SW) = C0(RG);
I.FX(RG,TBASE,SW) = I0(RG);
K.LO(RG,PP,SW)   =  LOTOL*K0(RG);
KN.LO(RG,PP,SW)  =  LOTOL*I0(RG)*10;
Y.LO(RG,PP,SW)   =  LOTOL*Y0(RG)*L(PP,RG);
YN.LO(RG,PP,SW)  =  LOTOL*Y0(RG)*LN(PP,RG);
C.LO(RG,PP,SW)   =  LOTOL*C0(RG)*L(PP,RG);
C.LO(RG,PP,SW)   =  MAX(.1, C.LO(RG,PP,SW));
C.UP(RG,PP,SW)   =        C0(RG)*L(PP,RG)/LOTOL;
I.LO(RG,PP,SW)   =  LOTOL*I0(RG)*L(PP,RG);
E.LO(RG,PP,SW)   =  LOTOL*E0(RG)*L(PP,RG);
EN.LO(RG,PP,SW)  =  LOTOL*E0(RG);
N.LO(RG,PP,SW)   =  LOTOL*N0(RG)*L(PP,RG);
NN.LO(RG,PP,SW)  =  LOTOL*N0(RG);
EISS.LO(TP,RG,SW) = LOTOL*EISDEMAND(TP,RG);
K.L(RG,PP,SW)    =  K0(RG)*L(PP,RG);
Y.L(RG,PP,SW)    =  Y0(RG)*L(PP,RG);
C.L(RG,PP,SW)    =  C0(RG)*L(PP,RG);
I.L(RG,PP,SW)    =  I0(RG)*L(PP,RG);
PE.UP(etnonpeak,PP,"nonpeak",RG,SW)       =  ECAP(etnonpeak,PP,RG);
PE.UP(etpeak,pp,"peak",RG,SW)          =  ECAPPEAK(etpeak,pp,RG);
PE.FX(etnonpeak,TBASE,"nonpeak",RG,SW)    =  ECAP(etnonpeak,TBASE,RG);
PE.FX(etpeak,TBASE,"peak",RG,SW)    =     ECAPPEAK(etpeak,TBASE,RG);
PE.UP("solarpv",pp,"peak",RG,SW)          =  0;
PE.UP("windon",pp,"peak",RG,SW)          =  0;
PE.UP("windoff",pp,"peak",RG,SW)          =  0;
PE.FX("HYDRO",TP,"nonpeak",RG,SW)  =  ECAP("HYDRO",TP,RG);
PE.FX("nuc-LWR",TP,"nonpeak",RG,SW)    =  ECAP("nuc-LWR",TP,RG);
PE.FX("COAL-R",tp,"nonpeak","OEA",SW)  =  ECAP("COAL-R",TP,"OEA");
PE.FX("OIL-R ",tp,"peak","OEA",SW)  =  ECAP("OIL-R ",TP,"OEA");
PE.FX("OIL-R ",tp,"nonpeak",rg,SW)  =  0;
PE.FX("COAL-R",tp,"nonpeak","RUS",SW)  =  ECAP("COAL-R",TP,"RUS");
PE.FX("OIL-R ",tp,"peak","RUS",SW)  =  ECAP("OIL-R ",TP,"RUS");
PE.FX("OIL-R ",tp,"peak",rg,SW)  =  ECAPPEAK("OIL-R ",TP,rg);                              
PE.FX("COAL-R",tp,"nonpeak",rg,SW) =  ECAP("COAL-R",TP,rg);
PE.FX("GAS-R ",tp,"peak",rg,SW) =  ECAPPEAK("GAS-R ",TP,rg);
PE.FX("GAS-n ",TBASE,"peak",rg,SW) = gaspeak* ECAP("GAS-n ",TBASE,rg);
PE.UP("storage", tp30, "peak", rg, SW)$rDef(rg) = peUpDef(rg);
PN.UP(NT,PP,RG,SW)       =  NCAP(NT,PP,RG);
PN.FX(NT,TBASE,RG,SW)    =  NCAP(NT,TBASE,RG);
PN.FX("RNEW","2020",RG,SW)   =  NCAP("RNEW","2020",RG);
PN.LO("RNEW",PP,RG,SW)   =  0.8*NCAP("RNEW","2020",RG);
PNF.FX("ura-1",TBASE,RG,SW)  =  UCAP("ura-1",rg);
W.FX(TBASE,RG,SW) = ELGEN("nuc-LWR",rg)*htrt("nuc-LWR","2015",rg)*10**3/500;
Pu.FX(TBASE,RG,SW) = PuCAP("2015",rg);
DU.FX(TBASE,RG,SW) = DUCAP("2015",rg);
MOX.FX(TBASE,RG,SW) = MOXCAP("2015",rg);
PN.LO("H2",tp10,RG,SW)$(ORD(tp10) le 2)   =  NCAP("H2",tp10,RG);
PN.LO("H2",tp10,RG,SW)$(ORD(tp10) ge 3)   =  1.1*NCAP("H2","2020",RG);
PH.FX(HT,TBASE,RG,SW)       =  HCAP(HT,TBASE,RG);
PH.FX(HT,"2020",RG,SW)       =  HCAP(HT,"2020",RG);
PH.LO("GAS-h2",tp20,RG,"SW1")       =  HCAP("GAS-h2","2020",RG);
E.FX(rg, "2020", SW)$rE2020(rg) = e_fx(rg);
PE.FX("adv-lc",tp,ts,rg,sw) = 0;
CPE.LO(TP,SW)    =  cpe0;
CPE.FX(TBASE,SW) =  cpe0;
PN.FX("neb-lc",tp,rg,sw) = 0;
CPN.LO(TP,SW)    =  cpn0;
CPN.FX(TBASE,SW) =  cpn0;
$ifthenI %lbd% == NO
PE.FX("lbde",tp,ts,rg,sw) = 0;
PN.FX("lbdn",tp,rg,sw) = 0;
$else
sum(ts,PE.LO("lbde",tp,ts,rg,sw)) = min(1E-12, ECAP("lbde",tp,rg));
sum(ts,PE.FX("SolarPV",tp,ts,rg,sw)) = 0;
sum(ts,PE.FX("windon",tp,ts,rg,sw)) = 0;
sum(ts,PE.FX("windoff",tp,ts,rg,sw)) = 0;
CPE.LO(TLAST,SW) =  10*cpe0;
PN.LO("lbdn",tp,rg,sw) = min(1E-12, NCAP("lbdn",tp,rg));
PN.FX("neb-hc",tp,rg,sw) = 0;

CPN.LO(TLAST,SW) =  10*cpn0;
$endif
GASNON.FX(TBASE,RG,SW)    = NCAP("GAS-1",TBASE,RG)
                          - HTRT("GAS-R",TBASE,RG) * ECAP("GAS-R",TBASE,RG)
                          - HTRT("GAS-N",TBASE,RG) * ECAP("GAS-N",TBASE,RG)
                          - GASX(TBASE,RG);

GASNON.FX('2020',"china",SW)    = 9.5;
GASNON.FX('2020',"India",SW)    = 1.5;

OILNON.FX(TBASE,RG,SW) = NCAP("OIL-1",TBASE,RG)
                          - HTRT("OIL-R",TBASE,RG) * ECAP("OIL-R",TBASE,RG)
                          - OILX(TBASE,RG);

OILNON.FX(TBASE,RG,SW) = (NCAP("OIL-1",TBASE,RG)
                          - HTRT("OIL-R",TBASE,RG) * ECAP("OIL-R",TBASE,RG)
                          - OILX(TBASE,RG)); 

CLEV.FX("2015",RG,SW)       =  CARLIM("sw1","2015",RG);
EM.FX("co2","2015",sw)      =  SUM(RG, CARLIM("sw1","2015",RG));
CLEV.UP(tp20,RG,sw)      =  CARLIM("sw1",tp20,RG);
EM.UP("co2", tlast,sw)      =  TYGCL(SW);
DC.UP(rg,tp,sw)             =  DCLIM(tp,rg);
CRLX.FX("2015",RG,SW)          =  0;
*OB:2010-09 : Testing impact of setting CRLX to 0
*CRLX.FX("2010",RG,SW) =  0;
*CRLX.FX("2020",RG,SW) =  0;
*CRLX.FX("2030",RG,SW) =  0;
*CRLX.FX("2040",RG,SW) =  0;
*CRLX.FX("2050",RG,SW) =  0;
*CRLX.FX("2060",RG,SW) =  0;
*CRLX.FX("2070",RG,SW) =  0;
*CRLX.FX("2080",RG,SW) =  0;
*CRLX.FX("2090",RG,SW) =  0;
*CRLX.FX("2100",RG,SW) =  0;

$ifthenI %abate% == NO
ABATE.FX(ghg,abx,tp,rg,sw) = 0;
$else
ABATE.FX("co2",abx,tp,rg,sw)   =  0;
ABATE.FX(ogg,abx,"2015",rg,sw) =  0;
ABATE.UP(ogg,abx,tp10,rg,sw)  =   ABLIM(ogg,abx,tp10,rg);

$endif

$ifthenI %sinks% == NO
AFF.FX(sy,ps,sw) = 0;
$else
AFF.UP(sy,ps,sw) = 1;
$endif

NTX.FX("OIL",TBASE,RG,SW)  =  OILX(TBASE,RG);
NTX.UP("OIL",PP,RG,SW)     =  OILX(PP,RG);
NTX.LO("OIL",PP,RG,SW)     =  - OILM(PP,RG);
NTX.UP("H2",PP,RG,SW)     =  HYDX(PP,RG);
NTX.FX("GAS",TBASE,RG,SW)  =  GASX(TBASE,RG);
NTX.UP("GAS",PP,RG,SW)     =  GASX(PP,RG);
NTX.LO("GAS",PP,RG,SW)     =  - GASM(PP,RG);
NTX.LO("H2",PP,RG,SW)     =  - HYDM(PP,RG);
NTX.FX("CRT",TBASE,RG,SW)  =  0;
NTX.UP("CRT",PP,RG,SW)     =    CARXL(PP,RG);
NTX.LO("CRT",PP,RG,SW)     =  - CARML(PP,RG);
NTX.FX("EIS",TBASE,RG,SW)  =  0;
NTX.UP("EIS",PP,RG,SW)     =    EISXL(PP,RG);
NTX.LO("EIS",PP,RG,SW)     =  - EISML(PP,RG);
PRSV.FX(RG,X,TBASE,SW)      =  RSV(X,RG);
URSC.UP(RG,X,TBASE,SW)      =  RSC(X,RG);
RA.UP(RG,X, TBASE,SW)      =   RSC(X,RG)*RDF(X,RG);
EM.FX("CO2","2015",SW)     =  SUM(RG, CARLIM("sw1","2015",RG));
TOTEM.FX("CO2","2015",SW)  =  SUM(RG, CARLIM("sw1","2015",RG))
                            +         NONEM("CO2","2015");
EM.FX("co2","2015",sw) =  SUM(rg, CARLIM("sw1","2015",rg));
EM.FX("ch4","2015",sw) =  SUM(rg, NCAP("gas-1","2015",rg)*BCH4GAS("2015",rg))/1000;
TOTEM.FX("ch4","2015",SW)
                       =  SUM(rg, NCAP("gas-1","2015",rg)*BCH4GAS("2015",rg))/1000
                        + sum(rg, bline("ch4","2015",rg))/gwp("ch4");

EM.FX("n2o",tp,sw)        =  0;
TOTEM.FX(ghg,"2015",sw) $ (ord(ghg) ge 3) =
                         sum(rg, bline(ghg,"2015",rg))/gwp(ghg);

EM.FX("slf",TP,SW)        =  0;
EM.FX("llf",TP,SW)        =  0;

CO2.FX(BOX,TBASE,SW)     =  CO2BASE(BOX);

*   +15
S.FX(ghg,"2015",sw)      =  basestock(ghg);
SMINUS.FX(ghg,"2015",sw)
                         =  basestock(ghg) - eqstock(ghg);

S.UP("co2",pp,sw)        =  basestock("co2") * conlim(pp,sw)/conlim("2015",sw);
S.LO(ghg,pp,sw)          =  .5 * basestock(ghg);
SMINUS.LO(ghg,pp,sw)     =  .1 * (basestock(ghg) - eqstock(ghg));

PT.FX(tbase,sw)          =  rfconv("sw1")*rfbase;
PT.UP(pp,sw)             =  PTDLIM(PP,SW);

ATP.FX(tbase,sw)         =  0;
ATP.LO(pp,sw)            = .01;
ATP.UP(pp,sw)            =  ATDLIM(pp,sw);

$ifthenI %initghg% == REF

*OB/2009-01: New bound for THC preservation scenarios (Low and Medium sensitivity ONLY)
*            GHGKYOTO defined in file GHGLIM.TAB
*TOTRGEM.LO("2010",rg,sw) = GHGKYOTO(rg);

$elseIfI %initghg% == THC

*OB/2009-01: New bound for THC preservation scenarios
*            Imposed to replicate Kyoto levels by 2010
*            in all THC except THC-H (to avoid infeasibilities)

* GHG emissions fixed to Kyoto level
* GHGKYOTO defined in file GHGLIM.TAB
TOTRGEM.FX("2020",rg,sw) = GHGKYOTO(rg);

*OB/2009-09:
* CO2 emissions fixed to Kyoto level
* CO2KYOTO defined in file GHGLIM.TAB
*CLEV.FX("2010",rg,sw) = CO2KYOTO(rg);

$endif

* ------------------------------------------------------------------------------*
*  End of INITGHG.TAB
* ------------------------------------------------------------------------------*

* ============================================================================= *
* ========================== MODEL AND SOLVE STATEMENTS ======================= *
* ============================================================================= *

* $ifthenI %sol% == 'KYT'

* $include "KT-HL.bas"
* *option nlp = gamsbas

* $elseIfI %sol% == 'OPT'

* *$include "opt.bas"
* option nlp = gamsbas

* $elseIfI %sol% == 'PTO'

* OPTION Savepoint=1;
* Execute_loadpoint 'M5_p';

* $elseIfI %sol% == 'REF'

* $include "REF-HL.bas"
* *option nlp = gamsbas

* $elseIfI %sol% == 'SRF'

* $include "srf.bas"
* option nlp = gamsbas

* $elseIfI %sol% == 'TPH'

* $include "THC-HL.bas"
* *option nlp = gamsbas

* $elseIfI %sol% == 'TPL'

* $include "THC-LH.bas"
* *option nlp = gamsbas

* $elseIfI %sol% == 'TPM'

* $include "THC-M.bas"
* *option nlp = gamsbas

* $endif

* * ------------------------------------------------------------------------------*
* * This section of the code includes a solution for warm start, if one is provided.
* * ------------------------------------------------------------------------------*

* $ifthen.one set warmstart
*     $ifthen.two exist "%warmstart%"
*         $include "%warmstart%"
*     $else.two
*         $abort "Input file %warmstart% not found."
*     $endif.two
* $endif.one



* ------------------------------------------------------------------------------*
* This section of the code contains the solve statements and Negishi
* iterations.
* ------------------------------------------------------------------------------*
