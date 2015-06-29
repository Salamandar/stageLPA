#!/bin/bash
GNUPLOT_OPTIONS="using 1:6 with lines title"

EXECUTE="plot "
for file in "$@"
do
    EXECUTE+="\"$file\" $GNUPLOT_OPTIONS '$file' noenhanced, "
done

echo $EXECUTE
gnuplot -persist <<- EOF
    set datafile separator ","
    set for [i=1:1000] linestyle i lw 1
    $EXECUTE
EOF

sleep 5;
wait

