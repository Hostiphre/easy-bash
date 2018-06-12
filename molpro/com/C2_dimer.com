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

basis=VDZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=VTZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=VQZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=V5Z
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aVDZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aVTZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aVQZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aV5Z
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

dummy,1,2,3,4,5,6

basis=VDZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=VTZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=VQZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=V5Z
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aVDZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aVTZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aVQZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aV5Z
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

dummy,7,8,9,10,11,12

basis=VDZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=VTZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=VQZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=V5Z
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aVDZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aVTZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aVQZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aV5Z
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

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

basis=VDZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=VTZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=VQZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=V5Z
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aVDZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aVTZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aVQZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aV5Z
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

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

basis=VDZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=VTZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=VQZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=V5Z
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aVDZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aVTZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aVQZ
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

basis=aV5Z
hf
ccsd(t)
mp2-f12
ccsd(t)-f12
ccsd(t)-f12,scale_trip=1

