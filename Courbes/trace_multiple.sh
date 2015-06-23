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
    $EXECUTE
EOF

sleep 5;
wait

