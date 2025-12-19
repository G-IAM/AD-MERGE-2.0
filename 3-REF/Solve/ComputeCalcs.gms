$macro computePVPI      PVPI(trd,pp,sw)$(ST(pp,sw))=ABS(TRDBAL.m(pp,trd,sw)/TRDBAL.m("2020","NMR","SW1"))
$macro computeNWTpart1  NWT(rg)=SUM((pp,sw)$(ST(pp,sw)),PVPI("NMR",pp,sw)*C.L(rg,pp,sw) + SUM(trd, PVPI(trd,pp,sw)*NTX.L(trd,pp,rg,sw)) )
$macro computeNWTpart2  NWT(rg)=NWT(rg)/SUM(r, NWT(r))
$macro computeTAXREV    TAXREV(rg,tp,sw)$(ST(tp,sw))=XNTAX(rg)*N.L(rg,tp,sw) +XETAX(rg)*E.L(rg,tp,sw) +CTAX(tp,rg)*CLEV.L(tp,rg,sw)
$macro computeNWTITR    NWTITR(ITER,RG)       = NWT(RG);
$macro computeEquil    equil = SUM(RG, ABS(NWTITR(ITER-1,RG) - NWT(RG)));
$macro computeTAXITR    TAXITR(RG,TP,ITER,SW) = TAXREV(RG,TP,SW);