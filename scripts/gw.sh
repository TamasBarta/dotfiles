ip route show | sed 's/\(\S\+\s\+\)\?default via \(\S\+\).*/\2/p; d'
