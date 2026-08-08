sudo apt update
sudo apt install git git-lfs zipalign apksigner
git lfs install
git submodule update --init --recursive
git clone https://github.com/microg/GmsCore.git input
cd input
sed -i '/android.applicationVariants.all { variant ->/a \    variant.mergedFlavor.applicationId = "top.nkbe.npatch.gms"' play-services-core/build.gradle
find . -name "build.gradle" -o -name "build.gradle.kts" | xargs sed -i 's/"package_id", "com\.google\.android\.gms"/"package_id", "top.nkbe.npatch.gms"/g' || true
find . -name "build.gradle" -o -name "build.gradle.kts" | xargs sed -i 's/"package_id", "org\.microg\.gms"/"package_id", "top.nkbe.npatch.gms"/g' || true
find . -name "AndroidManifest.xml" | xargs sed -i 's/com\.google\.android\.gms/top.nkbe.npatch.gms/g' || true
find . -name "AndroidManifest.xml" | xargs sed -i 's/com\.google\.android\.googleapps/top.nkbe.npatch.googleapps/g' || true
find . -name "AndroidManifest.xml" | xargs sed -i 's/com\.google\.android\.gtalkservice/top.nkbe.npatch.gtalkservice/g' || true
find . -name "AndroidManifest.xml" | xargs sed -i 's/com\.google\.android\.providers\.gsf/top.nkbe.npatch.gsf/g' || true
find . -name "AndroidManifest.xml" | xargs sed -i 's/com\.google\.android\.c2dm/top.nkbe.npatch.c2dm/g' || true
cp -r ../profiles/*.xml play-services-core/src/main/res/xml
export GRADLE_MICROG_VERSION_WITHOUT_GIT=0
./gradlew :play-services-core:assembleMapboxDefault
mkdir ../output
cp play-services-core/build/outputs/apk/mapboxDefault/release/*.apk ../output
zipalign -p 4 ../output/*.apk ../output/aligned.apk
apksigner sign --ks-key-alias lob --ks ../sign.keystore --ks-pass pass:369852 --key-pass pass:369852 ../output/aligned.apk
mkdir ../prebuilt
cp ../output/aligned.apk ../prebuilt/gmscore-user.apk
