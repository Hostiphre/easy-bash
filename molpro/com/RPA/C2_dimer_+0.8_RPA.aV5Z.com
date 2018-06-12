memory,6000,m;
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

basis=aV5Z
{rks,pbe;orbital,2101.2}
{rhf,start=2101.2,maxit=0}
{rpatddft;
 orb,2101.2;
 ecorr,DRPAI-AC
}

dummy,1,2,3,4,5,6
basis=aV5Z
{rks,pbe;orbital,2201.2}
{rhf,start=2201.2,maxit=0}
{rpatddft;
 orb,2201.2;
 ecorr,DRPAI-AC
}

dummy,7,8,9,10,11,12
basis=aV5Z
{rks,pbe;orbital,2301.2}
{rhf,start=2301.2,maxit=0}
{rpatddft;
 orb,2301.2;
 ecorr,DRPAI-AC
}

