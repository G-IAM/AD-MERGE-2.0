MODEL M5 /ALL/;
NWTITR("IT0",RG) = NWT(RG);
FAD.fx(rg,pp,sw) = 0.0000001;
IAD.fx(rg,pp,sw) = 0.0000001;

$include ./Solve/ComputeCalcs.gms
LOOP(ITER$(ORD(ITER) EQ 2),
     SOLVE M5 MAXIMIZING NWEL USING NLP;
    computePVPI;
    computeNWTpart1;
    computeNWTpart2;
    computeTAXREV;
    computeNWTITR;
    computeEquil;
    computeTAXITR;
DISPLAY NWTITR;
    );
LOOP(ITER$((ORD(ITER) GT 2) $(ORD(ITER) LT CARD(ITER)) $(equil GT 2e-4)),
     SOLVE M5 MAXIMIZING NWEL USING NLP;
    computePVPI;
    computeNWTpart1;
    computeNWTpart2;
    computeTAXREV;
    computeNWTITR;
    computeEquil;
    computeTAXITR;
$include ./Modules/Declerations/Dec-var-RLDC.gms
DISPLAY NWTITR, equil;
    );
LOOP(ITER$((ORD(ITER) EQ CARD(ITER)) $(equil GT 2e-4)),
     SOLVE M5 MAXIMIZING NWEL USING NLP;
    computePVPI;
    computeNWTpart1;
    computeNWTpart2;
    computeTAXREV;
    computeNWTITR;
    computeEquil;
    computeTAXITR;
$include ./Modules/Declerations/Dec-var-rldc.gms
DISPLAY NWTITR, equil;
    );
$include ./Results/5-report.gms
