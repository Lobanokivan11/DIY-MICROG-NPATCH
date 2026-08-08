baksmali d loader.bin -o out_folder
find out_folder/ -type f -exec sed -i 's/app\.revanced\.android\.gms/top\.nkbe\.npatch\.gms/g' {} +
smali a out_folder -o new_loader.bin
echo "there is new_loader.bin file rename to loader.bin and place inside npatch's manager apk or cli tool jar sign and install"
