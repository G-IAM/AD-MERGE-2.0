EQUATIONS

*   Locking constraints:
    LKK(rg,tp,sw)         locking constraints for K
    LKKN(rg,tp,sw)        locking constraints for KN
    LKY(rg,tp,sw)         locking constraints for Y
    LKYN(rg,tp,sw)        locking constraints for YN
    LKE(rg,tp,sw)         locking constraints for E
    LKEN(rg,tp,sw)        locking constraints for EN
    LKN(rg,tp,sw)         locking constraints for N
    LKNN(rg,tp,sw)        locking constraints for NN
    LKPE(et,tp,ts,rg,sw)     locking constraints for PE
    LKCPE(tp,sw)          locking constraints for CPE
    LKCPN(tp,sw)          locking constraints for CPN
    LKPN(nt,tp,rg,sw)     locking constraints for PN
    LKPNF(ura,tp,ts,rg,sw) locking constraints for PNF
    LKGASNON(tp,rg,sw)    locking constraints for GASNON
    LKOILNON(tp,rg,sw)    locking constraints for OILNON
    LKURSC(rg,x,tp,sw)    locking constraints for URSC
    LKURSCURA(rg,ura,tp,sw)  locking constraints for URSCURA
    LKPRSV(rg,x,tp,sw)    locking constraints for PRSV
    LKPRSVURA(rg,ura,tp,sw)  locking constraints for PRSVURA
    LKRA(rg,x,tp,sw)      locking constraints for RA
    LKRAURA(rg,ura,tp,sw)    locking constraints for RAURA
    LKEISS(tp,rg,sw)      locking constraints for EISS
    LKC(rg,tp,sw)         locking constraints for C
    LKI(rg,tp,sw)         locking constraints for I
    LKCLEV(tp,rg,sw)      locking constraints for CLEV
    LKMLEV(tp,rg,sw)      locking constraints for MLEV
    LKOLEV(o2g,tp,rg,sw)  locking constraints for OLEV
    LKDC(rg,tp,sw)        locking constraints for DC
    LKCRLX(tp,rg,sw)      locking constraints for CRLX
    LKABATE(ghg,abx,tp,rg,sw)     locking constraints for ABATE
    LKAFF(sy,ps,sw)       locking constraints for AFF
    LKEXPRT(trd,tp,rg,sw) locking constraints for EXPRT
    LKATP(tp,sw)          locking constraints for ATP
    LKMD(rg,tp,sw)        locking constraints for MD
    LKEC(rg,tp,sw)        locking constraints for EC
    LKNTX(trd,tp,rg,sw)   locking constraints for 
    LKEM(ghg,tp,sw)       locking constraints for EM
    LKTOTEM(ghg,tp,sw)    locking constraints for TOTEM
    LKTOTRGEM(tp,rg,sw)   locking constraints for TOTRGEM
    LKCO2(box,tp,sw)      locking constraints for CO2
    LKS(ghg,tp,sw)        locking constraints for S
    LKSM(ghg,tp,sw)       locking constraints for SMINUS
    LKPT(tp,sw)           locking constraints for PT
    nweldf                negishi welfare definition
    newcap(rg,tp,sw)      new capital
    newprod(rg,tp,sw)     new production
    newelec(rg,tp,sw)     new electric energy
    newnon(rg,tp,sw)      new non-electric energy
    totalcap(rg,tp,sw)    total capital stock
    totalprod(rg,tp,sw)   total production
    tc(rg,tp,sw)          terminal condition on investment and capital stock
    supelec(*,*,sw)       supply of electricity
    supelecpeak(*,*,sw)   supply of electricity at the peak time
    Prodwindon(*,*,*,sw)      Total production of Electricity with windon
    prodwindoff(*,*,*,sw) Total production of Electricity with windoff
    Prodsolar(etsolar,*,*,*,sw)     Total production of Electricity with solar
    Windonpotential(wind_class,wind_dist,tp,rg,sw)  'Onshore Wind potential [TW]'
    Windoffpotential(wind_class,wind_depth,wind_dist,tp,rg,sw)  'Onshore Wind potential [TW]'
    Solarpotential(solar_class,solar_dist,tp,rg,sw) 'solar PV potential [TW]'
    CSPpotential(solar_class,solar_dist,tp,rg,sw) 'CSP potential [TW]'
    Nuc_SMR_peak(*,*,sw)  Small Modular Reactor peak capacity constraint
    elecgfrac(rg,tp,sw)   gas fraction of electric energy
    supnon(*,*,sw)        supply of non-electric energy
    supgas(*,*,sw)        supply of gas
    supoil(*,*,sw)        supply of oil
    supcoal(*,*,sw)       supply of coal
    supura(*,*,sw)        supply of uranium
    supeis(*,*,sw)        supply of eis
    suphydrogen(rg,*,sw)  Hydrogen balance
    gfrac(rg,tp,sw)       gas fraction of nonelectric energy
    coalpeaksh(rg,tp,sw)  Bound on coal share at peak electricity demand
    flex(*,*,sw)          Flexibility constraint definition
    costnrg(rg,tp,sw)     cost of energy
    cc(rg,tp,sw)          capacity constraint  (Regional Income Accounting formula)
    trdbal(tp,trd,sw)     global trade balance
    ntdef(trd,tp,rg,sw)   triggers definition of positive exports
    dece(rg,tp,dle,sw)    decline rate of dle technologies
    decn(rg,tp,dln,sw)    decline rate of dln technologies
    deco(rg,tp,sw)        decline rate of oilnon
    decg(rg,tp,sw)        decline rate of gasnon
    dech2(ht,rg,tp10,sw)    decline rate of H2
    expe(rg,tp,xle,sw)    expansion rate of xle technologies
    expnuc(rg,tp,etNUC,sw)   expansion rate of nuc technologies
    expg(rg,tp,sw)        expansion rate of xlg technologies
    exph2(rg,tp10,ht,sw)    expansion rate of H2 technologies
    expn(rg,tp,xln,sw)    expansion rate of xln technologies
    cpedf(tp,sw)          cumulative global production of lbde - electric energy
    cpndf(tp,sw)          cumulative global production of lbdn - nonelectric energy
    rscav(rg,tp,x,sw)     undiscovered resources available
    rscuraav(rg,tp,ura,sw)  undiscovered ura-resources available
    rsvav(rg,tp,x,sw)     proven reserves available
    rsvavura(rg,tp,ura,sw)  proven ura reserves availbale
    rdflim(rg,tp,x,sw)    resource depletion limit
    rdfuralim(rg,tp,ura,sw)    uranium resource depletion limit
    prvlim(rg,tp,x,sw)    production-reserve limit
    prvuralim(rg,tp,ura,sw)   ura production-reserve limit
    carlev(rg,tp,sw)      carbon emissions level - billion tons
    metlev(rg,tp,sw)      total CH4 emissions level - billion tons
    othlev(o2g,rg,tp,sw)  other GHG total emissions level - billion tons
    clevbd(tp,rg,sw)      upper bound on annual carbon-equivalent emissions
    shares(rg,tp,sw)      shares in global carbon emissions
    wcardf(tp,sw)         definition of world energy-related co2 emissions
    fracsum(sw)           sum of fractional aforestation programs
    rsvPu(tp,rg,sw)       Reserves of Pu available
    rsvRepU(tp,rg,sw)     Reserves of RepU available
    rsvDU(tp,rg,sw)       Reserves of DU available
    waste(tp,rg,sw)       Quantity of SNF
    rsvFP(tp,rg,sw)       Quantity of FPs in disposal
    expMOX(tp,rg,sw)      Expansion limit of fbr
    prodMOX(tp,rg,sw)     Production de possible
    wch4df(tp,sw)         definition of world energy-related ch4 emissions
    totemit(ghg,tp,sw)    total world emissions for each greenhouse gas
    totrgemit(tp,rg,sw)   total regional emissions of GHG
    co2box(box,tp,sw)     CO2 accumulation in each box
    co2stock(tp,sw)       atmospheric CO2 stock accumulation
    ostock(ghg,tp,sw)     other greenhouse gases stock accumulation
    ostockm(ghg,tp,sw)    other greenhouse gases stock accumulation minus equilibrium stock
    ptdf(tp,sw)           potential temperature definition
    atdf(tp,sw)           actual temperature definition
    atin(tp,sw)           decadal increment in actual temperature
    marketd(rg,tp,sw)     market damages from temperature increase
    EQGD
    EQADAP
    EQPC
    EQRD
    SSAD

;