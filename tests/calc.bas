10REM:   CALC-128...WDM...02/15/86
20:
30:
40:
50FORX=1TO8:KEYX,CHR$(132+X):NEXT:REM:KEY8,"LIST4500-4599"+CHR$(13)
60SCNCLR:COLOR4,12:COLOR1,1
70PRINT"{12}{1E}                    {99}                   {92}"
80PRINT"{12}{1E}                   {12} {99} {92}                 {12} {92}"
90PRINT"{12}{1E} {9E}   {1E}  KEY  FUNCTION {99} {92}                 {12} {92}"
100PRINT"{12}{1E} {9E} {1E}    {A3}{A3}{A3}  {A3}{A3}{A3}{A3}{A3}{A3}{A3}{A3} {99} {92}                 {12} {92}"
110PRINT"{12}{1E} {9E} {1E}     +   ADDITION {99} {92}                 {12} {92}"
120PRINT"{12}{1E} {9E}   {1E}                {99} {92}                 {12} {92}"
130PRINT"{12}{1E}       -   SUBTRACT {99} {92}                 {12} {92}"
140PRINT"{12}{1E} {9E}   {1E}                {99} {92}                 {12} {92}"
150PRINT"{12}{1E} {9E} {1E} {9E} {1E}  F1   MULTIPLY {99} {92}                 {12} {92}"
160PRINT"{12}{1E} {9E}   {1E}                {99} {92}                 {12} {92}"
170PRINT"{12}{1E} {9E} {1E} {9E} {1E}  F3   DIVISION {99} {92}                 {12} {92}"
180PRINT"{12}{1E}                    {99} {92}                 {12} {92}"
190PRINT"{12}{1E} {9E} {1E}    F5   CL ENTRY {99} {92}                 {12} {92}"
200PRINT"{12}{1E} {9E} {1E}                  {99} {92}                 {12} {92}"
210PRINT"{12}{1E} {9E} {1E}    F7   SUBTOTAL {99} {92}                 {12} {92}"
220PRINT"{12}{1E} {9E}   {1E}                {99} {92}                 {12} {92}"
230PRINT"{12}{1E}      F2   PERCENT% {99} {92}                 {12} {92}"
240PRINT"{12}{1E} {9E}   {1E}                {99} {92}                 {12} {92}"
250PRINT"{12}{1E} {9E} {1E}    F4   $ OR FLT {99} {92}                 {12} {92}"
260PRINT"{12}{1E} {9E} {1E}                  {99} {92}                 {12} {92}"
270PRINT"{12}{1E} {9E}   {1E}  F6   CLR SCRN {99} {92}                 {12} {92}"
280PRINT"{12}{1E}                    {99} {92}                 {12} {92}"
290PRINT"{12}{1E} {9E}128{1E}  F8   GRANDTTL {99}                  {12} {92}"
300PRINT"{12}{1E}                    {99}   {92}            {12}    {92}"
310PRINT"{12}{1E}  ESC TWICE TO END  {99}                  {12} {92}";:LI$=" {C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}"
320WINDOW21,1,37,21,1:CT=1967:POKE56027,13:DT=1:PU$=" ###,###,###.##"
330GETKEYA$
340IFASC(A$)=27THEN8998
350IFASC(A$)=43THEN1000
360IFASC(A$)=45THEN1500
370IFASC(A$)=133THEN2000
380IFASC(A$)=135THEN2500
390IFASC(A$)=137THENGOSUB3000:GOTO330
400IFASC(A$)=139THEN3500
410IFASC(A$)=134THEN4000
420IFASC(A$)=136THEN4500
430IFASC(A$)=138THEN5000
440IFASC(A$)=140THEN5500
450IFASC(A$)=46THEN6000
460IFASC(A$)<48ORASC(A$)>57THEN330:ELSEGOTO6500
1000REM:**** ADDITION ****
1010NE=VAL(NE$):SB=SB+NE:GT=SB:PO=1
1020PRINTUSINGPU$;NE;:PRINT" +";:CT=1967:GOTO330
1500REM:**** SUBTRACT ****
1510NE=VAL(NE$):SB=SB-NE:GT=SB:PO=2
1520PRINTUSINGPU$;NE;:PRINT" -";:CT=1967:GOTO330
2000REM:**** MULTIPLY ****
2010NE=VAL(NE$):IFSB=0THENSB=NE:GOTO2020:ELSESB=SB*NE
2020PRINTUSINGPU$;NE;:PRINT" *";:CT=1967:PO=3:GOTO330
2500REM:**** DIVISION ****
2510NE=VAL(NE$):IFSB=0THENSB=NE:GOTO2520:ELSESB=SB/NE
2520PRINTUSINGPU$;NE;:PRINT" /";:CT=1967:PO=4:GOTO330
3000REM:**** CL ENTRY ****
3010FORX=1967TO1978:POKEX,32:NEXT:RETURN
3500REM:**** SUBTOTAL ****
3510IFPO<3THENPRINTLI$:PRINTUSINGPU$;SB;:GOTO3590
3520IFPO=3THENBEGIN:NE=VAL(NE$):SB=SB*NE:PRINTUSINGPU$;NE;
3521BEND:PRINT" _";:PRINTLI$:PRINTUSINGPU$;SB;:SB=0:GOTO3590
3530IFPO=4THENBEGIN:NE=VAL(NE$):SB=SB/NE:PRINTUSINGPU$;NE;
3531BEND:PRINT" _";:PRINTLI$:PRINTUSINGPU$;SB;:SB=0:GOTO3590
3590PRINT" S":PRINT:CT=1967:PO=0:NE=0:NE$="":GOSUB3000:GOTO330
4000REM:**** PERCENT% ****
4005IFPO<3THEN330
4010NE=VAL(NE$):PC=NE/100:IFPO=3THENSB=SB*PC:GOTO4020:ELSESB=SB/PC
4020PRINTUSINGPU$;NE;:PRINT" %";:PRINTLI$:CT=1967
4030PRINTUSINGPU$;SB;:PRINT" S":PRINT:SB=0:NE=0:NE$="":GOSUB3000:GOTO330
4500REM:**** $ OR FLT ****
4510IFDT=1THENPOKE56027,5:POKE56032,13:POKE56033,13:POKE56034,13:DT=0:GOTO4530
4520IFDT=0THENPOKE56032,5:POKE56033,5:POKE56034,5:POKE56027,13:DT=1
4530IFDT=1THENPU$=" ###,###,###.##":GOTO4550
4540IFDT=0THENPU$=" ###,###.######"
4550GOTO330
5000REM:**** CLR SCRN ****
5010SCNCLR:GT=0:SB=0:NE=0:NE$="":GOTO330
5500REM:**** GRANDTTL ****
5510IFPO<3THENPRINTLI$:PRINTUSINGPU$;GT;:GOTO5590
5520IFPO=3THENBEGIN:NE=VAL(NE$):GT=SB*NE:PRINTUSINGPU$;NE;
5521BEND:PRINT" _";:PRINTLI$:PRINTUSINGPU$;GT;:GOTO5590
5530IFPO=4THENBEGIN:NE=VAL(NE$):GT=SB/NE:PRINTUSINGPU$;NE;
5531BEND:PRINT" _";:PRINTLI$:PRINTUSINGPU$;GT;:GOTO5590
5590PRINT" G";:CT=1967:PO=0:NE=0:NE$="":SB=0:GT=0
5591PRINT" ===============":PRINT:PRINT:GOSUB3000:GOTO330
6000REM:**** DECPOINT ****
6005IFCT=1967THENGOSUB3000:NE$="":NE=0
6010DP=0:FORX=1967TOCT:IFPEEK(X)=46THENDP=1:NEXT:ELSENEXT
6020IFDP=1THEN330:ELSEPOKECT,46:CT=CT+1:NE$=NE$+A$:GOTO330
6500REM:**** NUMBERS. ****
6505IFCT=1967THENGOSUB3000:NE$="":NE=0
6510DP=0:FORX=1967TOCT:IFPEEK(X)=46THENDP=1:NEXT:ELSENEXT
6520IFCT=1979THEN330
6530IFCT=1976ANDDP=0THEN330:ELSEPOKECT,ASC(A$):CT=CT+1:NE$=NE$+A$:GOTO330
8997GOTO330
8998GETKEYA$:IFASC(A$)=27THEN8999:ELSEGOTO330
8999PRINTCHR$(19);CHR$(19):SCNCLR:END
9000SCRATCH"CALC-128":DSAVE"CALC-128":END
