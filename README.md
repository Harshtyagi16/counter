# Counter App

A simple Flutter counter app using Material 3 with a gradient background, smooth animations, and launcher icons. Package: `com.example.counterapp`.

## Getting Started

1. Install Flutter SDK and Android tooling.
2. Run `flutter pub get`.
3. To run the app: `flutter run`.

## Build for Release

- Update `version` in `pubspec.yaml` as needed (`1.0.0+1`).
- Configure signing for Play Store:
  - Generate keystore:
    ```bash
    keytool -genkey -v -keystore ~/counterapp-release.keystore -alias counterapp -keyalg RSA -keysize 2048 -validity 10000
    ```
  - Create `android/key.properties` with:
    ```
    storePassword=<password>
    keyPassword=<password>
    keyAlias=counterapp
    storeFile=../counterapp-release.keystore
    ```
  - Uncomment `signingConfigs` block and `signingConfig` line in `android/app/build.gradle`.

### Generate App Icons

If you want to regenerate launcher icons (already provided):

```bash
flutter pub run flutter_launcher_icons
```

### Build APK/AAB

```bash
# APK
flutter build apk --release

# AAB
flutter build appbundle --release
```
