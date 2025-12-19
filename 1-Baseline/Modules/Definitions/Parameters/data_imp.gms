PARAMETER  MKT(RG)  LATITUDE FACTOR - TEMPERATURE MULTIPLIER FOR MARKET DAMAGES

    / usa    1.0
      weur   1.0
      jsk  1.0
      can   1.0
      anz   1.0
      OEA  1.0
      RUS  1.0
      china  1.0
      india  0.5
      MEA  0.5
      mex    0.5
      Africa     0.5
      CLA        0.5
      BRA        0.5
      OAS       0.5  /;

SCALAR
    TEMPREF REFERENCE TEMPERATURE FOR THE MARKET DAMAGE MULTIPIERS /2.5/;

PARAMETERS

   alpha_new(rg) gross damage parameter 
   alpha1_new(rg) gross damage parameter 1
   alpha2_new(rg) gross damage parameter 2
   alpha3_new(rg) gross damage parameter 3 
   alpha(rg)  gross damage parameter 
   alpha1(rg) gross damage parameter 1
   alpha2(rg) gross damage parameter 2
   alpha3(rg) gross damage parameter 3;

* --- USA ---
*Old values
*alpha("USA")   =      0        ;
*alpha1("USA")    =   1;
*alpha2("USA")  =       0.0014   ;
*alpha3("USA")  =       2.65     ;
*New values
alpha("USA")    = 0.007;
alpha1("USA")   = 1;
alpha2("USA")   = 0.0002;
alpha3("USA")   = 2;
** --- Western Europe (WEUR) ---
*Old values
*alpha("WEUR")  =      0        ;
*alpha1("WEUR")   =   1;
*alpha2("WEUR") =       0.00145  ;
*alpha3("WEUR") =       2.35     ;
*New values
alpha("WEUR")   = 0.013;
alpha1("WEUR")  = 1;
alpha2("WEUR")  = 0.0005;
alpha3("WEUR")  = 2;
** --- Russia (RUS) ---
*Old values

*alpha("rus") =      0        ;
*alpha1("rus")    =   1;
*alpha2("RUS")=       0.001    ;
*alpha3("RUS")=       2.55     ;
*New values
alpha("RUS")    = 0.0025;
alpha1("RUS")   = 1;
alpha2("RUS")   = 0.00015;
alpha3("RUS")   = 2;
** --- OAS ---
*Old values
*alpha("OAS")   =      0.001549 ;
*alpha1("OAS")    =   1;
*alpha2("OAS")  =       0.0016   ;
*alpha3("OAS")  =       2.3      ;
*New values
alpha("OAS")    = 0.035;
alpha1("OAS")   = 1.0;
alpha2("OAS")   = 0.0075;
alpha3("OAS")   = 2;

** --- Mexico (MEX) ---
*Old values
*alpha("MEX") =      0.002080 ;
*alpha1("MEX")    =   1;
*alpha2("MEX")=       0.0014   ;
*alpha3("MEX")=       2.85     ;
*New values
alpha("MEX")    = 0.003;
alpha1("MEX")   = 1.0;
alpha2("MEX")   = 0.0005;
alpha3("MEX")   = 2.0;
*
** --- Middle East & Africa (MEA) ---
*
*Old values
*alpha("MEA") =      0.002080 ;
*alpha1("MEA")    =   1; 
*alpha2("MEA")=       0.0014   ;
*alpha3("MEA")=       2.85     ;
*New values

alpha("MEA")    = 0.016;
alpha1("MEA")   = 1;
alpha2("MEA")   = 0.0001;
alpha3("MEA")   = 2;
*
** --- JSK ---
**Old values
*alpha("jsk") =      0.00045  ;
*alpha1("jsk")    =   1;
*alpha2("jsk")=       0.0007   ;
*alpha3("jsk")=       3.6      ;


**New values
alpha("JSK")    = 0.0015;
alpha1("JSK")   = 1;
alpha2("JSK")   = 0.0001;
alpha3("JSK")   = 2;
** --- India ---
***Old values
*alpha("INDIA") =      0.0045   ;
*alpha1("INDIA")  =   1;
*alpha2("INDIA")=       0.001    ;
*alpha3("INDIA")=       3.0      ;
*New values
alpha("India")  = 0.017;
alpha1("India") = 1.0;
alpha2("India") = 0.0015;
alpha3("India") = 2.0;
*

