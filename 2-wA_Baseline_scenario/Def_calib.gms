Parameter
calib_res(*,rg,tp)




;


$gdxin calib_vals
$load  calib_res
SAD.FX(rg,"2015",sw) = 0.00001;
FAD.FX(rg,"2015",sw) = 0.0001;
IAD.fx(rg,"2015",sw) = 0.0001;
  gd.l(rg,tp,"sw1")  =   calib_res("gd",rg,tp)   ;
  rd.l(rg,tp,"sw1")  =   calib_res("rd",rg,tp)   ;
  fad.l(rg,tp,"sw1") =   calib_res("fad",rg,tp) ;
  iad.l(rg,tp,"sw1") =   calib_res("iad",rg,tp) ;
 adap.l(rg,tp,"sw1") =   calib_res("adap",rg,tp);
  sad.l(rg,tp,"sw1") =   calib_res("sad",rg,tp) ;
k.l(rg,tp,"sw1")     =   calib_res("k",rg,tp)     ;
 kn.l(rg,tp,"sw1")   =   calib_res("kn",rg,tp)   ;
e.l(rg,tp,"sw1")     =   calib_res("e",rg,tp)     ;
en.l(rg,tp,"sw1")   =    calib_res("en",rg,tp)   ;
n.l(rg,tp,"sw1")     =   calib_res("n",rg,tp)     ;
nn.l(rg,tp,"sw1")   =    calib_res("nn",rg,tp)   ;
ec.l(rg,tp,"sw1")   =    calib_res("ec",rg,tp)   ;


*****************11111******************************************************





adap1("USA")    = 400;
adap2("USA")    = 0.45;
adap3("USA")    = 0.55;
adaprho("USA")    = 0.4;



adap1("weur")    = 2000;
adap2("weur")    = 0.43;
adap3("weur")    = 0.51;
adaprho("weur")    = 0.5;







adap1("JSK")    = 4000;
adap2("JSK")    = 0.28;
adap3("JSK")    = 0.93;
adaprho("JSK")    = 0.44;


adap1("CAN")    = 320;
adap2("CAN")    = 0.4;
adap3("CAN")    = 0.7;
adaprho("CAN")    = 0.4;




adap1("ANz")    = 15;
adap2("ANz")    = 0.37;
adap3("ANz")    = 0.4;
adaprho("ANz")    = 0.5;


adap1("OEA")    = 700;
adap2("OEA")    = 0.55;
adap3("OEA")    = 0.6;
adaprho("OEA")    = 0.4;


adap1("RUS")    = 130;
adap2("RUS")    = 0.5;
adap3("RUS")    = 0.7;
adaprho("RUS")    = 0.5;



adap1("China")    = 190;
adap2("China")    = 0.35;
adap3("china")    = 0.53;
adaprho("china")    = 0.4;


adap1("india")    = 10;
adap2("india")    = 0.5;
adap3("india")    = 0.7;
adaprho("india")    = 0.5;




adap1("MEA")    = 100;
adap2("MEA")    = 0.25;
adap3("MEA")    = 0.7;
adaprho("MEA")    = 0.5;



adap1("MEX")    = 4;
adap2("MEX")    = 0.65;
adap3("MEX")    = 0.3;
adaprho("MEX")    = 0.5;





adap1("Africa")    = 30;
adap2("Africa")    = 0.56;
adap3("Africa")    = 0.4;
adaprho("Africa")    = 0.4;



adap1("CLA")    = 375;
adap2("CLA")    = 0.36;
adap3("CLA")    = 0.65;
adaprho("CLA")    = 0.4;






adap1("BRA")    = 68;
adap2("BRA")    = 0.45;
adap3("BRA")    = 0.55;
adaprho("BRA")    = 0.6;








adap1("OAS")    = 330;
adap2("OAS")    = 0.35;
adap3("OAS")    = 0.5;
adaprho("OAS")    = 0.4;
