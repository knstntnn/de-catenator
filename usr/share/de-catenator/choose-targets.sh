#!/bin/sh
# 191227 knn

## выбор между dialog и Xdialog
if [ -z $DISPLAY ]
  then
    DIALOG=dialog    
  else
    DIALOG=Xdialog   
fi


inputM3u=`$DIALOG --stdout --title "выбор списка-m3u" --fselect $HOME/  30 90`
 
case $? in
    0)
	echo "Выбран \"$inputM3u\""   &  echo $inputM3u > /tmp/inputM3u ;;
    1)
	echo "Отказ от ввода.";;
    255)
	echo "Нажата клавиша ESC.";;
esac
 
inputCat=`$DIALOG --stdout --title "выбор целевой дирректории" --dselect $HOME/  30 90`
 
case $? in
    0)
	echo "Выбран \"inputCat\"" & echo $inputCat > /tmp/inputCat  ;;
    1)
	echo "Отказ от ввода."  ;;
    255)
	echo "Нажата клавиша ESC.";;
esac

$DIALOG  --title "Список-m3u:" --textbox /tmp/inputM3u   10 70
$DIALOG  --title "Каталог для результатов:" --textbox /tmp/inputCat  10 70
