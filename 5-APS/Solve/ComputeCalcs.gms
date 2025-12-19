* Macro #1: Computation of PVPI
$macro computePVPI      PVPI(trd,pp,sw)$(ST(pp,sw))=ABS(TRDBAL.m(pp,trd,sw)/TRDBAL.m("2020","NMR","SW1"))

* Macro #2: The first part of computing NWT
$macro computeNWTpart1  NWT(rg)=SUM((pp,sw)$(ST(pp,sw)),PVPI("NMR",pp,sw)*C.L(rg,pp,sw) + SUM(trd, PVPI(trd,pp,sw)*NTX.L(trd,pp,rg,sw)) )

* Macro #3: The second part of computing NWT
$macro computeNWTpart2  NWT(rg)=NWT(rg)/SUM(r, NWT(r))

* Macro #4: Computation of TAXREV
$macro computeTAXREV    TAXREV(rg,tp,sw)$(ST(tp,sw))=XNTAX(rg)*N.L(rg,tp,sw) +XETAX(rg)*E.L(rg,tp,sw) +CTAX(tp,rg)*CLEV.L(tp,rg,sw)

* Macro #5: Computation of NWTITR
$macro computeNWTITR    NWTITR(ITER,RG)       = NWT(RG);

* Macro #5: Computation of NWTITR
$macro computeEquil    equil = SUM(RG, ABS(NWTITR(ITER-1,RG) - NWT(RG)));
     

* Macro #6: Computation of NWTITR
$macro computeTAXITR    TAXITR(RG,TP,ITER,SW) = TAXREV(RG,TP,SW);