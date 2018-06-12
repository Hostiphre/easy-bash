memory,1000,m;
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

basis=aVDZ
{rks,pbe,orbital,2101.2}
{rhf,start=2101.2,maxit=0}
{rpatddft;
 orb,2101.2;
 ecorr,DRPAI-AC,DRPAI-AC-ALT,DRPAI-DIEL,DRPAI-RCCD,DRPAI-PLASMON
}

dummy,1,2,3,4,5,6
basis=aVDZ
{rks,pbe,orbital,2101.2}
{rhf,start=2101.2,maxit=0}
{rpatddft;
 orb,2101.2;
 ecorr,DRPAI-AC,DRPAI-AC-ALT,DRPAI-DIEL,DRPAI-RCCD,DRPAI-PLASMON
}

dummy,7,8,9,10,11,12
basis=aVDZ
{rks,pbe,orbital,2101.2}
{rhf,start=2101.2,maxit=0}
{rpatddft;
 orb,2101.2;
 ecorr,DRPAI-AC,DRPAI-AC-ALT,DRPAI-DIEL,DRPAI-RCCD,DRPAI-PLASMON
}

geometry={
12
C2_dimer-0.8
C         -1.79780        0.61604        0.29782
C         -1.63092       -0.61596       -0.39363
H         -1.67287        1.56584       -0.21968
H         -2.05340        0.63061        1.35694
H         -1.37546       -0.63000       -1.45211
H         -1.75584       -1.56691        0.12394
C          0.85312       -0.61596        0.20590
C          1.02000        0.61604       -0.48554
H          0.59761       -0.62991        1.26459
H          0.97804       -1.56697       -0.31167
H          0.89506        1.56582        0.03202
H          1.27567        0.63056       -1.54494
}

basis=aVDZ
{rks,pbe,orbital,2101.2}
{rhf,start=2101.2,maxit=0}
{rpatddft;
 orb,2101.2;
 ecorr,DRPAI-AC,DRPAI-AC-ALT,DRPAI-DIEL,DRPAI-RCCD,DRPAI-PLASMON
}

dummy,1,2,3,4,5,6
basis=aVDZ
{rks,pbe,orbital,2101.2}
{rhf,start=2101.2,maxit=0}
{rpatddft;
 orb,2101.2;
 ecorr,DRPAI-AC,DRPAI-AC-ALT,DRPAI-DIEL,DRPAI-RCCD,DRPAI-PLASMON
}

dummy,7,8,9,10,11,12
basis=aVDZ
{rks,pbe,orbital,2101.2}
{rhf,start=2101.2,maxit=0}
{rpatddft;
 orb,2101.2;
 ecorr,DRPAI-AC,DRPAI-AC-ALT,DRPAI-DIEL,DRPAI-RCCD,DRPAI-PLASMON
}

geometry={
12
C2_dimer+0.8
C         -1.79780        0.61604        0.29782
C         -1.63092       -0.61596       -0.39363
H         -1.67287        1.56584       -0.21968
H         -2.05340        0.63061        1.35694
H         -1.37546       -0.63000       -1.45211
H         -1.75584       -1.56691        0.12394
C          2.40849       -0.61596        0.58129
C          2.57537        0.61604       -0.11015
H          2.15298       -0.62991        1.63998
H          2.53341       -1.56697        0.06372
H          2.45043        1.56582        0.40741
H          2.83104        0.63057       -1.16955
}

basis=aVDZ
{rks,pbe,orbital,2101.2}
{rhf,start=2101.2,maxit=0}
{rpatddft;
 orb,2101.2;
 ecorr,DRPAI-AC,DRPAI-AC-ALT,DRPAI-DIEL,DRPAI-RCCD,DRPAI-PLASMON
}

dummy,1,2,3,4,5,6
basis=aVDZ
{rks,pbe,orbital,2101.2}
{rhf,start=2101.2,maxit=0}
{rpatddft;
 orb,2101.2;
 ecorr,DRPAI-AC,DRPAI-AC-ALT,DRPAI-DIEL,DRPAI-RCCD,DRPAI-PLASMON
}

dummy,7,8,9,10,11,12
basis=aVDZ
{rks,pbe,orbital,2101.2}
{rhf,start=2101.2,maxit=0}
{rpatddft;
 orb,2101.2;
 ecorr,DRPAI-AC,DRPAI-AC-ALT,DRPAI-DIEL,DRPAI-RCCD,DRPAI-PLASMON
}

geometry={
6
C2_mono1
C       -1.797803    0.616036    0.297820
C       -1.630921   -0.615960   -0.393626
H       -1.672873    1.565837   -0.219685
H       -2.053404    0.630606    1.356938
H       -1.375459   -0.629996   -1.452107
H       -1.755840   -1.566907    0.123941
}

basis=aVDZ
{rks,pbe,orbital,2101.2}
{rhf,start=2101.2,maxit=0}
{rpatddft;
 orb,2101.2;
 ecorr,DRPAI-AC,DRPAI-AC-ALT,DRPAI-DIEL,DRPAI-RCCD,DRPAI-PLASMON
}

geometry={
6
C2_mono2
C        1.630922   -0.615958    0.393625
C        1.797801    0.616040   -0.297816
H        1.375411   -0.629908    1.452310
H        1.755843   -1.566966   -0.123943
H        1.672856    1.565824    0.219746
H        2.053470    0.630565   -1.357216
}

basis=aVDZ
{rks,pbe,orbital,2101.2}
{rhf,start=2101.2,maxit=0}
{rpatddft;
 orb,2101.2;
 ecorr,DRPAI-AC,DRPAI-AC-ALT,DRPAI-DIEL,DRPAI-RCCD,DRPAI-PLASMON
}



