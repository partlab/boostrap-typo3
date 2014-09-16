#!/bin/sh

set -e

if [ "$#" -ne 1 ]; then
    echo 'Usage: sh boostrap-typo3.sh <directory>'
    exit 1
fi

curl -L get.typo3.org/current | tar -xvzf -
mkdir $1 ; mv typo3_src-* $1
cp config/* $1 ;
cd $1
ln -s typo3_src-* typo3_src ; ln -s typo3_src/typo3 typo3 
ln -s typo3_src/index.php index.php ; touch FIRST_INSTALL
cp typo3_src/composer.json ./
fig up
