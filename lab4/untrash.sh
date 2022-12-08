#!/bin/bash
if [[ $# -gt 1 ]]; then
echo "Error, only one file"
exit 1
fi
file="$1"
trash=~/trash
trash_log=~/trash.log
for line in $(grep -- $file $trash_log); do
path=$(echo "$line" | awk -F ":" '{print $1}')
echo $path
name=$(echo "$line" | awk -F ":" '{print $2}')
echo $name
katalog=$(echo "$path" | awk -F "/" '{print $4}')
echo "Deleted file: $path. Do you want to restore it?"
read ans
if [[ $ans == "y" ]]; then
  if [[ -d ~/$katalog ]]; then
    if ! [[ -f $path ]]; then
      ln $trash/$name $path
      rm $trash/$name
      echo "File recovered"
    else
      echo "File with this name already exists. Write another name:"
      read newname
      ln $trash/$name ~/$katalog/$newname
      rm $trash/$name
      echo "File recovered"
    fi
  else
    ln $trash/$name ~/$file
    rm $trash/$name
    echo "File recovered in the home catalogue."
  fi
fi
done
