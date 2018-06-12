memory,2000,m;
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
{rks,pbe;orbital,2101.2}
{rhf,start=2101.2,maxit=0}
{rpatddft;
 orb,2101.2;
 ecorr,DRPAI-AC
}

dummy,1,2,3,4,5,6
basis=aVDZ
{rks,pbe;orbital,2201.2}
{rhf,start=2201.2,maxit=0}
{rpatddft;
 orb,2201.2;
 ecorr,DRPAI-AC
}

dummy,7,8,9,10,11,12
basis=aVDZ
{rks,pbe;orbital,2301.2}
{rhf,start=2301.2,maxit=0}
{rpatddft;
 orb,2301.2;
 ecorr,DRPAI-AC
}

