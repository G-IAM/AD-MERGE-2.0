POSITIVE VARIABLES

    K(rg,tp,sw)           capital stock
    KN(rg,tp,sw)          new capital stock
    Y(rg,tp,sw)           production
    YN(rg,tp,sw)          new production
    E(rg,tp,sw)           electric energy    
    EN(rg,tp,sw)          new electric energy
    N(rg,tp,sw)           non-electric energy
    NN(rg,tp,sw)          new non-electric energy
    PE(et,*,*,rg,sw)      production of electric energy - tkwh
    PE_W(etwindon,wind_class,wind_dist,*,ts,rg,sw) production of electric energy with Wind technologies - tkwh
    PE_Woff(etwindoff,wind_class,wind_depth,wind_dist,*,ts,rg,sw) production of electric energy with Wind offshore technologies - tkwh
    PE_S(etsolar,solar_class,solar_dist,*,ts,rg,sw) production of electric energy with Solar technologies - tkwh
    PH(ht,tp,rg,sw)       production of hydrogen - exaj
    CPE(tp,sw)            cumulative global production of lbde - electric energy - tkwh
    CPN(tp,sw)            cumulative global production of lbdn - nonelectric energy - exaj
    PN(nt,tp,rg,sw)       production of nonelectric energy - exaj
    PNF(ura,tp,rg,sw)     production of nuc energy - exaj
    MOX(tp,rg,sw)         production of fuel energy - exaj
    DU(tp,rg,sw)          Stocks of Depleted ura - ktons
    RepU(tp,rg,sw)        Stocks of Re-ura - tons
    W(tp,rg,sw)           Waste production of NPPs - ktons
    Pu(tp,rg,sw)          Stocks of pu from SNF - ktons
    FP(tp,rg,sw)          Stocks of FPs - ktons
    GASNON(tp,rg,sw)      gas consumed to meet nonelectric demands
    OILNON(tp,rg,sw)      oil consumed to meet nonelectric demands
    URSC(rg,x,tp,sw)      undiscovered resources
    URSCURA(rg,ura,tp,sw) undiscovered ura resources
    PRSV(rg,x,tp,sw)      proven reserves
    PRSVURA(rg,ura,tp,sw) proven ura reserves
    RA(rg,x,tp,sw)        reserve additions
    RAURA(rg,ura,tp,sw)   ura reserve additions
    PRSV(rg,x,tp,sw)      proven reserves
    RA(rg,x,tp,sw)        reserve additions
    EISS(tp,rg,sw)        eis supply - domestic
    C(rg,tp,sw)           consumption - trillion dollars
    I(rg,tp,sw)           investment - trillion dollars
    CLEV(tp,rg,sw)        energy related carbon emissions level - billion tons
    MLEV(tp,rg,sw)        total CH4 emissions level - billion tons
    OLEV(o2g,tp,rg,sw)    other GHG total emissions level - billion tons
    DC(rg,tp,sw)          delay carbon utilization - billion tons
    CRLX(tp,rg,sw)        carbon limit relaxation - billion tons
    ABATE(ghg,abx,tp,rg,sw) greenhouse gas abatement - billion tce
    AFF(sy,ps,sw)         afforestation scenario - fraction adopted
    DAC(tp,rg,ps,sw)      DACCS scenario - fraction adopted
    EXPRT(trd,tp,rg,sw)   exports
    EM(ghg,tp,sw)         world energy-related emissions - billion tons
    TOTEM(ghg,tp,sw)      total world emissions (energy and non-energy less abatement)
    TOTRGEM(tp,rg,sw)     total regional emissions of GHG in billion tce
    CO2(box,tp,sw)        stock of CO2 in each box at time tp
    S(ghg,tp,sw)          atmospheric stock of each greenhouse gas
    SMINUS(ghg,tp,sw)     atmospheric stock of each greenhouse gas minus equilibrium stock
    PT(tp,sw)             potential temperature increase from 1750
    ATP(tp,sw)            actual temperature increase from 2015
    MD(rg,tp,sw)          market damages - trillion dollars
;

VARIABLES
    NWEL                  negishi welfare
    EC(rg,tp,sw)          energy cost - trillion dollars
    NTX(trd,tp,rg,sw)     net exports
    GD(rg,tp,sw)          Gross damages
;

POSITIVE VARIABLES
    FAD(rg,tp,sw)    Flow adaptation expenditures
    IAD(rg,tp,sw)    Investment in adaptation capital
    P(rg,tp,sw)      Adaptation level
    SAD(rg,tp,sw)    Stock of adaptation capital
;
VARIABLES
    GD(rg,tp,sw)     Gross damages
    RD(rg,tp,sw)     Residual damages
    ADAP(rg,tp,sw)   Fraction of gross damages reduced through adaptation
;