grep 'gy  wi'  exx*/box*/OUT* |tr '/' ' ' | tr -d ':'| awk {'print "mv " $1 "/" $2 "/" $3 " ../D0125_MBPT_Layer/D0328_dimer_VASP_renewed/" $1 "/" $2 "/"'}
