#!/bin/bash
echo "Clean / Boostrap / Build x32"

rm -rf sencha/*
./script/clean.py
./script/bootstrap.py -v
./script/build.py

echo "Create Sencha output folders"

mkdir sencha

echo "Copy build to sencha/"

cp -R out/R/locales sencha/
cp -R out/R/resources sencha/
cp out/R/*.bin sencha/
cp out/R/*.dll sencha/
cp out/R/*.pak sencha/
cp out/R/icudtl.dat sencha/
cp out/R/senchainspector.exe sencha/

echo "DONE"
