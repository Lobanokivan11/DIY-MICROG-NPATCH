# DIY-MICROG-NPATCH

## How to Install

1. Download And install ```gmscore-user.apk```

2. Open NPatch Gmscore Settings(MicroG Settings) Enter Self-check page And Grant All Permission Excluding Spoof Signature Permission (This Not Required).

3. Enter Google Accounts and login into Google Account as always

4. That's All, Patch Any app from NPatch with Gms Redirection enabled and enjoy

## How to Patch NPatch to use this

1. Unpack loader.bin from NPatch Manager (apk) or cli (jar)

2. place in the repo's root folder

3. run patch-loader.sh

4. you will see new_loader.bin file rename it to folder.bin and place to assets/folder.bin of NPatch Manager (apk) or cli (jar) allowing to replace

5. rename Patched Manager to original.apk and run disable-manager-check.sh (needed for patched NPatch to work)

6. sign NPatch Manager (apk) or cli (jar) using apksigner or any sign tool you actually use

7. use patched NPatch by yours (uninstall Npatch Manager on your device and install your Patched ones) to patch apk
