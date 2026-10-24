%macro jnr_gretlEnd(
    return=
   )/des="execute gretl script";
run;
  %local pth;
  %let pth=%sysfunc(pathname(work));

  filename rut pipe "gretlcli -b &pth/gretl_resolve.inp > &pth/report.txt 2>&1";
run;quit;
  run;quit;
  data _null_;
    infile rut;
    input;
    putlog _infile_;
    file print;
    put _infile_;
  run;

  data _null_;
    infile "&pth/report.txt";
    input;
    file print;
    put _infile_;
  run;

  filename rut clear;

  * use the clipboard to create macro variable;
  %if "&return" ^= "" %then %do;
    filename clip clipbrd;
    data _null_;
     infile clip;  /*--- created from the SPSS script ---*/
     input;
     putlog "*******  " _infile_ "  ********";
     call symputx("&return",_infile_,"G");
    run;quit;
  %end;

%mend jnr_gretlEnd;
