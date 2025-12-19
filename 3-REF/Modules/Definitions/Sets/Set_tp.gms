
*================================== DATA ======================================*

* -------------------- Set definitions ------------------------*

* ------------------------------------------------------------------------------*
*  This section of the code contains the set definitions
*  (M5.SET + TP.SET + CLIMATE.TAB + FOREST.TAB).
*
*  This GAMS model is designed so that the time intervals may be of unequal
*  length.
* ------------------------------------------------------------------------------*


SETS


 yr           Years
                 /2005*2210/


    tp(yr)       Time periods (starting year)
                 /2015,       2020,       2030,
                              2040, 2050, 2060,
                  2070, 2080, 2090, 2100, 2110,
                  2120, 2130, 2140, 2150, 2160/

    tp10(tp)
                 /            2020,       2030,
                              2040, 2050, 2060,
                  2070, 2080, 2090, 2100, 2110,
                  2120, 2130, 2140, 2150, 2160/

    tp20(tp)
                 /      2030, 2040, 2050, 2060,
                  2070, 2080, 2090, 2100, 2110,
                  2120, 2130, 2140, 2150, 2160/

    tp30(tp)
                 /            2040, 2050, 2060,
                  2070, 2080, 2090, 2100, 2110,
                  2120, 2130, 2140, 2150, 2160/

    tp40(tp)
                 /                  2050, 2060,
                  2070, 2080, 2090, 2100, 2110,
                  2120, 2130, 2140, 2150, 2160/

    tp50(tp)
                 /                        2060,
                 2070, 2080, 2090, 2100, 2110,
                  2120, 2130, 2140, 2150, 2160/

    tp60(tp)
                 /2070, 2080, 2090, 2100, 2110,
                  2120, 2130, 2140, 2150, 2160/

    tp70(tp)
                 /     2080, 2090, 2100, 2110,
                  2120, 2130, 2140, 2150, 2160/

    tp90(tp)
                 /     2100, 2110,
                  2120, 2130, 2140, 2150, 2160/

    tp00(tp)
                 /               2110,
                  2120, 2130, 2140, 2150, 2160/

    lk(tp)       Time periods for which activities are locked (starting year)
                 /2015, 2020, 2030/

    sy(tp)       Start year - afforestation activities
                /2020,       2030,
                              2040, 2050, 2060,
                  2070, 2080, 2090, 2100, 2110,
                  2120, 2130, 2140, 2150, 2160/
                  
    ts          Yearly time slices
                /nonpeak, peak/

    nyr          Years
                 /1*10/

    tbase(tp)    Base year

    pp(tp)       Projection periods (all periods but the base period)

    tperly(tp)   Early years

    tlast(tp)    Last time period

    ylast(yr)    Last year;

tbase(tp)   =  yes$(ord(tp) eq 1);
pp(tp)      =  yes$(ord(tp) ne 1);
tperly(tp)  =  yes$(ord(tp) ne card(tp));
tlast(tp)   =  yes$(ord(tp) eq card(tp));
ylast(yr)   =  yes$(ord(yr) eq card(yr));