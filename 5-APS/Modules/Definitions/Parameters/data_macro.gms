TABLE MACRO(MP, * )  MACROECONOMIC AND OTHER PARAMETERS

        usa     weur    jsk     can     anz     OEA     RUS     china   india   mea    mex    Africa    CLA     BRA     OAS
                                                            
KGDP    2.5     2.5     2.5     2.5     2.5     3       3       2.5       2.5   3      3      3         3       3       3
DEPR    5       5       5       5       5       5       5       5         5     5      5      5         5       5       5
ESUB    0.50    0.50    0.50    0.50    0.50    0.40    0.40    0.50    0.40    0.40    0.40    0.45    0.40    0.40    0.40
KPVS    0.24    0.28    0.28    0.28    0.28    0.3     0.3     0.3     0.50    0.3     0.3     0.3     0.3     0.3     0.3 
ELVS    0.55    0.40    0.45    0.35    0.40    0.65    0.30    0.50    0.80    0.40    0.60    0.90    0.55    0.30    0.45
INTPR   4       4       4       4       4       3.7     3.7     4       4       3.7     3.7     4       4       4       4
PNREF   2.75    5       6       4       4       2.5     2.5     2.5     2.5     2.5     2.5     2.5     2.5     2.5     2.5
XNTAX           5       5       2.5     2.5                                     
XETAX                                                           
DECF    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98
DECFO   0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98
DECFH2  0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98    0.98
NSHF    0.01    0.01    0.01    0.01    0.01    0.01    0.01    0.01    0.01    0.01    0.01    0.01    0.01    0.01    0.01
EXPF    1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161
EXPFO   1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161
EXPNU   1.0301  1.0301  1.0301  1.0301  1.0301  1.0301  1.0301  1.0301  1.0301  1.0301  1.0301  1.0301  1.0301  1.0301  1.0301
HXPF    1.0661  1.0661  1.0661  1.0661  1.0661  1.0661  1.0661  1.0661  1.0661  1.0661  1.0661  1.0661  1.0661  1.0661  1.0661
NXPF    1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161  1.1161
OGPD    1.25    1.25    1.25    1.25    1.25    1.25    1.25    1.25    1.25    1.25    1.25    1.25    1.25    1.25    1.25
CLGDP   -0.40   -0.40   -0.40   -0.15           0.0             -0.35   -0.15                                            -0.15
NW      0.23    0.239   0.095   0.034   0.034   0.042   0.042   0.085   0.037   0.047   0.047   0.19    0.19    0.19    0.19
;

PARAMETER MPC(*);

MPC("2015")      =  5.0;
MPC("2020")      =  4.9;
MPC("2030")      =  4.8;
MPC("2040")      =  4.7;
MPC("2050")      =  4.6;
MPC("2060")      =  4.5;
MPC("2070")      =  4.4;
MPC("2080")      =  4.3;
MPC("2090")      =  4.2;
MPC("2100")      =  4.1;
MPC("2110")      =  4.0;
MPC("2120")      =  3.9;
MPC("2130")      =  3.8;
MPC("2140")      =  3.7;
MPC("2150")      =  3.6;
MPC("2160")      =  3.5;
MPC("2170")      =  3.4;
MPC("2180")      =  3.3;
MPC("2190")      =  3.2;
MPC("2200")      =  3.1;
MPC("2210")      =  3.0;
MPC(TP)      =  MPC(TP)/100;

PARAMETERS
    GROW(tp,rg)         POTENTIAL GDP GROWTH RATES - ANNUAL PERCENT
    PGRO(tp,rg)         POPULATION GROWTH RATES - ANNUAL PERCENT
    AEEI(tp,rg)   AUTONOMOUS ENERGY EFFICIENCY IMPROVEMENT RATE - PERCENT PER YEAR;

GROW(tp,rg) = (POTGDP(tp+1,rg)/POTGDP(tp,rg))**(1/NYPER(TP)) - 1;
PGRO(tp,rg) =    (POP(tp+1,rg)/   POP(tp,rg))**(1/NYPER(TP)) - 1;
GROW(tp,rg) $ (ORD(tp) eq CARD(tp))
            = (POTGDP(tp,rg) - POTGDP(tp-1,rg))/
              (POTGDP(tp,rg) *  NYPER(tp-1));
PGRO(tp,rg) $ (ORD(tp) eq CARD(tp))
            = (   POP(tp,rg) -    POP(tp-1,rg))/
              (   POP(tp,rg) *  NYPER(tp-1));
GROW(tp,rg)  = 100 * GROW(tp,rg);
PGRO(tp,rg)  = 100 * PGRO(tp,rg);
Scalar aeeiDefault /0.40/;
Parameter aeeiCoef(rg) /
  USA    0.85
  WEUR   0.50
  JSK    0.40
  CAN    0.60
  ANZ    0.90
  MEX    0.60
  CHINA  0.28
  INDIA  0.86
  MEA    0.50
  BRA    0.30
  CLA    0.50
  RUS    0.55
  OEA    0.52
  AFRICA 0.30
  OAS    0.65
/;
DISPLAY GROW,PGRO;

SCALAR
    WORLDNW     WORLD CHECKSUM OF INITIAL NEGISHI WEIGHTS;

WORLDNW     = SUM(RG, MACRO("NW",RG));
DISPLAY WORLDNW;