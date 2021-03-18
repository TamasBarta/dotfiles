ip route show | sed 's/\(\S\+\s\+\)\?default via \(\S\+\).*/\2/p; d' | grep -v 10.8.0.1
