#!/bin/sh
# 191227 knn
## из дирр.-с-мелк.*.m3u --> общ.-catenatedM3U.m3u


## выбор между dialog и Xdialog
if [ -z $DISPLAY ]
  then
    DIALOG=dialog     
  else
    DIALOG=Xdialog   
fi

trgtDir=`$DIALOG --stdout --title "выбор целевой дирректории" --dselect $HOME/  30 90`

mkdir $trgtDir/dev
  cd $trgtDir;
  

for i in $trgtDir/*.m3u; do IFS=$'\n' ;


cat ${i%%} > /tmp/lttlM3u

cat /tmp/lttlM3u >> dev/catenatedM3U.m3u;
echo >> dev/catenatedM3U.m3u;

done

rm /tmp/lttlM3u









