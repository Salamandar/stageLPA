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
    set terminal svg size 800,600 fname 'Ubuntu' fsize 14
    set yrange [*:0]
    set output 'Courbes.svg'
    $EXECUTE
EOF

sleep 5;
wait