** --- CLA ---
***Old values
*alpha("CLA")   =      0.001549 ;
*alpha1("CLA")    =   1;
*alpha2("CLA")  =       0.0016   ;
*alpha3("CLA")  =       2.3      ;
*New values
alpha("CLA")    = 0.021;
alpha1("CLA")   = 1;
alpha2("CLA")   = 0.00001;
alpha3("CLA")   = 2;
*
** --- China ---
***Old values
*alpha("CHINA") =      0.0006   ;
*alpha1("CHINA")  =   1;
*alpha2("CHINA")=       0.0013   ;
*alpha3("china") =      2.5      ;
*New values
alpha("China")  = 0.006;
alpha1("China") = 1.0;
alpha2("China") = 0.0006;
alpha3("China") = 2;
*
** --- Canada (CAN) ---
***Old values

*alpha("can")  =      0.000125 ;
*alpha1("can")    =   1;
*alpha2("can") =       0.00123  ;
*alpha3("can") =       2.5      ;
*New values
alpha("CAN")    = 0.0013;
alpha1("CAN")   = 1;
alpha2("CAN")   = 0.00015;
alpha3("CAN")   = 2;
*
** --- Brazil (BRA) ---
***Old values
*alpha("BRA")   =      0.001549 ;
*alpha1("BRA")    =   1;
*alpha2("BRA")  =       0.0016   ;
*alpha3("BRA")  =       2.3      ;
*New values
alpha("BRA")    = 0.008;
alpha1("BRA")   = 1;
alpha2("BRA")   = 0.0001;
alpha3("BRA")   = 2;
*
** --- Australia & New Zealand (ANZ) ---
***Old values
*alpha("anz")  =      0.000125 ; 
*alpha1("anz")    =   1;
*alpha2("anz") =       0.00123  ;
*alpha3("anz") =       2.5      ;
*New values
alpha("ANZ")    = 0.012;
alpha1("ANZ")   = 0.5;
alpha2("ANZ")   = 0.0005;
alpha3("ANZ")   = 1.5;
*
** --- AFRICA ---
***Old values
*alpha("Africa")   =      0.001549 ;
*alpha1("Africa") =   1;
*alpha2("Africa")  =       0.0016   ;
*alpha3("Africa")  =       2.3      ;
*New values
alpha("AFRICA") = 0.05;
alpha1("AFRICA")= 1;
alpha2("AFRICA")= 0.001;
alpha3("AFRICA")= 2;
*
** --- OEA --- 
***Old values  

*alpha1("OEA")    =   1;
*alpha("OEA") =      0        ;
*alpha2("OEA")=       0.001    ;
*alpha3("OEA")=       2.55     ;
*New values
alpha("OEA")    = 0.0023;
alpha1("OEA")   = 1.0;
alpha2("OEA")   = 0.0001;
alpha3("OEA")   = 2;


PARAMETERS
   adap1(rg)  adaptation CES parameter 1
   adap2(rg)  adaptation CES parameter 2
   adap3(rg)  adaptation CES parameter 3
   adaprho(rg)    CES adaptation parameter;

$ontext
** adap1
adap1("usa")    = 600;
adap1("weur")   = 2700;
adap1("jsk")    = 1000;
adap1("can")    = 800;
adap1("anz")    = 140;
adap1("OEA")    = 700;
adap1("RUS")    = 120;
adap1("china")  = 300;
adap1("india")  = 600;
adap1("MEA")    =  3;
adap1("mex")    = 200;
adap1("Africa") = 180;
adap1("CLA")    = 500;
adap1("BRA")    = 150;
adap1("OAS")    = 400;

* adap2
adap2("usa")    = 0.35;
adap2("weur")   = 0.25;
adap2("jsk")    = 0.35;
adap2("can")    = 0.3;
adap2("anz")    = 0.37;
adap2("OEA")    = 0.36;
adap2("RUS")    = 0.35;
adap2("china")  = 0.45;
adap2("india")  = 0.6;
adap2("MEA")    = 0.55;
adap2("mex")    = 0.35;
adap2("Africa") = 0.52;
adap2("CLA")    = 0.4;
adap2("BRA")    = 0.4;
adap2("OAS")    = 0.35;

* adaprho
adaprho("Africa") =  0.4   ;
adaprho("weur" ) =   0.5   ;
adaprho("USA"  ) =   0.4   ;
adaprho("RUS"  ) =   0.4   ;
adaprho("OEA"  ) =   0.4   ;
adaprho("OAS"  ) =   0.4   ;
adaprho("MEX"  ) =   0.5   ;
adaprho("MEA"  ) =   0.5   ;
adaprho("JSK"  ) =   0.44   ;
adaprho("India") =   0.5   ;
adaprho("CLA"  ) =   0.4   ;
adaprho("China") =   0.4   ;
adaprho("CAN"  ) =   0.4   ;
adaprho("BRA"  ) =   0.6   ;
adaprho("ANZ"  ) =   0.5   ;

