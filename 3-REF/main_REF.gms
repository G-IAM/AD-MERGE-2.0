$TITLE  MERGE 5

$include ./Input/ref-m.gms
$if not set flex    $abort "Missing flex parameter."
$if not set ctax    $abort "Missing cyax parameter."
$if not set lag1    $abort "Missing lag1 parameter."
$if not set rfconv  $abort "Missing rfconv parameter."
$if not set conlim  $abort "Missing conlim parameter."
$if not set caselim $abort "Missing caselim parameter."
$if not set lbd     $abort "Missing lbd parameter."
$if not set abate   $abort "Missing abate parameter."
$if not set sinks   $abort "Missing sinks parameter."
$if not set initghg $abort "Missing initghg parameter."
$if not set cse     $abort "Missing cse parameter."
$OFFSYMXREF OFFSYMLIST
$OnEmpty OnMulti OffListing
$include ./Solve/Solver.gms
$set ModulePath ./Modules/Definitions
$batinclude %ModulePath%/Sets/Sets_includes.gms
$include ./Modules/Definitions/Parameters/Param_include.gms
$set ModulePath ./Modules/Declerations
$batinclude %ModulePath%/Dec_includes.gms
$set ModulePath ./Modules/Definitions
$batinclude %ModulePath%/Equations/eqs_includes.gms                     
$include ./Solve/Solve_iter.gms






