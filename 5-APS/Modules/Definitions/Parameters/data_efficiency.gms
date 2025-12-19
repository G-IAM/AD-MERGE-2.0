* --- Base definition (all regions, all years)
AEEI(tp,rg) = aeeiDefault * (GROW(tp,rg) - PGRO(tp,rg));
* --- ANB-specific year overrides (take precedence)
AEEI("2015",rg)$anb(rg) = 0.70 * (GROW("2015",rg) - PGRO("2015",rg));
AEEI("2020",rg)$anb(rg) = 0.60 * (GROW("2020",rg) - PGRO("2015",rg));
* --- Override by region coefficient where provided
AEEI(tp,rg)$aeeiCoef(rg) = aeeiCoef(rg) * GROW(tp,rg) - PGRO(tp,rg);

OPTION DECIMALS = 3;
DISPLAY AEEI;

GROW(tp,rg)  = .01 * GROW(tp,rg);
PGRO(tp,rg)  = .01 * PGRO(tp,rg);
AEEI(tp,rg)  = .01 * AEEI(tp,rg);
