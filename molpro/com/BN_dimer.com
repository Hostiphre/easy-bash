memory,5000,m;
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
BN_mono1
N       -1.819980    0.521208   -0.264633
B       -1.574231   -0.712845    0.454380
H       -1.760785    1.434165    0.170949
H       -2.066097    0.550475   -1.246881
H       -1.288165   -0.648474    1.617545
H       -1.667853   -1.748718   -0.146271
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
BN_mono2
N        1.667174   -0.537642   -0.352726
B        1.769572    0.734002    0.334824
H        1.427233   -0.617954   -1.333613
H        1.829229   -1.426890    0.105282
H        1.559663    1.737015   -0.290411
H        2.059708    0.729631    1.498900
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

