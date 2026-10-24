# Starburg

First-person open-world life sim (Bloxburg-style) running in an Android WebView.
Game code: `app/src/main/assets/www/index.html` (Three.js r128).

## Build
Push to GitHub. The workflow in `.github/workflows/build.yml` builds the APK.
- Every push: download `Starburg.apk` from the Actions run's artifacts.
- Push a tag (`git tag v1.1 && git push origin v1.1`): the APK is attached to a GitHub Release.

Local build (desktop, JDK 17 + Android SDK + Gradle 8.9): download three.js r128 into
`app/src/main/assets/www/three.min.js`, point the script tag at it, run `gradle assembleDebug`.

## Admin
Tap the gear icon in game, create a PIN, type `help`. Admin is per device.

The APK is debug-signed (installable by sideloading). For Play Store, add a release keystore.
