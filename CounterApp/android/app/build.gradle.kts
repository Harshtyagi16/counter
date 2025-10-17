plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.counterapp"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.counterapp"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        // Pin explicit versioning for Play Store
        versionCode = 1
        versionName = "1.0.0"
    }

    buildTypes {
        release {
            // Signing configuration:
            // 1) Create a keystore:
            //    keytool -genkey -v -keystore ~/counterapp-release.keystore -alias counterapp -keyalg RSA -keysize 2048 -validity 10000
            // 2) Create android/key.properties with:
            //    storeFile=/absolute/path/to/counterapp-release.keystore
            //    storePassword=YOUR_STORE_PASSWORD
            //    keyAlias=counterapp
            //    keyPassword=YOUR_KEY_PASSWORD
            // 3) Uncomment the signingConfig block below and define signingConfigs.release in android block.
            // 4) Build AAB: flutter build appbundle --release
            //    Build APK: flutter build apk --release

            // signingConfig = signingConfigs.getByName("release")
            // For dev convenience; replace with release signing above for Play release
            signingConfig = signingConfigs.getByName("debug")
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
        debug {
            applicationIdSuffix = ".debug"
        }
    }

    // Example of release signing config (disabled by default). See instructions above.
    // signingConfigs {
    //     create("release") {
    //         val props = java.util.Properties()
    //         val propsFile = rootProject.file("android/key.properties")
    //         if (propsFile.exists()) props.load(propsFile.inputStream())
    //         storeFile = props["storeFile"]?.let { file(it as String) }
    //         storePassword = props["storePassword"] as String?
    //         keyAlias = props["keyAlias"] as String?
    //         keyPassword = props["keyPassword"] as String?
    //     }
    // }
}

flutter {
    source = "../.."
}
