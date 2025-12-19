PARAMETERS
    prob(*)         Probability of each state of world
    te(tp)          Years elapsed since beginning of first period
    nyper(tp)       Number of years in a given period - forward diff
    yb(yr,tp)       Years belonging to period tp
    apop(rg)        population parameter a
    bpop(rg)        population parameter b
    cpop(rg)        population parameter c
    yr00(tp)        years after 2015
    YRPC(TP)        YEARS AFTER 2015
    APCL(RG)        PER CAPITA LOGISTIC FUNCTION PARAMETER A
    BPCL(RG)        PER CAPITA LOGISTIC FUNCTION PARAMETER B
    CPCL(RG)        PER CAPITA LOGISTIC FUNCTION PARAMETER C
    MPC(*)
    GROW(tp,rg)     POTENTIAL GDP GROWTH RATES - ANNUAL PERCENT
    PGRO(tp,rg)     POPULATION GROWTH RATES - ANNUAL PERCENT
    AEEI(tp,rg)     AUTONOMOUS ENERGY EFFICIENCY IMPROVEMENT RATE - PERCENT PER YEAR
    CSTEXP(TRD)     UNIT COST OF EXPORTS
    RCL(TP)         RELAX CARBON LIMIT - PENALTY - DOLLARS PER TON
    gwp(ghg)        global warming potential - carbon-equivalence factors
    basestock(ghg)  base year stock of each greenhouse gas - billion tons
    pi(ghg)         percentage of ghg subject to decay
    eqstock(ghg)    equilibrium stock of ghg
    nonem(ghg,tp)   non-energy emissions of each greenhouse gas - billion tons
    nonemgr(ghg)    annual growth rate of non-energy emissions
    rffac(ghg)      multiplicative factor for measuring radiative forcing
    decay1(box)     yearly retention factor for each fraction of carbon (box)
    odecay1(ghg)    yearly retention factor for the other (non-co2) greenhouse gases
    decay2(*,box)   one period retention factor for each co2 box
    odecay2(*,*)    one period retention factor for each non-co2 gas
    FRAC(BOX)       FRACTION OF CO2 EMISSIONS DECAYING WITHIN A CERTAIN BOX
    CO2BASE(BOX)    BASE LEVEL OF CO2 EMISSIONS WITHIN EACH BOX
    INTER(GHG)      % TERM SIMULATING INTERACTIVE SUBTRACTIVE EFFECTS OF CH4&N2O
    SM(GHG)         STOCK MULTIPLIER TERM FOR CH4&N2O - USED FOR RAD. FORCING
    LAG2(tp)        ONE PERIOD TEMPERATURE LAG - COMPOUNDED FROM LAG1
    MDAM(RG)        MARKET DAMAGE MULTIPLIERS - FRACTIONAL GDP LOSS FOR TEMPREF
    MKT(RG)         LATITUDE FACTOR - TEMPERATURE MULTIPLIER FOR MARKET DAMAGES
    WTPTEMP(*)      REFERENCE TEMPERATURE FOR WILLINGNESS TO PAY FUNCTION
    WTPLOSS(*)      REFERENCE LOSS - FRACTIONAL GDP LOSS FOR WTPTEMP AT HIGH INCOMES
    CATT(RG,SW)     CATASTROPHIC TEMPERATURE FOR NON-MARKET EFFECTS
    RFCONV(*)       MULTIPLICATIVE TERM FOR CONVERTING RADIATIVE FORCING TO PT
    sem(sw,*)       world sox emissions - energy-related - million tons of sulfur
    qdir            direct cooling effect of sulfur emissions - watts per square meter
    enat            natural sulfur emissions - million tons per year
    qindir          indirect cooling effect of sulfur emissions - watts per square meter
    cpt(tp,sw)      cooling impact of sulfur on potential temperature - degrees C
    cool(* ,sw)     cooling impact of sulfur on potential temperature - degrees C
    co2fac(ghg)     co2 factor for equations totemit
    ABMLT(*)        ABATEMENT QUANTITY MULTIPLIERS - TECHNICAL PROGRESS
    pctabate(ghg,tp,rg)   maximum percent abatement
    GHGKYOTO(rg)    GHG 2010 regional level in the Kyoto trend scenario
    CO2KYOTO(rg)    CO2 2010 regional level in the Kyoto trend scenario
    krf(rg)         Kyoto Protocol greenhouse gas reduction factor
    sh(*,*)         shares in global carbon emissions
    EEIS(TP,RG)     ELECTRIC ENERGY for Energy-Intensive supply - TKWH
    NEIS(TP,RG)     NONELECTRIC ENERGY for Energy-Intensive supply - EXAJ
    CEIS(TP,RG)     OTHER COSTS for Energy-Intensive supply - BILLION DOLLARS
    HOFRAC(*)       HECKSCHER-OHLIN FRACTION - LINEAR TERM - DOMESTIC NONENERGY INPUTS
    cstred(*)       energy cost reduction factors
    PTDLIM(TP,SW)   UPPER BOUND ON POTENTIAL TEMPERATURE INCREASE FROM 1750
    TYGCL(SW)       UPPER BOUND ON WORLD CARBON EMISSIONS - LAST PERIOD
    ATDLIM(TP,SW)   UPPER BOUND ON ACTUAL TEMPERATURE INCREASE FROM 2015
    ATDINC(TP,SW)   UPPER BOUND ON ACTUAL TEMPERATURE INCREMENTS
    I0(RG)          INITIAL INVESTMENT
    C0(RG)          INITIAL CONSUMPTION
    K0(RG)          INITIAL CAPITAL
    E0(RG)          INITIAL ELECTRIC ENERGY
    N0(RG)          INITIAL NON-ELECTRIC ENERGY
    Y0(RG)          INITIAL OUTPUT
    RHO(RG)         ESUB MINUS ONE DIVIDED BY ESUB
    ACONST(TP,RG)   CONSTANT FOR CAPITAL-LABOR INDEX
    BCONST(TP,RG)   CONSTANT FOR ELECTRIC-NON-ELECTRIC ENERGY INDEX
    WTP(RG,TP,SW)   FRACTIONAL GDP LOSS FOR WTPTEMP AT ALL INCOMES
    HSX(RG,TP,SW)   HOCKEY-STICK EXPONENT
    KGDP(RG)        INITIAL CAPITAL-GDP RATIO
    DEPR(RG)        ANNUAL PERCENT DEPRECIATION
    SPDA(RG)        SPEED OF ADJUSTMENT
    SPEED(TP,RG)    PERIOD ADJUSTMENT SPEED
    PNREF(RG)       REFERENCE PRICE OF NON-ELECTRIC ENERGY - DOLLARS PER GJ
    PEREF(RG)       REFERENCE PRICE OF ELECTRIC ENERGY - MILLS PER KWH
    PNFREF(RG)      REFERENCE PRICE OF NUCLEAR FUEL ENERGY - DOLLARS PER GJ
    ESUB(RG)        ELASTICITY BETWEEN K-L AND E-N
    KPVS(RG)        CAPITAL VALUE SHARE PARAMETER
    ELVS(RG)        ELECTRIC VALUE SHARE PARAMETER
    XNTAX(RG)       EXISTING TAX RATE ON NONELECTRIC ENERGY
    XETAX(RG)       EXISTING TAX RATE ON ELECTRIC ENERGY
    DECF(RG)        MAX DECLINE FACTOR (ANNUAL) FOR PE-DL -  SYNF -  NE-BAK
    DECFO(RG)      MAX DECLINE FACTOR (ANNUAL) FOR Oil non-electric
    DECFH2(RG)      MAX DECLINE FACTOR (ANNUAL) FOR H2
    NSHF(RG)        MAX MARKET SHARE FACTOR FOR EX AND NX TECHNOLOGIES
    EXPF(RG)        MAX EXPANSION FACTOR (ANNUAL) FOR XLE TECHNOLOGIES
    EXPNU(RG)       MAX EXPANSION FACTOR (ANNUAL) FOR ETNUC TECHNOLOGIES
    NXPF(RG)        MAX EXPANSION FACTOR (ANNUAL) FOR XLN TECHNOLOGIES
    HXPF(RG)        MAX EXPANSION FACTOR (ANNUAL) FOR H2 TECHNOLOGIES
    OGPD(RG)        OIL-GAS PRICE DIFFERENTIAL - DOLLARS PER GJ
    CLGDP(RG)       COAL-GNP GROWTH ELASTICITY
    DFACTCURR(TP,RG) CURRENT ANNUAL UTILITY DISCOUNT FACTOR
    UDF(TP,RG)      UTILITY DISCOUNT FACTOR FOR PERIOD TP
    UDFSUM(RG)      UDF NORMALIZING CONSTANT
    L(TP,RG)        CURRENT LABOR FORCE (EFFICIENCY UNITS)
    LN(TP,RG)       LABOR FORCE - NEW VINTAGE
    KL(TP,RG)       CAPITAL-LABOR INDEX
    YREF(TP,RG)     REFERENCE VALUE OF GROSS OUTPUT
    KREF(TP,RG)     REFERENCE VALUE OF CAPITAL
    YCHK(TP,RG)     CHECK VALUE OF GROSS OUTPUT
    EREF(TP,RG)     REFERENCE QUANTITY OF ELECTRICITY - TKWH
    NREF(TP,RG)     REFERENCE QUANTITY OF NONELECTRIC ENERGY
    AEEIFAC(TP,RG)  AEEI FACTOR
    PVPI(TRD,TP,SW) PRESENT VALUE PRICES OF TRADEABLES
    FTPI(SW,TRD,TP) FUTURE VALUE PRICES OF TRADEABLES
    NWT(RG)         NEGISHI WEIGHTS
    elgfrac(RG)              Gas fraction of electricity
    NWTITR(ITER,RG) NEGISHI WEIGHTS AT EACH ITERATION
    TAXREV(RG,TP,SW)  ENERGY TAX REVENUES FOR EACH REGION
    TAXITR(RG,TP,ITER,SW)  TAX REVENUES AT EACH ITERATION
    INICH4LIM(rg)   2000 regional emission levels of CH4 (billion tons)
    ININ2OLIM(rg)   2000 regional emission levels of N2O (billion tons)
    INISLFLIM(rg)   2000 regional emission levels of HFC (million tons)
    INILLFLIM(rg)   2000 regional emission levels of SF6 (million tons)
    alpha(rg)       gross damage parameter 
    alpha1(rg)      gross damage parameter 1
    alpha2(rg)      gross damage parameter 2
    alpha3(rg)      gross damage parameter 3
    adap1(rg)       adaptation CES parameter 1
    adap2(rg)       adaptation CES parameter 2
    adap3(rg)       adaptation CES parameter 3
    adaprho(rg)         CES adaptation parameter
    fyr(*,*)        First Year of Time Period
    st(* ,*)        Combinations of sw and tp requiring constraints
    POP(*,*)        REGIONAL POPULATION - BILLIONS
    POTGDP(*,*)     Potential GDP - market exchange rates - trillion 2015 dollars
    PCGDP(*,*)      POTENTIAL PER CAPITA GDP - THOUSAND DOLLARS - 2015 PURCHASING POWER
    MACRO(MP,*)     MACROECONOMIC AND OTHER PARAMETERS
    OILX(*,*)       OIL EXPORT LIMITS (EXAJ)
    OILM(*,*)       OIL IMPORT LIMITS (EXAJ)
    GASX(*,*)       GAS EXPORT LIMITS (EXAJ)
    GASM(*,*)       GAS IMPORT LIMITS (EXAJ)
    SYNX(*,*)       SYN EXPORT LIMITS (EXAJ)
    SYNM(*,*)       SYN IMPORT LIMITS (EXAJ)
    HYDX(*,*)       HYDROGEN EXPORT LIMITS (EXAJ) 
    HYDM(*,*)       HYDROGEN EXPORT LIMITS (EXAJ)
    EISXL(*,*)      EIS EXPORT LIMITS (BILLION DOLLARS)
    EISML(*,*)      EIS IMPORT LIMITS (BILLION DOLLARS)
    CARXL(*,*)      CARBON EXPORT LIMITS (BILLION TONS)
    CARML(*,*)      CARBON IMPORT LIMITS (BILLION TONS)
    DCLIM(*, *)     ANNUAL LIMITS ON CARBON DELAY ACTIVITIES - BILLION TONS
    CTAX(*,RG)      CARBON TAX - DOLLARS PER TON
    HTRT(ET,TP,RG)     HEAT RATES - GJ PER KWH
    HTRTH2(HT,TP,RG) Hydrogen technologies HEAT RATES - GJ PER GJ
    CECN(*,tp,RG)      CARBON EMISSION COEFFICIENTS - NELE - BILLION TONS PER EXAJ
    CECE(ET,tp,RG)     CARBON EMISSION COEFFICIENTS - ELEC - BILLION TONS PER TWH
    CECH(*,tp,RG)      CARBON EMISSION COEFFICIENTS - Hydrogen techs - BILLION TONS PER EXAJ
    GLOBAL(*,*)     GLOBAL GREENHOUSE GAS FACTORS - BILLION TONS OF GAS
    NYRTP(*,nyr)    Multipliers for calculating DECAY2 and ODECAY2 - number of years in each time period
    PRICE(sy,tp,ps) carbon price vector for scenario ps - start year sy - dollars per ton
    PRICEDAC1(tp,ps) carbon price vector for scenario psdac for tech 1 - start year sydac - dollars per ton
    PRICEDAC2(tp,ps) carbon price vector for scenario psdac for tech 2 - start year sydac - dollars per ton
    HUSC(rg,ps)      Humidity and scale factors for DACCS
    CAB(sy,tp,ps)   annual gain from afforestation - billion tons of carbon
    CABDAC(tp,rg,ps)   annual gain from DACCS - billion tons of carbon
    BLINE(ghg,*,*)  EMISSION BASELINES - NON-ENERGY RELATED - INPUT IN MILLION TCE -  OUTPUT IN BILLION TCE
    ABCST(abx,ghg)  ABATEMENT COSTS - DOLLARS PER TCE
    ABLIM(ghg,abx,*,*) ABATEMENT LIMITS AT ALTERNATIVE COST LEVELS - INPUT IN MILLION TCE -  OUTPUT IN BILLION TCE
    CARBIEO(*,*)    CARBON EMISSIONS - IEO 2003 - REFERENCE CASE - BILLION TONS
    CARLIM(*, *, *) ANNUAL CARBON LIMITS  - BILLION TONS
    OGGLIM(ogg,*,*) Limit on other (non-carbon) greenhouse gases - non-energy emissions - by region - billion tons
    CONLIM(*, *)    CARBON CONCENTRATION LIMITS - PPMV
    REIS(*,*)       ENERGY COEFFICIENTS RELATIVE TO USA
    EISDEMAND(*,*)  EIS DEMANDS
    FOS(*,*)        FOSSIL FUEL CONSUMPTION IN 2015 - QUADS AND EXAJ
    H2C (*,*)     Hydrogen CONSUMPTION IN 2015 and 2020 - ExaJ
    NCAP(NT,*,*)    NONELECTRIC PRODUCTION CAPACITIES - EXAJ
    BCH4GAS         CH4 LEAKAGE PER TON OF NATURAL GAS CONSUMPTION - MILLIONS OF TONS PER EXAJOULE
    C_mod(*,*)      Oil cost modifier
    NCST(NT ,TP, *)    NONELECTRIC COST COEFFICIENTS - $ PER GJ
    URACST(URA,*)   URANIUM COST COEFFICIENTS - $ PER GJ
    CYCOMBCST(CYCSTP,*)     NUCLEAR FUEL CYCLE COST COEFFICIENT - $ PER GJ (NOT EVERYTHING)
    RSV(x,*)        PROVEN RESERVES - EXAJ
    RSVURA(URA,*)   PROVEN RESERVES OF URANIUM - EXAJ
    RSC(x,*)        UNDISCOVERED RESOURCES - EXAJ
    RSCURA(URA,*)   UNDISCOVERED URANIUM RESOURCES - EXAJ
    PRV(x,*)        UPPER BOUNDS ON PRODUCTION-RESERVE RATIOS
    RDF(x,*)        UPPER BOUNDS ON RESOURCE DEPLETION FACTORS
    RDFURA(ura,*)   UPPER BOUNDS ON URANIUM RESOURCE DEPLETION FACTOR
    ELGEN(*,*)      ELECTRICITY GENERATION IN 2015 - TKWH
    ECAP(et,*,rg)   ELECTRICITY GENERATION CAPACITIES - NET - TKWH
    HCAP(HT,*,*)    Hydrogen PRODUCTION CAPACITIES - EXAJ
    ECAPPEAK(et,*,rg)  PEAK ELECTRICITY GENERATION Bounds - NET - TKWH
    windon_pot(wind_class,wind_dist,rg) Onshore wind potential [TW]
    windoff_pot(wind_class,wind_depth,wind_dist,rg) 'Offshore wind potential [TW]'
    Solarpv_pot(solar_class,solar_dist,rg) PV potential [TW]
    CSP_pot(solar_class,solar_dist,rg) 'CSP potential [TW]'
    depth_coef(wind_depth)  coefficient for additional LCOE of wind offshore techs depth 
    peakshare(tp,rg,sw)   Share of peak in total demand
    Res_marg_share(tp,rg,sw)  Share of Res_marg in total demand
    CU(tp,rg,sw)         Curtialment Height Load band of RLDC    
    Residualpeak(tp,rg,sw)  Residual of peak share after short-term storage share - PWh 
    H2curtail(tp,rg,sw)  Remainder of curtailment after short-term storage for H2Curtailment - PWh 
    sscap(tp,rg,sw)    Share of shoret-term storage from Res_marg in total demand
    SSprod(tp,rg,sw)   Production of shoret-term storage from Res_marg in total demand
    ECST(ET ,tp, *)    ELECTRICITY COST COEFFICIENTS - MILLS PER KWH
    H2T(tp, *) Hydrogen COST of transportation - $ PER GJ
    HCST(HT ,tp, *) Hydrogen COST COEFFICIENTS - $ PER GJ
    windCST(etwind,wind_class,wind_dist,tp,*)  wind ELECTRICITY COST COEFFICIENTS - MILLS PER KWH ($ per MWh)
    SolarCST(etsolar,solar_class,solar_dist,tp,*)  Solar ELECTRICITY COST COEFFICIENTS - MILLS PER KWH ($ per MWh)
    QECST(et,tp,rg)    QUADRATIC ELECTRICITY COST COEFFICIENTS - MILLS PER KWH
    tot_cost_SS(tp,rg,sw) Total cost of short-term storage (B$)
    TGL1(vre,rg,sw) New Transmission grid line requirement - GW
    TGL2(vre,rg,sw) Transmission grid line requirement - B$
    arbm        Arbitrary multiplier on utility in last time period
    res         Period of resolution
    equil       Equilibrium tolerance
    WORLDNW     WORLD CHECKSUM OF INITIAL NEGISHI WEIGHTS
    SYNTPE      ADJUSTMENT FOR SYNFUELS IN TPE REPORT
    NCO2        PRE-INDUSTRIAL LEVEL OF CO2 ASSUMED NEVER TO DECAY
    FEX         EXPONENTIAL TERM IN N2O&CH4 RAD. FORCING RELATION
    RFBASE      BASE YEAR TERM FOR CONVERTING RAD. FORCING TO PT
    TEMPREF     REFERENCE TEMPERATURE FOR THE MARKET DAMAGE MULTIPIERS
    LAG1        YEARLY LAG USED TO CALCULATE AT FROM PT
    acf         average cost - fraction of marginal cost
    EISELAS     INCOME ELASTICITY OF DEMAND FOR EIS
    inlcn       initial learning cost - $ per GJ
    cpn0        initial cumulative production - GJ
    lrnn        learning parameter
    inlce       initial learning cost - $ per thousand kwh
    cpe0        initial cumulative production - tkwh
    lrne        learning parameter
    LOTOL       TOLERANCE FACTOR FOR LOWER BOUNDS ON MACRO VARIABLES
    EXAJTOMT    CONVERSION FACTOR FROM EXAJ TO MTOE
;
