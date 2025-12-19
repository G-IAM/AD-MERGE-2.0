EQGD(rg,pp,sw)..

GD(rg,pp,sw) =e= ALPHA(rg)*(ATP(pp,sw)+0.90)**ALPHA1(rg)+ ALPHA2(rg)*(ATP(pp,sw)+0.90)**ALPHA3(rg);

marketd(rg,pp,sw)$st(pp,sw)..
MD(rg,pp,sw)  =e=  potgdp(pp,rg)*(RD(rg,pp,sw) + IAD(rg,pp,sw) + FAD(rg,pp,sw));



EQRD(rg,pp,sw)..
RD(rg,pp,sw) =e= (1/(1+P(rg,pp,sw)))*GD(rg,pp,sw);

EQPC(rg,pp,sw)..
P(rg,pp,sw) =e=
adap1(rg)*(((adap2(rg)*(FAD(rg,pp,sw)**adaprho(rg)))+((1-adap2(rg))*(SAD(rg,pp,sw)**adaprho(rg))))**(adap3(rg)/adaprho(rg)));

EQADAP(rg,pp,sw)..
ADAP(rg,pp,sw) =e= (GD(rg,pp,sw) - RD(rg,pp,sw)) / (0.00000001+GD(rg,pp,sw));

SSAD(tp+1,rg,sw)..
SAD(rg,tp+1,sw) =e= SAD(rg,tp,sw)*(1-0.1)**(NYPER(TP))+IAD(rg,tp,sw);

SAD.FX(rg,"2015",sw) = 0.0000001;
FAD.FX(rg,"2015",sw) = 0.0000001;
IAD.fx(rg,"2015",sw) = 0.0000001;
FAD.lo(rg,pp,sw) = 0.0000001;
SAD.lo(rg,pp,sw) = 0.000000001;
P.lo(rg,pp,sw)  = 0.00000000001;
P.up(rg,pp,sw)  = 1000.0;

