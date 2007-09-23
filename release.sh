#!/bin/sh

echo "Exporting svn"
svn export . pingus
rm -rf pingus/contrib
rm -rf pingus/doc
rm -rf pingus/lib
rm -rf pingus/src
rm -f pingus/pingus.sln
rm -f pingus/pingus.vcproj
rm -f pingus/SConstruct
rm -f pingus/ChangeLog
rm -f pingus/clanlib_2_sexpr.rb
rm -f pingus/config.h
rm -f pingus/INSTALL.unix
rm -f pingus/INSTALL.Win32
rm -f pingus/xml2sexpr.rb

cp Release/pingus.exe pingus
cp ../windows_installer/*.dll pingus
cp ../windows_installer/Microsoft.VC80.CRT.manifest pingus

echo "Creating installer"
"c:/Program Files/NSIS/makensis.exe" /NOCD ../windows_installer/pingus.nsi

echo "Cleaning up"
rm -rf pingus

echo "Done"