* adap3
adap3("Africa") =   0.95 ;
adap3("weur" ) =    0.95    ;
adap3("USA"  ) =    1    ;
adap3("RUS"  ) =    1;
adap3("OEA"  ) =    0.95 ;
adap3("OAS"  ) =    1    ;
adap3("MEX"  ) =    1    ;
adap3("MEA"  ) =    1    ;
adap3("JSK"  ) =    1    ;
adap3("India") =    1  ;
adap3("CLA"  ) =    1    ;
adap3("China") =    0.95 ;
adap3("CAN"  ) =    0.95    ;
adap3("BRA"  ) =   0.95  ;
adap3("ANZ"  ) =   1   ;

adap3(rg) =   0.7   ;

adaprho(rg)    = 0.5;


*adap1("jsk")=       990       ;
*adap1("USA")  =       48        ;
*adap1("WEUR") =       280       ;
*adap1("MEA")=       697       ;
*adap1("MEX")=       697       ;
*adap1("Africa")  =     220  ;
*adap1("OAS")  =     220     ;
*adap1("CLA")  =     220     ;
*adap1("BRA")  =     220     ;
*adap1("CHINA")=       90        ;
*adap1("INDIA")=       50        ;
*adap1("OEA")=       93        ;
*adap1("RUS")=       93        ;
*adap1("can") =       460       ;
*adap1("anz") =       460       ;
*
*
*
*adap2("jsk")=      0.26       ;
*adap2("USA")  =      0.38     ;
*adap2("WEUR") =      0.32     ;
*adap2("MEA")=      0.62       ;
*adap2("MEX")=      0.62       ;
*adap2("Africa")  =     0.515  ;
*adap2("OAS")  =     0.515     ;
*adap2("CLA")  =     0.515     ;
*adap2("BRA")  =     0.515     ;
*adap2("CHINA")=      0.53     ;
*adap2("INDIA")=      0.56     ;
*adap2("OEA")=      0.61       ;
*adap2("RUS")=      0.61       ;
*adap2("can") =      0.48      ;
*adap2("anz") =      0.48      ;
*
*adap3("jsk")=     1.06        ;
*adap3("USA")  =     0.533       ;
*adap3("WEUR") =     0.935       ;
*adap3("MEA")=     1.1         ;
*adap3("MEX")=     1.1         ;
*adap3("Africa")  =     0.95;
*adap3("OAS")  =     0.95;
*adap3("CLA")  =     0.95        ;
*adap3("BRA")  =     0.95        ;
*adap3("CHINA")=     0.69        ;
*adap3("INDIA")=     0.75        ;
*adap3("OEA")=     0.67        ;
*adap3("RUS")=     0.67        ;
*adap3("can") =     0.98        ;
*adap3("anz") =     0.98        ;
*
*adaprho(rg) = 0.5 ;
$offText



