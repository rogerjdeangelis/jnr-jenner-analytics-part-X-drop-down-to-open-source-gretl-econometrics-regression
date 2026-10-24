%macro jnr_gretlBegin(
    resolve=Y
    );

  %local pth;
  %let pth=%sysfunc(pathname(work));

  %utlfkil(&pth/gretl_resolve.inp);

  data _null_;
    length _infile_ $255;
    file "&pth/gretl_resolve.inp";
    input;
    if upcase("&resolve")=:"Y" then _infile_=resolve(_infile_);
    put _infile_;
    putlog _infile_;

%mend jnr_gretlBegin;
