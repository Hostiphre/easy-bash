memory,5000,m;
geometry={
12
BN_dimer-0.8
N         -1.81998        0.52121       -0.26463
B         -1.57423       -0.71284        0.45438
H         -1.76079        1.43416        0.17095
H         -2.06610        0.55048       -1.24688
H         -1.28817       -0.64847        1.61755
H         -1.66785       -1.74872       -0.14627
N          0.89129       -0.57958       -0.15953
B          0.99369        0.69206        0.52802
H          0.65135       -0.65989       -1.14042
H          1.05334       -1.46883        0.29848
H          0.78378        1.69508       -0.09722
H          1.28382        0.68769        1.69209
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

