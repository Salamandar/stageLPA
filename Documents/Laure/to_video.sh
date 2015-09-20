FRAMERATE=3

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

TEMPDIR=`pwd`/temp/

if [ "$(ls -A $TEMPDIR)" ]; then
    echo "Les images temporaires ont déjà été générées."
else
    echo "Génération des images temporaires…"
    mogrify -path $TEMPDIR -resize 800x600 *.png
fi
    python $SCRIPTPATH/rename.py $TEMPDIR

ffmpeg -framerate $FRAMERATE -pattern_type glob -i "$TEMPDIR/*.png" -c:v libx264 -r 30 -pix_fmt yuv420p out_$FRAMERATE.mp4
