$include "Def_calib"

LOOP(ITER$(ORD(ITER) EQ 2),

     SOLVE M5 MAXIMIZING NWEL USING NLP;
    PVPI(TRD,PP,SW)$(ST(PP,SW))
             = ABS(TRDBAL.M(PP,TRD,SW)/TRDBAL.M("2020","NMR","SW1"));

     NWT(RG) = SUM((PP,SW)$(ST(PP,SW)),
                         PVPI("NMR",PP,SW)*C.L(RG,PP,SW)
                       + SUM(TRD, PVPI(TRD,PP,SW)*NTX.L(TRD,PP,RG,SW)));

     NWT(RG) = NWT(RG) / SUM(R, NWT(R));

     TAXREV(RG,TP,SW)$(ST(TP,SW)) =
                            XNTAX(RG)*N.L(RG,TP,SW)
                          + XETAX(RG)*E.L(RG,TP,SW)
                          + CTAX(TP,RG)*CLEV.L(TP,RG,SW);

     NWTITR(ITER,RG)       = NWT(RG);
     TAXITR(RG,TP,ITER,SW) = TAXREV(RG,TP,SW);
DISPLAY NWTITR;

    );


LOOP(ITER$((ORD(ITER) GT 2) $(ORD(ITER) LT CARD(ITER)) $(equil GT 2e-5)),
     SOLVE M5 MAXIMIZING NWEL USING NLP;
     PVPI(TRD,PP,SW)$(ST(PP,SW))
             = ABS(TRDBAL.M(PP,TRD,SW)/TRDBAL.M("2020","NMR","SW1"));
     NWT(RG) = SUM((PP,SW)$(ST(PP,SW)),
                         PVPI("NMR",PP,SW)*C.L(RG,PP,SW)
                       + SUM(TRD, PVPI(TRD,PP,SW)*NTX.L(TRD,PP,RG,SW)));
     NWT(RG) = NWT(RG) / SUM(R, NWT(R));
     TAXREV(RG,TP,SW)$(ST(TP,SW)) =
                            XNTAX(RG)*N.L(RG,TP,SW)
                          + XETAX(RG)*E.L(RG,TP,SW)
                          + CTAX(TP,RG)*CLEV.L(TP,RG,SW);

     equil = SUM(RG, ABS(NWTITR(ITER-1,RG) - NWT(RG)));
     NWTITR(ITER,RG)       = NWT(RG);
     TAXITR(RG,TP,ITER,SW) = TAXREV(RG,TP,SW);
DISPLAY NWTITR;
    );


LOOP(ITER$((ORD(ITER) EQ CARD(ITER)) $(equil GT 2e-5)),
     SOLVE M5 MAXIMIZING NWEL USING NLP;
     PVPI(TRD,PP,SW)$(ST(PP,SW))
             = ABS(TRDBAL.M(PP,TRD,SW)/TRDBAL.M("2020","NMR","SW1"));
     NWT(RG) = SUM((PP,SW)$(ST(PP,SW)),
                         PVPI("NMR",PP,SW)*C.L(RG,PP,SW)
                       + SUM(TRD, PVPI(TRD,PP,SW)*NTX.L(TRD,PP,RG,SW)));
     NWT(RG) = NWT(RG) / SUM(R, NWT(R));
     TAXREV(RG,TP,SW)$(ST(TP,SW)) =
                            XNTAX(RG)*N.L(RG,TP,SW)
                          + XETAX(RG)*E.L(RG,TP,SW)
                          + CTAX(TP,RG)*CLEV.L(TP,RG,SW);

     equil = SUM(RG, ABS(NWTITR(ITER-1,RG) - NWT(RG)));
     NWTITR(ITER,RG)       = NWT(RG);
     TAXITR(RG,TP,ITER,SW) = TAXREV(RG,TP,SW);

DISPLAY NWTITR;

    );
    
