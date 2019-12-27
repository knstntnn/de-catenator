#!/bin/sh
# 191227 knn
# созд. одноименные локальные ссылки *.html

## выбор между dialog и Xdialog
if [ -z $DISPLAY ]
  then
    DIALOG=dialog     
  else
    DIALOG=Xdialog   
fi

trgtDir=`$DIALOG --stdout --title "выбор целевой дирректории" --dselect $HOME/  30 90`

case $? in
    0)
	echo "Выбран \"inputCat\"" & echo $inputCat > /tmp/inputCat  ;;
    1)
	echo "Отказ от ввода."  ;;
    255)
	echo "Нажата клавиша ESC.";;
esac

mkdir $trgtDir/dev

  cd $trgtDir
  
# берёт *.m3u-файлы из каталога  ( ${i%%}  == имя-файла)
for i in /$trgtDir/*.m3u;
  do    zagl=${i%%};
   
    # - запись в html-файл    
    echo $" <HR> <A HREF=\"/${zagl}\" > ${zagl} </A>  "   >>   dev/m3u-local-headers.html 
      echo  >>   dev/m3u-local-headers.html 

done
 
rm /tmp/inputCat
