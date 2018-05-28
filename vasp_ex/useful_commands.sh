# number of iteration
ls */OUT* | xargs -I % sh -c 'grep Iter % | tail -n 1' | cut -c 59-61

# list all properties for DFT/ HF calculation
ls */OUT* | xargs -I % sh -c "\""grep 'gy  wi' % | cut -c 30-45 | tr '\n' ';'; grep Iter % | tail -n 1 | cut -c 59-61 | tr '\n' ';'; grep 'Total CPU' % | cut -c 45-60 | tr '\n' ';'; ls %"\""
