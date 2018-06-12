memory,1000,m;
geometry={
12
BN_dimer
N       -1.819980    0.521208   -0.264633
B       -1.574231   -0.712845    0.454380
H       -1.760785    1.434165    0.170949
H       -2.066097    0.550475   -1.246881
H       -1.288165   -0.648474    1.617545
H       -1.667853   -1.748718   -0.146271
N        1.667174   -0.537642   -0.352726
B        1.769572    0.734002    0.334824
H        1.427233   -0.617954   -1.333613
H        1.829229   -1.426890    0.105282
H        1.559663    1.737015   -0.290411
H        2.059708    0.729631    1.498900
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
BN_mono1
N       -1.819980    0.521208   -0.264633
B       -1.574231   -0.712845    0.454380
H       -1.760785    1.434165    0.170949
H       -2.066097    0.550475   -1.246881
H       -1.288165   -0.648474    1.617545
H       -1.667853   -1.748718   -0.146271
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
BN_mono2
N        1.667174   -0.537642   -0.352726
B        1.769572    0.734002    0.334824
H        1.427233   -0.617954   -1.333613
H        1.829229   -1.426890    0.105282
H        1.559663    1.737015   -0.290411
H        2.059708    0.729631    1.498900
}

basis=aVDZ
{rks,pbe,orbital,2101.2}
{rhf,start=2101.2,maxit=0}
{rpatddft;
 orb,2101.2;
 ecorr,DRPAI-AC,DRPAI-AC-ALT,DRPAI-DIEL,DRPAI-RCCD,DRPAI-PLASMON
}




