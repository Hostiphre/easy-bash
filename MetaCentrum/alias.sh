alias ll="ls -l"
alias qq="qstat -u $USERNAME"
alias ee="grep 'gy  wi' */OUT*"                                                                                                                                                                                                                                                                      
alias tt="grep 'Total CPU' */OUT*"                                                                                                                                                                                                                                                                   
alias iter="ls */OUT* | xargs -I % sh -c 'grep Iter % | tail -n 1' | cut -c 59-61"                                                                                                                                                                                                                   
alias out="ls */OUT* | xargs -I % sh -c "\""grep 'gy  wi' % | cut -c 30-45 | tr '\n' ';'; grep Iter % | tail -n 1 | cut -c 59-61 | tr '\n' ';'; grep 'Total CPU' % | cut -c 45-60 | tr '\n' ';'; ls %"\"" "                                                                                          
alias oo="xargs -I % sh -c "\""grep 'gy  wi' % | cut -c 30-45 | tr '\n' ';'; grep Iter % | tail -n 1 | cut -c 59-61 | tr '\n' ';'; grep 'Total CPU' % | cut -c 45-60 | tr '\n' ';'; ls %"\"" " # use e.g. ls */*/OUT* | oo to see energies in directories other than default