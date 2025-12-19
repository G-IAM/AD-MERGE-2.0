PARAMETER
    prob(*)     Probability of each state of world
                /sw1   1.0/;
SCALARS
    arbm        Arbitrary multiplier on utility in last time period
                / 3/
    res         Period of resolution
                /2015/
*   Need following scalar to calibrate equilibrium tolerance
    equil       Equilibrium tolerance
                /100/;
TABLE  fyr(*,*)  First Year of Time Period
                    fy
           2015    2015
           2020    2020
           2025    2025
           2030    2030
           2035    2035
           2040    2040
           2050    2050
           2060    2060
           2070    2070
           2080    2080
           2090    2090
           2100    2100
           2110    2110
           2120    2120
           2130    2130
           2140    2140
           2150    2150
           2160    2160
           2170    2170
           2180    2180
           2190    2190
           2200    2200
           2210    2210;
PARAMETERS
    te(tp)          Years elapsed since beginning of first period
    nyper(tp)       Number of years in a given period - forward diff;

LOOP(tbase,
     te(tp) = fyr(tp,"fy") - fyr(tbase, "fy")
    );

nyper(tp) = te(tp+1) - te(tp);
nyper(tp)$(ord(tp) eq card(tp)) = nyper(tp-1);

PARAMETERS
yb(yr,tp)    Years belonging to period tp ;

yb(yr+10,tp) = yes$(((ord(yr) ge (te(tp) + 1)) and ( ord(yr) lt (te(tp+1) + 1)))
                  or ((ord(yr) eq card(yr)) and (ord(tp) eq card(tp))));
display te, yb;

TABLE st(* ,* )  Combinations of sw and tp requiring constraints
                      sw1   sw2
           2005       1
           2015       1
           2020       1
           2025       1
           2030       1
           2035       1     1
           2040       1     1
           2050       1     1
           2060       1     1
           2070       1     1
           2080       1     1
           2090       1     1
           2095       1     1
           2100       1     1
           2110       1     1
           2120       1     1
           2130       1     1
           2140       1     1
           2150       1     1
           2160       1     1
           2170       1     1
           2180       1     1
           2190       1     1
           2200       1     1
           2210       1     1;
LOOP((tp,sw)$((ord(sw) ne 1) $(fyr(tp,"fy") le res)),
   st(tp,sw) = 0;
);

