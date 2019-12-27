#!/bin/sh
## knn-190612 - Дробилка - списка*.m3u (decatenator)
## "Разрезает" большой плейлист на мелкие.


inputM3u=$( cat /tmp/inputM3u ) 
#inputM3u=выбор списка-m3u

inputCat=$( cat /tmp/inputCat ) 

mkdir $inputCat/dev
 cd $inputCat
 
## создание списками с номерами строк-по-"#EXTINF:"
cat $inputM3u | sed -n '/#EXTINF:/{=}' > nmbrsStr-file

while read N ; 
  do  IFS=$'\n' ;
  
    ##  полная строка(заголовочная)
    zaglStr=$(cat $inputM3u   | head -n$N | tail -n1 ) ;
   
    ##  "чистый заголовок"  --( | tr -d '\r' ) - режет ввод   "  ^M удаляется так:  "
    zagl1=$(cat $inputM3u | head -n$N | tail -n1   | cut -d ',' -f2 | tr -d '\r') ; 
    zagl=$(echo $zagl1)
      
      ##  заголовок-m3u ( имена файлов *.m3u) 
    mtu=.m3u ;  
      zaglMtu=$zagl$mtu ;
      1
    ##  номер строки - после "заголовочной"
    M=$(($N+1))   ; 
       
    ##  http   (  адреса - http* )   
    htStr=$(cat $inputM3u | head -n$M | tail -n1  ) ; 
      echo $htStr ;
     
     ##  запись "заголовочной строки" в файл
     echo $zaglStr >> $zaglMtu
     
       ##  запись "http*  строки" в файл
       echo $htStr >> $zaglMtu
     
         ##  запись "пустой разделительной строки" в файл    
         echo  >> $zaglMtu
     
              echo $" <HR> <A HREF=\"$htStr\" > ${zagl} </A>  "   >>   dev/M3U-headers-IP.html ;
      echo  >>   dev/M3U-headers-IP.html ;
     
done <   nmbrsStr-file 

rm nmbrsStr-file
rm /tmp/inputM3u  
rm /tmp/inputCat   
