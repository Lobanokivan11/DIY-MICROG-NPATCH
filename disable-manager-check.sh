#!/bin/bash
# Stop execution if any command fails
set -e

# Input and output APK file names
APK_IN="original.apk"
APK_OUT="patched.apk"
# Target class to locate and modify
TARGET_CLASS_DOT="top.nkbe.npatch.LSPApplication"

# Convert dots to slashes for smali paths (top/nkbe/npatch/LSPApplication)
TARGET_CLASS_PATH="${TARGET_CLASS_DOT//./\/}"
# Format for the standard Smali type descriptor (Ltop/nkbe/npatch/LSPApplication;)
TARGET_CLASS_SMALI="L${TARGET_CLASS_PATH};"

# Clear previous temporary directories and recreate the dex folder
rm -rf tmp_dex tmp_smali
mkdir -p tmp_dex

# Extract all .dex files including those in subdirectories (e.g., assets/)
unzip -q "$APK_IN" "*.dex" -d tmp_dex

FOUND_DEX=""
# Recursively search through all extracted dex files
while IFS= read -r -d '' dex; do
    # Check if the current dex file contains the target class
    if baksmali list classes "$dex" | grep -q "^${TARGET_CLASS_SMALI}$"; then
        # Save the relative path inside tmp_dex
        FOUND_DEX="${dex#tmp_dex/}"
        echo "Class found in file: $FOUND_DEX"
        break
    fi
done < <(find tmp_dex -type f -name "*.dex" -print0)

# Exit with an error if the class was not found in any dex file
if [ -z "$FOUND_DEX" ]; then
    echo "Error: dex file containing $TARGET_CLASS_DOT not found!"
    rm -rf tmp_dex
    exit 1
fi

# Decompile only the specific dex file containing the target class
baksmali d "tmp_dex/$FOUND_DEX" -o tmp_smali

# Verify that the expected .smali file exists after decompilation
SMALI_FILE="tmp_smali/$TARGET_CLASS_PATH.smali"
if [ ! -f "$SMALI_FILE" ]; then
    echo "Error: Smali file not found at path $SMALI_FILE"
    rm -rf tmp_dex tmp_smali
    exit 1
fi

# Code modification: inject 'const/4 v5, 0x1' before the conditional jump
patch "$SMALI_FILE" < disable-check-manager.patch

# Assemble the modified smali files back into the original dex file structure
smali a tmp_smali -o "tmp_dex/$FOUND_DEX"

# Copy the original APK and update it with the modified dex file
cp "$APK_IN" "$APK_OUT"
cd tmp_dex
zip -q -0 -u "../$APK_OUT" "$FOUND_DEX"
cd ..

# Clean up temporary working directories
rm -rf tmp_dex tmp_smali

# Align the ZIP structures and sign the APK using apksigner
zipalign -f -v 4 "$APK_OUT" "aligned_patched.apk"
apksigner sign --ks-key-alias lob --ks sign.keystore --ks-pass pass:369852 --key-pass pass:369852 --out "final_signed.apk" "aligned_patched.apk"
rm "aligned_patched.apk"

echo "============================================="
echo "Success! Final file: final_signed.apk"
echo "============================================="
