memory,5000,m;
geometry={
12
C2_dimer
C       -1.797803    0.616036    0.297820
C       -1.630921   -0.615960   -0.393626
H       -1.672873    1.565837   -0.219685
H       -2.053404    0.630606    1.356938
H       -1.375459   -0.629996   -1.452107
H       -1.755840   -1.566907    0.123941
C        1.630922   -0.615958    0.393625
C        1.797801    0.616040   -0.297816
H        1.375411   -0.629908    1.452310
H        1.755843   -1.566966   -0.123943
H        1.672856    1.565824    0.219746
H        2.053470    0.630565   -1.357216
}

basis=aVQZ
{rks,pbe;orbital,2101.2}
{rhf,start=2101.2,maxit=0}
{rpatddft;
 orb,2101.2;
 ecorr,DRPAI-AC
}

dummy,1,2,3,4,5,6
basis=aVQZ
{rks,pbe;orbital,2201.2}
{rhf,start=2201.2,maxit=0}
{rpatddft;
 orb,2201.2;
 ecorr,DRPAI-AC
}

dummy,7,8,9,10,11,12
basis=aVQZ
{rks,pbe;orbital,2301.2}
{rhf,start=2301.2,maxit=0}
{rpatddft;
 orb,2301.2;
 ecorr,DRPAI-AC
}