FAD.lo(rg,pp,sw) = 0.0000001;
IAD.lo(rg,pp,sw) = 0.000001;
IAD.up(rg,pp,sw) = 1;
SAD.lo(rg,pp,sw) = 0.000000001;
FAD.up(rg,pp,sw) = 1;
SAD.up(rg,pp,sw) = 1;



LOOP(ITER$(ORD(ITER) EQ 2),
     SOLVE M5 MAXIMIZING NWEL USING NLP;
     PVPI(TRD,PP,SW)$(ST(PP,SW))
             = ABS(TRDBAL.M(PP,TRD,SW)/TRDBAL.M("2020","NMR","SW1"));
     NWT(RG) = SUM((PP,SW)$(ST(PP,SW)),
                         PVPI("NMR",PP,SW)*C.L(RG,PP,SW)
                       + SUM(TRD, PVPI(TRD,PP,SW)*NTX.L(TRD,PP,RG,SW)));
     NWT(RG) = NWT(RG) / SUM(R, NWT(R));
     TAXREV(RG,TP,SW)$(ST(TP,SW)) =
                            XNTAX(RG)*N.L(RG,TP,SW)
                          + XETAX(RG)*E.L(RG,TP,SW)
                          + CTAX(TP,RG)*CLEV.L(TP,RG,SW);

     NWTITR(ITER,RG)       = NWT(RG);
     TAXITR(RG,TP,ITER,SW) = TAXREV(RG,TP,SW);
DISPLAY NWTITR;
    );
LOOP(ITER$((ORD(ITER) GT 2) $(ORD(ITER) LT CARD(ITER)) $(equil GT 2e-5)),
     SOLVE M5 MAXIMIZING NWEL USING NLP;
     PVPI(TRD,PP,SW)$(ST(PP,SW))
             = ABS(TRDBAL.M(PP,TRD,SW)/TRDBAL.M("2020","NMR","SW1"));
     NWT(RG) = SUM((PP,SW)$(ST(PP,SW)),
                         PVPI("NMR",PP,SW)*C.L(RG,PP,SW)
                       + SUM(TRD, PVPI(TRD,PP,SW)*NTX.L(TRD,PP,RG,SW)));
     NWT(RG) = NWT(RG) / SUM(R, NWT(R));
     TAXREV(RG,TP,SW)$(ST(TP,SW)) =
                            XNTAX(RG)*N.L(RG,TP,SW)
                          + XETAX(RG)*E.L(RG,TP,SW)
                          + CTAX(TP,RG)*CLEV.L(TP,RG,SW);
     equil = SUM(RG, ABS(NWTITR(ITER-1,RG) - NWT(RG)));
     NWTITR(ITER,RG)       = NWT(RG);
     TAXITR(RG,TP,ITER,SW) = TAXREV(RG,TP,SW);
DISPLAY NWTITR;

    );


LOOP(ITER$((ORD(ITER) EQ CARD(ITER)) $(equil GT 2e-5)),
     SOLVE M5 MAXIMIZING NWEL USING NLP;
     PVPI(TRD,PP,SW)$(ST(PP,SW))
             = ABS(TRDBAL.M(PP,TRD,SW)/TRDBAL.M("2020","NMR","SW1"));
     NWT(RG) = SUM((PP,SW)$(ST(PP,SW)),
                         PVPI("NMR",PP,SW)*C.L(RG,PP,SW)
                       + SUM(TRD, PVPI(TRD,PP,SW)*NTX.L(TRD,PP,RG,SW)));
     NWT(RG) = NWT(RG) / SUM(R, NWT(R));
     TAXREV(RG,TP,SW)$(ST(TP,SW)) =
                            XNTAX(RG)*N.L(RG,TP,SW)
                          + XETAX(RG)*E.L(RG,TP,SW)
                          + CTAX(TP,RG)*CLEV.L(TP,RG,SW);

     equil = SUM(RG, ABS(NWTITR(ITER-1,RG) - NWT(RG)));
     NWTITR(ITER,RG)       = NWT(RG);
     TAXITR(RG,TP,ITER,SW) = TAXREV(RG,TP,SW);

DISPLAY NWTITR;
    );
$include "2-report"