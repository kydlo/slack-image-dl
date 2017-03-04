#!/bin/sh

touch ~/Desktop/urls.txt
touch ~/Desktop/processedURLs.txt
touch ~/Desktop/uniqueURLS.txt

for VAR in "$@"
do
grep "url_private_download" "$VAR" | cut -d ':' -f2- | tr -d "\\" | tr -d '"' | cut -d "," -f1 >> ~/Desktop/urls.txt
printf -
done

sort -u ~/Desktop/urls.txt >> ~/Desktop/uniqueURLS.txt

while read -ru 3 LINE; do
	open "$LINE"
	cat "$LINE" >> processedURLs.txt
done 3< ~/Desktop/urls.txt

