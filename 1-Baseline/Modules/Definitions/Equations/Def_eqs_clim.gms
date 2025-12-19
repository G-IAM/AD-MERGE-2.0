carlev(rg,pp,sw)$st(pp,sw)..

              sum((et,ts), cece(et,pp,rg)*PE(et,pp,ts,rg,sw))

                    + cecn("oil",pp,rg)  *  OILNON(pp,rg,sw)

                    + cecn("gas",pp,rg)  *  GASNON(pp,rg,sw)

                    + cecn("cldu",pp,rg) *  PN("cldu",pp,rg,sw)

                    + cecn("synf",pp,rg) *  PN("synf",pp,rg,sw)
                    
                    + cech("coal-h2",pp,rg) * PH("coal-h2",pp,rg,sw)
                    + cech("coal-h2-CCS",pp,rg) * PH("coal-h2-CCS",pp,rg,sw)
                     
                    + cech("gas-h2",pp,rg) * PH("gas-h2",pp,rg,sw)
                    + cech("gas-h2-CCS",pp,rg) * PH("gas-h2-CCS",pp,rg,sw)



                    + fos("carbdif",rg)

                    =e=  CLEV(pp,rg,sw) + CRLX(pp,rg,sw);


fracsum(sw)..    SUM((sy,ps) , AFF(sy,ps,sw)) =l=  1;



metlev(rg,pp,sw)$st(pp,sw)..

MLEV(pp,rg,sw) =e= 0.001 * bch4gas(pp,rg) * sum(gasc, PN(gasc, pp,rg,sw)) + bline("ch4",pp,rg)/gwp("ch4");


othlev(o2g,rg,pp,sw)$st(pp,sw)..

OLEV(o2g,pp,rg,sw) =e= bline(o2g,pp,rg)/gwp(o2g);


* ------------------------------------------------------------------------------*
*  This section contains the equation definitions from CSE.TAB
* ------------------------------------------------------------------------------*


clevbd(tp+1,rg,sw)$st(tp+1,sw)..
$ifthenI %cse% == REF

                              0  =e=  0;

$else

            CLEV(tp+1,rg,sw)

          + NTX("crt",tp+1,rg,sw)

          + MLEV(tp+1,rg,sw)*gwp("ch4")

          + sum(o2g, OLEV(o2g,tp+1,rg,sw)*gwp(o2g))

          - sum((ogg,abx), ABATE(ogg,abx,tp+1,rg,sw))

            =l=
            carlim(sw,tp+1,rg)

          + sum(ogg, ogglim(ogg,tp+1,rg)*gwp(ogg))

            ;
$endif

shares(rg,tp,sw)$st(tp,sw)..
                              0  =e=  0;


wcardf(pp,sw)$st(pp,sw)..

                 EM("co2",pp,sw) =e=

                 sum(rg, CLEV(pp,rg,sw));


* ------------------------------------------------------------------------------*
*  End of CSE.TAB
* ------------------------------------------------------------------------------*


wch4df(pp,sw)$st(pp,sw)..

         1000 * EM("ch4",pp,sw) =e=

                sum(rg,

                    bch4gas(pp,rg) * sum(gasc, PN(gasc, pp,rg,sw)));



totemit(ghg,pp,sw)$st(pp,sw)..

      TOTEM(ghg,pp,sw)  =e=

                  EM(ghg,pp,sw)    + nonem(ghg,pp)

                  + sum(rg, bline(ghg,pp,rg))/gwp(ghg)

                  - SUM((sy,ps) , cab(sy,pp,ps) * AFF(sy,ps,sw)) * co2fac(ghg)

                  - sum((abx,rg), ABATE(ghg,abx,pp,rg,sw))/gwp(ghg);


totrgemit(pp,rg,sw)$st(pp,sw)..

   TOTRGEM(pp,rg,sw) =e=

             CLEV(pp,rg,sw)


           + MLEV(pp,rg,sw)*gwp("ch4")

           + sum(o2g, OLEV(o2g,pp,rg,sw)*gwp(o2g))

           - sum((ogg,abx), ABATE(ogg,abx,pp,rg,sw))

           ;



co2box(box,tp+1,sw)$st(tp+1,sw)..

   CO2(box,tp+1,sw) - decay2(tp,box)*frac(box)*.5*TOTEM("co2",tp+1,sw)  =e=

   CO2(box,tp,sw) * decay1(box)**nyper(tp) +

                      decay2(tp,box)*frac(box)*.5*TOTEM("co2",tp,sw);



co2stock(tp,sw)$st(tp,sw)..

                 S("co2",tp,sw)  =e=

                 sum(box, CO2(box,tp,sw)) + nco2;


ostockm(ghg,tp,sw)$((ord(ghg) ne 1) and st(tp,sw))..

     SMINUS(ghg,tp,sw)  =e=  S(ghg,tp,sw) - eqstock(ghg);

ostock(ghg,tp+1,sw)$((ord(ghg) ne 1) and st(tp+1,sw))..

     SMINUS(ghg,tp+1,sw) - odecay2(tp,ghg) * .5 * TOTEM(ghg,tp+1,sw) =e=

     SMINUS(ghg,tp,sw)  *  odecay1(ghg)**nyper(tp)

                        +  odecay2(tp,ghg) * .5 * TOTEM(ghg,tp,sw);




ptdf(pp,sw)$st(pp,sw)..

                  PT(pp,sw) =e=

  rfconv(sw) * ( rfbase


             + (rffac("co2") * log(S("co2",pp,sw)/basestock("co2")))


             + sum(ghg$(ord(ghg) ge 2),

                   inter(ghg) * rffac(ghg)* (

                                             (sm(ghg)*S(ghg,pp,sw))**rfex

                                           - (sm(ghg)*basestock(ghg))**rfex))

             + sum(ghg$(ord(ghg) ge 4),
                rffac(ghg)  *  (S(ghg,pp,sw) - basestock(ghg)))

           )

           - cool(pp,sw) + cool("2015",sw) ;



atdf(tp+1,sw)$st(tp+1,sw)..

           ATP(tp+1,sw) - lag2(tp) * .5 * PT(tp+1,sw) =e=

           ATP(tp,sw) * (1-lag1)**nyper(tp)

                        + lag2(tp) * .5 * PT(tp,sw);



atin(tp30+1,sw) $ st(tp30+1,sw) ..

*OB/2009-01:
*           ATP(tp30+1,sw) =l=  ATP(tp30,sw) + atdinc(tp30,sw);
           ATP(tp30+1,sw) =l=  ATP(tp30,sw) + atdinc(tp30+1,sw);