adap1("USA")    = 400;
adap2("USA")    = 0.47;
adap3("USA")    = 0.55;
adaprho("USA")    = 0.4;
adap1("weur")    = 2000;
adap2("weur")    = 0.43;
adap3("weur")    = 0.51;
adaprho("weur")    = 0.5;
adap1("JSK")    = 4000;
adap2("JSK")    = 0.28;
adap3("JSK")    = 0.93;
adaprho("JSK")    = 0.44;
adap1("CAN")    = 320;
adap2("CAN")    = 0.4;
adap3("CAN")    = 0.7;
adaprho("CAN")    = 0.4;
adap1("ANz")    = 15;
adap2("ANz")    = 0.37;
adap3("ANz")    = 0.4;
adaprho("ANz")    = 0.5;
adap1("OEA")    = 700;
adap2("OEA")    = 0.55;
adap3("OEA")    = 0.6;
adaprho("OEA")    = 0.4;
adap1("RUS")    = 130;
adap2("RUS")    = 0.5;
adap3("RUS")    = 0.7;
adaprho("RUS")    = 0.5;
adap1("China")    = 170;
adap2("China")    = 0.35;
adap3("china")    = 0.53;
adaprho("china")    = 0.4;
adap1("india")    = 20;
adap2("india")    = 0.5;
adap3("india")    = 0.7;
adaprho("india")    = 0.5;
adap1("MEA")    = 100;
adap2("MEA")    = 0.25;
adap3("MEA")    = 0.73;
adaprho("MEA")    = 0.5;
adap1("MEX")    = 4;
adap2("MEX")    = 0.65;
adap3("MEX")    = 0.3;
adaprho("MEX")    = 0.5;
adap1("Africa")    = 30;
adap2("Africa")    = 0.56;
adap3("Africa")    = 0.4;
adaprho("Africa")    = 0.4;
adap1("CLA")    = 375;
adap2("CLA")    = 0.36;
adap3("CLA")    = 0.65;
adaprho("CLA")    = 0.4;
adap1("BRA")    = 68;
adap2("BRA")    = 0.45;
adap3("BRA")    = 0.55;
adaprho("BRA")    = 0.6;
adap1("OAS")    = 330;
adap2("OAS")    = 0.35;
adap3("OAS")    = 0.46;
adaprho("OAS")    = 0.4;
*$endif.adapt
*
*$endif.dam
$ontext
* adap1
adap1("usa")    = 800;
adap1("weur")   = 8500;
adap1("jsk")    = 10000;
adap1("can")    = 8500;
adap1("anz")    = 130;
adap1("OEA")    = 1800;
adap1("RUS")    = 450;
adap1("china")  = 320;
adap1("india")  = 130;
adap1("MEA")    = 80;
adap1("mex")    = 300;
adap1("Africa") = 180;
adap1("CLA")    = 700;
adap1("BRA")    = 200;
adap1("OAS")    = 190;

* adap2
adap2("usa")    = 0.4;
adap2("weur")   = 0.4;
adap2("jsk")    = 0.35;
adap2("can")    = 0.4;
adap2("anz")    = 0.6;
adap2("OEA")    = 0.5;
adap2("RUS")    = 0.7;
adap2("china")  = 0.55;
adap2("india")  = 0.6;
adap2("MEA")    = 0.6;
adap2("mex")    = 0.6;
adap2("Africa") = 0.4;
adap2("CLA")    = 0.3;
adap2("BRA")    = 0.4;
adap2("OAS")    = 0.4;

$offtext

* 1-adap2
*1-adap2("Africa") =   0.6   ;
*1-adap2("weur" ) =   0.6   ;
*1-adap2("USA"  ) =   0.7   ;
*1-adap2("RUS"  ) =   0.3   ;
*1-adap2("OEA"  ) =  0.55   ;
*1-adap2("OAS"  ) =   0.6   ;
*1-adap2("MEX"  ) =   0.7   ;
*1-adap2("MEA"  ) =   0.4   ;
*1-adap2("JSK"  ) =  0.65   ;
*1-adap2("India") =   0.4   ;
*1-adap2("CLA"  ) =   0.7   ;
*1-adap2("China") =   0.4   ;
*1-adap2("CAN"  ) =   0.7   ;
*1-adap2("BRA"  ) =   0.6   ;
*1-adap2("ANZ"  ) =   0.6   ;
$ontext
* adaprho
adaprho("Africa") =  0.4   ;
adaprho("weur" ) =   0.4   ;
adaprho("USA"  ) =   0.4   ;
adaprho("RUS"  ) =   0.5   ;
adaprho("OEA"  ) =   0.4   ;
adaprho("OAS"  ) =   0.4   ;
adaprho("MEX"  ) =   0.4   ;
adaprho("MEA"  ) =   0.4   ;
adaprho("JSK"  ) =   0.4   ;
adaprho("India") =   0.4   ;
adaprho("CLA"  ) =   0.4   ;
adaprho("China") =   0.4   ;
adaprho("CAN"  ) =   0.4   ;
adaprho("BRA"  ) =   0.4   ;
adaprho("ANZ"  ) =   0.4   ;

* adap3
adap3("Africa") =   0.95 ;
adap3("weur" ) =    1    ;
adap3("USA"  ) =    1    ;
adap3("RUS"  ) =    0.95;
adap3("OEA"  ) =    0.95 ;
adap3("OAS"  ) =    1    ;
adap3("MEX"  ) =    0.95    ;
adap3("MEA"  ) =    1    ;
adap3("JSK"  ) =    1    ;
adap3("India") =    1.1  ;
adap3("CLA"  ) =    1    ;
adap3("China") =    0.95 ;
adap3("CAN"  ) =    1    ;
adap3("BRA"  ) =   0.95  ;
adap3("ANZ"  ) =   0.9   ;
$offtext