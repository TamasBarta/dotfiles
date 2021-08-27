 #!/bin/sh

 brightnessctl --list | awk "\$1 == \"Device\" && \$5 == \"'backlight':\" { print substr(\$2, 2, length(\$2) -2); }" | xargs -i -n1 brightnessctl -d {} $@
