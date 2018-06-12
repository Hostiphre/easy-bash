memory,2000,m;
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


