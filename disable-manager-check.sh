APK_IN="original.apk"
APK_OUT="patched.apk"
TARGET_CLASS="top/nkbe/npatch/LSPApplication"
unzip -q "$APK_IN" "*.dex" -d tmp_dex

FOUND_DEX=""
for dex in tmp_dex/*.dex; do
    if baksmali list classes "$dex" | grep -q "$TARGET_CLASS"; then
        FOUND_DEX=$(basename "$dex")
        echo "Class Found: $FOUND_DEX"
        break
    fi
done
if [ -z "$FOUND_DEX" ]; then
    echo "Error dex not found!"
    exit 1
fi

baksmali d "tmp_dex/$FOUND_DEX" -o tmp_smali
SMALI_FILE="tmp_smali/$TARGET_CLASS.smali"
sed -i '/if-nez v5, :cond_f/i \    const/4 v5, 0x1' "$SMALI_FILE"
smali a tmp_smali -o "tmp_dex/$FOUND_DEX"
cp "$APK_IN" "$APK_OUT"
cd tmp_dex
zip -q -0 -u "../$APK_OUT" "$FOUND_DEX"
cd ..
rm -rf tmp_dex tmp_smali
zipalign -f -v 4 "$APK_OUT" "aligned_patched.apk"
apksigner sign --ks-key-alias lob --ks sign.keystore --ks-pass pass:369852 --key-pass pass:369852 --out "final_signed.apk" "aligned_patched.apk"
echo "============================================="
echo "Success! Ready file: final_signed.apk"
echo "============================================="
