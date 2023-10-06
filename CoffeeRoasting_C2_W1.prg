10 rem A small neural network on a commodore 64
20 rem based on coffee roasting lab implemented in Numpy
30 rem coursera - machine learning - c2 w1


90 DIM AO(10):DIM AI(10): REM Activation Input and Output
95 DIM X(3):REM Input Parameters
100 DIM W(3,3,3): REM Weights (Row,Coloumn,Layer)
105 DIM B(3,3): REM BIAS (Row,Layer)

106 for l=1to 2: REM Layers
110 for r=1 to 3:read W(r,1,l),W(r,2,l),W(r,3,l):rem 3 Columns
115 next r,l
130 read B(1,1),B(2,1),B(3,1): REM Bias rows
140 read B(1,2)


170 goto 600

200 REM Sigmoid Function
210 REM INPUT: Z
220 REM OUTPUT: SI
230 SI=1/(1+2.718281^-Z)
270 RETURN

300 REM Dense Layer Function
305 rem INPUT: u:unit, l:layer
310 REM INPUT: AI(unit), W(Row,Coloumn,Layer), B(Row,Layer)
320 REM OUTPUT: AO(unit)

340 FOR J=1 TO u
350   Z=0
360   FOR I=1 TO IC
368 ? "w";W(I,J,L),"a";AI(I)
375     Z=Z+W(I,J,L)*AI(I)
380   NEXT I

385   Z=Z+B(J,L)
390   gosub200:AO(J)=SI:rem sigmoid 
395 print"z";z,"ao";SI

396  NEXT J: RETURN



400 REM my-sequential
410 REM INPUT: X(), W1(), B1(), W2(), B2()
420 REM OUTPUT: A2()
430 for r=1to3
440 AI(r)=X(r):nextr
445 u=3:L=1:IC=2
450 gosub 300

460 for r=1to3
470 AI(r)=AO(r):nextr
485 u=1:L=2:IC=3
490 gosub 300


499 RETURN



600 REM Predict Function
610 REM INPUT: X(), W1(), B1(), W2(), B2()
620 ?"start"
630 PC=2
650 FOR P=1 TO PC
655 :read X(1),X(2)
660 :GOSUB 400:?"prediction ";
670 if AO(1)>0.5 then ?"1"
675 if AO(1)<=0.5 then ?"0"
678 ?:?"hit any key to continue":?
679 get g$:if g$="" then 679
680 NEXT P

999 end

1000 data -8.93,0.29,12.9:rem W1,u1
1010 data -0.1,-7.32,10.81:rem W1,u2
1015 data 0,0,0
1020 data -31.18,0,0:rem w2 u1
1021 data -27.59,0,0:rem w2 u2
1022 data -32.56,0,0
1030 data -9.82,-9.28,0.96
1040 data 15.41:rem B2
1050 data -0.47,0.42
1060 data -0.47,3.16



