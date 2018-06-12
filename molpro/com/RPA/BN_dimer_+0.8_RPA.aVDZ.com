memory,2000,m;
geometry={
12
BN_dimer+0.8
N         -1.81998        0.52121       -0.26463
B         -1.57423       -0.71284        0.45438
H         -1.76079        1.43416        0.17095
H         -2.06610        0.55048       -1.24688
H         -1.28817       -0.64847        1.61755
H         -1.66785       -1.74872       -0.14627
N          2.44141       -0.49579       -0.54551
B          2.54381        0.77585        0.14204
H          2.20147       -0.57611       -1.52640
H          2.60347       -1.38504       -0.08750
H          2.33390        1.77886       -0.48320
H          2.83395        0.77148        1.30612
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

