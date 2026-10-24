# jnr-jenner-analytics-part-X-drop-down-to-open-source-gretl-econometrics-regression
Jenner Analytics part X drop down to open source gretl econometrics regression
    /*---
    c:/utl/jnr-jenner-analytics-part-X-drop-down-to-open-source-gretl-econometrics-regression.sas;
    ---*/
    
    Jenner Analytics part X drop down to open source gretl econometrics regression
    
    Too long to post, see
    https://github.com/rogerjdeangelis/jnr-jenner-analytics-part-X-drop-down-to-open-source-gretl-econometrics-regression
    
    gretl free software
    https://sourceforge.net/projects/gretl/postdownload
    
    
    Gretl is an established specialist statistical package with an active international community,
    particularly around econometrics and teaching. It is not an obscure or abandoned project.
    
    CONTENTS
    1  Create Input Sqllite table for gretl
    2  gretl run regression
    3  drop down inline macro sandwich
    
    Handy odbc drivers
    http://www.ch-werner.de/sqliteodbc/sqliteodbc_w64.exe
    https://gm-software.de/index.html?doc=%2Fdtsqliteodbcdrv.html
    
    Other inline languages
    https://github.com/rogerjdeangelis/jnr-jenner-analytics-part-I-inline-drop-down-to-duckdb-sql
    https://github.com/rogerjdeangelis/jnr-jenner-analytics-part-II-drop-down-to-open-source-spss-run-regression
    https://github.com/rogerjdeangelis/jnr-jenner-analytics-part-III-inline-drop-down-to-open-source-matlab-summarize-data
    https://github.com/rogerjdeangelis/jnr-jenner-analytics-part-IV-inline-drop-down-to-poweshell-add-column-to-excell-sheet
    https://github.com/rogerjdeangelis/nr-jenner-analytics-part-V-proc-R-macro-wrapper-and-resolving-macro-triggers-within-R
    https://github.com/rogerjdeangelis/jnr-jenner-analytics-part-VI-proc-R-macro-wrapper-and-resolving-macro-triggers-within-R
    https://github.com/rogerjdeangelis/jnr-jenner-analytics-part-VII-inline-drop-down-to-perl
    https://github.com/rogerjdeangelis/jnr-jenner-analytics-part-VIII-excel-update-sheet-in-place-using-sql-keeping-all-formatting
    https://github.com/rogerjdeangelis/jnr-jenner-analytics-part-VIX-javascript-intractive-web-pages.sas
    https://github.com/rogerjdeangelis/jnr-jenner-analytics-part-X-drop-down-to-open-source-gretl-econometrics-regression
    
    
    /******************************************************************************************************************/
    /*  1 CREATE INPUT SQLLITE TABLE FOR GRETL                                                                        */
    /******************************************************************************************************************/
    
    libname sqlite odbc noprompt="driver=sqlite3 odbc driver; database=d:/sqlite/mysqlite.db;LoadExt=d:/dll/sqlean.dll;";
    
    proc datasets lib=sqlite;
     delete class;
    run;
    
    options validvarname=v7;
    data sqlite.class ;
      informat
    
        name    $8.
        sex     $1.
        age     8.
        height  8.
        ;
     input name sex age height  &;
    cards4;
    Alfred M 14 69
    Alice F 13 56.5
    Barbara F 13 65.3
    Carol F 14 62.8
    Henry M 14 63.5
    ;;;;
    run;quit;
    
    options nocenter;
    proc reg data=sqlite.class;
    model age = height;
    run;
    
    libname sqlite clear;
    
    
    LIST:  8:57:48
    ==============
    
    The REG Procedure
    Model: MODEL1
    Dependent Variable: age
    
    Number of Observations Read  5
    Number of Observations Used  5
    
                          Analysis of Variance
    
                                Sum of     Mean
    Source                 DF   Squares    Square   F Value    Pr > F
    ---------------  --------  --------  --------  --------  --------
    Model                   1   0.30624   0.30624      1.03    0.3853
    Error                   3   0.89376   0.29792
    Corrected Total         4   1.20000
    
    Root MSE             0.54582    R-Square            0.2552
    Dependent Mean      13.60000    Adj R-Sq            0.0069
    Coeff Var            4.01340
    
                           Parameter Estimates
    
    Variable         DF  Estimate  Standard Error   t Value  Pr > |t|
    ---------  --------  --------  --------------  --------  --------
    Intercept         1   9.74654         3.80862      2.56    0.0833
    height            1   0.06076         0.05993      1.01    0.3853
    
    
    LOG:   8:57:48
    ==============
    
    NOTE: Copyright (c) 2026 Jenner Analytics Ltd., London, England.
    NOTE: Jenner v1.5.102 (build v1.5.102+67ce60c837.20261020T035203Z)
          Licensed to Roger DeAngelis, Serial 3BF7B3E6.
    NOTE: DATA _null_
    
    autexec started.
    
    NOTE: DATA elapsed:
      wall  0.00 seconds
      cpu   0.00 seconds
    NOTE: Library WORKX assigned path=d:\wpswrkx.
    NOTE: DATA workx.class
    
    NOTE: Processing inline DATALINES (19 lines)
    
    NOTE: Read 19 rows from DATALINES.
    NOTE: The data set WORKX.CLASS has 19 observations and 5 variables.
    NOTE: DATA elapsed:
      wall  0.00 seconds
      cpu   0.00 seconds
    NOTE: DATA _null_
    
    LOG:   8:57:48
    NOTE: DATA _null_ completed. Output written to FILE PRINT
    NOTE: Option SASAUTOS changed to c:/otojnr.
    NOTE: DATA _null_
    
    NOTE: Reading from fileref c:/jnr/runsas_selection.sas (c:/jnr/runsas_selection.sas)
        1 libname sqlite odbc noprompt="driver=sqlite3 odbc driver; database=d:/sqlite/mysqlite.db;LoadExt=d:/dll/sqlean.dll;";
        2
        3 proc datasets lib=sqlite;
        4  delete class;
        5 run;
        6
        7 options validvarname=v7;
        8 data sqlite.class ;
        9   informat
       10
       11     name    $8.
       12     sex     $1.
       13     age     8.
       14     height  8.
       15     ;
       16  input name sex age height  &;
       17 cards4;
       18 Alfred M 14 69
       19 Alice F 13 56.5
       20 Barbara F 13 65.3
       21 Carol F 14 62.8
       22 Henry M 14 63.5
       23 ;;;;
       24 run;quit;
       25
       26 options nocenter;
       27 proc reg data=sqlite.class;
       28 model age = height;
       29 run;
       30
       31 libname sqlite clear;
    
    NOTE: Read 31 rows from c:/jnr/runsas_selection.sas.
    NOTE: DATA elapsed:
      wall  0.00 seconds
      cpu   0.00 seconds
    NOTE: DATA _null_
    
    autoexec completed   8:57:48
    
    NOTE: DATA elapsed:
      wall  0.00 seconds
      cpu   0.00 seconds
    NOTE: PROC DATASETS library=SQLITE
    
    NOTE: Deleting SQLITE.CLASS (memtype=DATA).
    NOTE: 1 dataset(s) deleted.
    NOTE: Option VALIDVARNAME changed to V7.
    NOTE: DATA sqlite.class
    
    NOTE: Processing inline DATALINES (5 lines)
    
    NOTE: Read 5 rows from DATALINES.
    NOTE: The data set SQLITE.CLASS has 5 observations and 4 variables.
    NOTE: DATA elapsed:
      wall  0.34 seconds
      cpu   0.11 seconds
    NOTE: PROC REG data=sqlite.class
    
    NOTE: PROC REG: processed 1 job(s) in batch
    NOTE: ODS plot written: reg_diagnostics.spec.json
    NOTE: ODS plot written: reg_fitplot.spec.json
    NOTE: Library SQLITE cleared.
    
    /******************************************************************************************************************/
    /*  2  GRETL RUN REGRESSION                                                                                       */
    /******************************************************************************************************************/
    
    LIST:  9:05:48
    ==============
    
    %jnr_gretlBegin;
    cards4;
    nulldata 5
    
    # Connect through the existing SQLite ODBC DSN
    open dsn=wernerdsn --odbc
    
    # Read the numeric columns in a single query
    string qry = "SELECT age, height  FROM class "
    data age height query=qry --odbc
    
    # Display the imported data
    print age height --byobs
    
    # Optional: regress age on height
    ols age const height
    ;;;;
    %jnr_gretlEnd;
    run;
    
    
    LIST:  9:05:48
    ==============
    
    gretl version 2026c
    Copyright Ramu Ramanathan, Allin Cottrell and Riccardo "Jack" Lucchetti
    This is free software with ABSOLUTELY NO WARRANTY
    Current session: 2026-10-23 15:20
    ? run D:\wpswrk\_TD24968/gretl_resolve.inp
     D:\wpswrk\_TD24968/gretl_resolve.inp
    ? nulldata 5
    periodicity: 1, maxobs: 5
    observations range: 1 to 5
    # Connect through the existing SQLite ODBC DSN
    ? open dsn=wernerdsn --odbc
    Connected to ODBC data source 'wernerdsn'
    # Read the numeric columns in a single query
    ? string qry = "SELECT age, height  FROM class "
    Generated string qry
    ? data age height query=qry --odbc
    Retrieved 5 observations on 2 series via ODBC
    # Display the imported data
    ? print age height --byobs
    
               age       height
    
    1           14         69.0
    2           13         56.5
    3           13         65.3
    4           14         62.8
    5           14         63.5
    
    # Optional: regress age on height
    ? ols age const height
    
    Model 1: OLS, using observations 1-5
    Dependent variable: age
    
                 coefficient   std. error   t-ratio   p-value
      -------------------------------------------------------
      const       9.74654      3.80862       2.559    0.0833  *
      height      0.0607610    0.0599305     1.014    0.3853
    
    Mean dependent var   13.60000   S.D. dependent var   0.547723
    Sum squared resid    0.893765   S.E. of regression   0.545822
    R-squared            0.255196   Adjusted R-squared   0.006928
    F(1, 3)              1.027905   P-value(F)           0.385312
    Log-likelihood      -2.790316   Akaike criterion     9.580632
    Schwarz criterion    8.799508   Hannan-Quinn         7.484172
    
    Done
    
    
    LOG:   9:05:48
    ==============
    
    NOTE: Copyright (c) 2026 Jenner Analytics Ltd., London, England.
    NOTE: Jenner v1.5.102 (build v1.5.102+67ce60c837.20261020T035203Z)
          Licensed to Roger DeAngelis, Serial 3BF7B3E6.
    NOTE: DATA _null_
    
    autexec started.
    
    NOTE: DATA elapsed:
      wall  0.00 seconds
      cpu   0.00 seconds
    NOTE: Library WORKX assigned path=d:\wpswrkx.
    NOTE: DATA workx.class
    
    NOTE: Processing inline DATALINES (19 lines)
    
    NOTE: Read 19 rows from DATALINES.
    NOTE: The data set WORKX.CLASS has 19 observations and 5 variables.
    NOTE: DATA elapsed:
      wall  0.00 seconds
      cpu   0.00 seconds
    NOTE: DATA _null_
    
    LOG:   9:05:48
    NOTE: DATA _null_ completed. Output written to FILE PRINT
    NOTE: Option SASAUTOS changed to c:/otojnr.
    NOTE: DATA _null_
    
    NOTE: Reading from fileref c:/jnr/runsas_selection.sas (c:/jnr/runsas_selection.sas)
        1 %jnr_gretlBegin;
        2 cards4;
        3 nulldata 5
        4
        5 # Connect through the existing SQLite ODBC DSN
        6 open dsn=wernerdsn --odbc
        7
        8 # Read the numeric columns in a single query
        9 string qry = "SELECT age, height  FROM class "
       10 data age height query=qry --odbc
       11
       12 # Display the imported data
       13 print age height --byobs
       14
       15 # Optional: regress age on height
       16 ols age const height
       17 ;;;;
       18 %jnr_gretlEnd;
       19 run;
    
    NOTE: Read 19 rows from c:/jnr/runsas_selection.sas.
    NOTE: DATA elapsed:
      wall  0.00 seconds
      cpu   0.00 seconds
    NOTE: DATA _null_
    
    autoexec completed   9:05:48
    
    NOTE: DATA elapsed:
      wall  0.00 seconds
      cpu   0.00 seconds
    NOTE: DATA _null_
    
    NOTE: Writing to fileref D:\wpswrk/gretl_resolve.inp (D:\wpswrk/gretl_resolve.inp)
    NOTE: Processing inline DATALINES (14 lines)
    nulldata 5
    
    # Connect through the existing SQLite ODBC DSN
    open dsn=wernerdsn --odbc
    
    # Read the numeric columns in a single query
    string qry = "SELECT age, height  FROM class "
    data age height query=qry --odbc
    
    # Display the imported data
    print age height --byobs
    
    # Optional: regress age on height
    ols age const height
    
    NOTE: Read 14 rows from DATALINES.
    NOTE: DATA elapsed:
      wall  0.00 seconds
      cpu   0.00 seconds
    NOTE: Fileref RUT assigned to device PIPE (payload: gretlcli -b D:\wpswrk/gretl_resolve.inp > D:\wpswrk/report.txt 2>&1).
    NOTE: DATA _null_
    
    NOTE: Reading from fileref rut (D:\wpswrk\jenner_pipe_RUT_56e1d6054f4a4cbb94c1ee306fa322b9.tmp)
    
    NOTE: Read 0 rows from rut.
    NOTE: DATA elapsed:
      wall  0.00 seconds
      cpu   0.00 seconds
    NOTE: DATA _null_
    
    NOTE: Reading from fileref D:\wpswrk/report.txt (D:\wpswrk/report.txt)
    
    NOTE: Read 47 rows from D:\wpswrk/report.txt.
    NOTE: DATA elapsed:
      wall  0.01 seconds
      cpu   0.02 seconds
    NOTE: Fileref RUT cleared.
    
    /******************************************************************************************************************/
    /*  3  DROP DOWN INLINE MACRO SANDWICH                                                                            */
    /******************************************************************************************************************/
    
    filename ft15f001 "c:/otojnr/jnr_gretlBegin.sas";
    parmcards4;
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
    ;;;;
    run;
    
    filename ft15f001 "c:/otojnr/jnr_gretlEnd.sas";
    parmcards4;
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
    ;;;;
    run;
    
    /*--- END ---*/
    
