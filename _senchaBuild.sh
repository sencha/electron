#!/bin/bash
echo "Clean / Boostrap / Build x32"

rm -rf sencha/*
python script/clean.py
python script/bootstrap.py -v
python script/build.py

echo "Create Sencha output folders"

mkdir sencha
mkdir sencha/32
mkdir sencha/64

echo "Copy x32 build to sencha/32"

cp -R out/R/locales sencha/32/
cp -R out/R/resources sencha/32/
cp out/R/*.bin sencha/32/
cp out/R/*.dll sencha/32/
cp out/R/*.pak sencha/32/
cp out/R/icudtl.dat sencha/32/
cp out/R/senchainspector.exe sencha/32/

echo "Clean / Bootstrap / Build x64"

python script/clean.py
python script/bootstrap.py -v --target_arch=x64
python script/build.py

echo "Copy x64 build to sencha/64"

cp -R out/R/locales sencha/64/
cp -R out/R/resources sencha/64/
cp out/R/*.bin sencha/64/
cp out/R/*.dll sencha/64/
cp out/R/*.pak sencha/64/
cp out/R/icudtl.dat sencha/64/
cp out/R/senchainspector.exe sencha/64/

echo "DONE"
