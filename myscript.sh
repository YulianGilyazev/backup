#!/bin/bash

dirName="$1"
archName="$2"
myDir=`pwd`
mkdir $dirName
extList=$@
lol=0
for ext in $extList
do
  let lol=lol+1
  if [[ lol -ge 3 ]]
  then
    files=$(find "$myDir")
    for file in $files
    do
      if [ -f "$file" ]
      then
        fileExt="${file##*.}"
        if  [ $fileExt = $ext ]
        then
          let lol=lol+1
          cp /$file ~/$dirName/"$lol"."$ext" >/dev/null 2>&1
        fi
      fi
    done
  fi
done
tar -cf "$archName".tar "$dirName" >/dev/null 2>&1
rm -R "$dirName" >/dev/null 2>&1
