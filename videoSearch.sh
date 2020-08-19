#!/bin/bash

url=$1

searchPhrase=$2

file="youtube"
if [ -d $file ]; then
        rm -r $file
fi
mkdir $file && cd $file

youtube-dl $url --skip-download --write-auto-sub -i > downloadStatus.txt 2>&1

grep $searchPhrase *.vtt > search.txt

cd ..

java Parse ./youtube/search.txt

rm -r $file
