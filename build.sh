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
find . -type f -name "*.xml" -exec sed -i 's/com\.google\.android\.gms/top.nkbe.npatch.gms/g' {} +
find . -type f -name "*.xml" -exec sed -i 's/com\.google\.android\.googleapps/top.nkbe.npatch.googleapps/g' {} +
find . -type f -name "*.xml" -exec sed -i 's/com\.google\.android\.gtalkservice/top.nkbe.npatch.gtalkservice/g' {} +
find . -type f -name "*.xml" -exec sed -i 's/com\.google\.android\.providers\.gsf/top.nkbe.npatch.gsf/g' {} +
find . -type f -name "*.xml" -exec sed -i 's/com\.google\.android\.c2dm/top.nkbe.npatch.c2dm/g' {} +
find . -type f -name "*.xml" -exec sed -i 's/com\.google\.android\.finsky/top.nkbe.npatch.finsky/g' {} +
find . -type f -name "*.xml" -exec sed -i 's/com\.google\.android\.apps\.maps/top.nkbe.npatch.maps/g' {} +
find . -name "AndroidManifest.xml" | xargs sed -i 's/com\.google\.android\.gms/top.nkbe.npatch.gms/g' || true
find . -name "AndroidManifest.xml" | xargs sed -i 's/com\.google\.android\.googleapps/top.nkbe.npatch.googleapps/g' || true
find . -name "AndroidManifest.xml" | xargs sed -i 's/com\.google\.android\.gtalkservice/top.nkbe.npatch.gtalkservice/g' || true
find . -name "AndroidManifest.xml" | xargs sed -i 's/com\.google\.android\.providers\.gsf/top.nkbe.npatch.gsf/g' || true
find . -name "AndroidManifest.xml" | xargs sed -i 's/com\.google\.android\.c2dm/top.nkbe.npatch.c2dm/g' || true
find . -name "AndroidManifest.xml" -exec sed -i 's/com\.google\.android\.location\.GeocodeProvider/top.nkbe.npatch.gms.location.GeocodeProvider/g' {} +
find . -name "AndroidManifest.xml" -exec sed -i 's/com\.google\.android\.location\.settings\.GOOGLE_LOCATION_SETTINGS/top.nkbe.npatch.gms.location.settings.GOOGLE_LOCATION_SETTINGS/g' {} +
find . -name "AndroidManifest.xml" -exec sed -i 's/com\.google\.android\.location\.internal\.GoogleLocationManagerService\.START/top.nkbe.npatch.gms.location.internal.GoogleLocationManagerService.START/g' {} +
find . -name "AndroidManifest.xml" -exec sed -i 's/com\.google\.android\.location\.reporting\.service\.START/top.nkbe.npatch.gms.location.reporting.service.START/g' {} +
find . -name "AndroidManifest.xml" -exec sed -i 's/com\.google\.android\.location\.settings\.LOCATION_REPORTING_SETTINGS/top.nkbe.npatch.gms.location.settings.LOCATION_REPORTING_SETTINGS/g' {} +
find . -name "AndroidManifest.xml" -exec sed -i 's/com\.google\.android\.location\.settings\.LocationHistorySettingsActivity/top.nkbe.npatch.gms.location.settings.LocationHistorySettingsActivity/g' {} +
find . -name "AndroidManifest.xml" -exec sed -i 's/com\.google\.android\.gsf\.gservices/top.nkbe.npatch.gsf.gservices/g' {} +
find . -name "AndroidManifest.xml" -exec sed -i 's/com\.google\.android\.gsf\.action\.GET_GLS/top.nkbe.npatch.gsf.action.GET_GLS/g' {} +
find . -name "AndroidManifest.xml" -exec sed -i 's/com\.google\.android\.gcm\.intent\.SEND/top.nkbe.npatch.gms.gcm.intent.SEND/g' {} +
find . -name "AndroidManifest.xml" -exec sed -i 's/com\.google\.android\.contextmanager\.service\.ContextManagerService\.START/top.nkbe.npatch.gms.contextmanager.service.ContextManagerService.START/g' {} +
find . -name "AndroidManifest.xml" -exec sed -i 's/com\.google\.android\.mdd\.service\.START/top.nkbe.npatch.gms.mdd.service.START/g' {} +
find . -name "AndroidManifest.xml" -exec sed -i 's/com\.google\.android\.mdh\.service\.START/top.nkbe.npatch.gms.mdh.service.START/g' {} +
find . -name "AndroidManifest.xml" -exec sed -i 's/com\.google\.android\.mdh\.service\.listener\.START/top.nkbe.npatch.gms.mdh.service.listener.START/g' {} +
find . -name "AndroidManifest.xml" -exec sed -i 's/com\.google\.android\.mobstore\.service\.START/top.nkbe.npatch.gms.mobstore.service.START/g' {} +
sed -i 's/com\.google\.android\.play\.core\.splitinstall\.BIND_SPLIT_INSTALL_SERVICE/top.nkbe.npatch.gms.play.core.splitinstall.BIND_SPLIT_INSTALL_SERVICE/g' ./vending-app/src/main/AndroidManifest.xml
sed -i 's/com\.google\.android\.engage\.BIND_APP_ENGAGE_SERVICE/top.nkbe.npatch.gms.engage.BIND_APP_ENGAGE_SERVICE/g' ./vending-app/src/main/AndroidManifest.xml
sed -i 's/com\.google\.android\.play\.core\.assetmoduleservice\.BIND_ASSET_MODULE_SERVICE/top.nkbe.npatch.gms.play.core.assetmoduleservice.BIND_ASSET_MODULE_SERVICE/g' ./vending-app/src/main/AndroidManifest.xml
sed -i 's/com\.google\.android\.play\.core\.integrityservice\.BIND_INTEGRITY_SERVICE/top.nkbe.npatch.gms.play.core.integrityservice.BIND_INTEGRITY_SERVICE/g' ./vending-app/src/main/AndroidManifest.xml
sed -i 's/com\.google\.android\.play\.core\.expressintegrityservice\.BIND_EXPRESS_INTEGRITY_SERVICE/top.nkbe.npatch.gms.play.core.expressintegrityservice.BIND_EXPRESS_INTEGRITY_SERVICE/g' ./vending-app/src/main/AndroidManifest.xml
sed -i 's/com\.google\.android\.play\.core\.install\.BIND_UPDATE_SERVICE/top.nkbe.npatch.gms.play.core.install.BIND_UPDATE_SERVICE/g' ./vending-app/src/main/AndroidManifest.xml
sed -i 's/com\.google\.android\.libraries\.identity\.googleid\.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL/top.nkbe.npatch.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL/g' ./play-services-core/src/main/res/xml/credentials_provider_google_id.xml
cp -r ../profiles/*.xml play-services-core/src/main/res/xml
export GRADLE_MICROG_VERSION_WITHOUT_GIT=0
./gradlew :play-services-core:assembleMapboxDefault
mkdir ../output
cp play-services-core/build/outputs/apk/mapboxDefault/release/*.apk ../output
zipalign -p 4 ../output/*.apk ../output/aligned.apk
apksigner sign --ks-key-alias lob --ks ../sign.keystore --ks-pass pass:369852 --key-pass pass:369852 ../output/aligned.apk
mkdir ../prebuilt
cp ../output/aligned.apk ../prebuilt/gmscore-user.apk
