wget -O baksmali.jar https://github.com/baksmali/smali/releases/download/3.0.8/baksmali-3.0.8-fat-release.jar
wget -O smali.jar https://github.com/baksmali/smali/releases/download/3.0.8/smali-3.0.8-fat-release.jar
java -jar baksmali.jar d loader.bin -o out_folder
find out_folder/ -type f -exec sed -i 's/app\.revanced\.android\.gms/top\.nkbe\.npatch\.gms/g' {} +
java -jar smali.jar a out_folder -o new_loader.bin
rm smali.jar
rm baksmali.jar
echo "there is new_loader.bin file rename to loader.bin and place inside npatch's manager apk or cli tool jar sign and install"
