plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.cpp_integration"
    compileSdk = 36
    ndkVersion '28.2.13676358'

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_11
        targetCompatibility JavaVersion.VERSION_11
        coreLibraryDesugaringEnabled true
    }

    kotlinOptions {
        jvmTarget = '11'
    }

    defaultConfig {
        applicationId = "com.example.cpp_integration"
        multiDexEnabled true
        minSdkVersion 30
        targetSdkVersion 36
        buildToolsVersion "34.0.0"
        versionCode flutter.versionCode
        versionName flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    externalNativeBuild {
        cmake {
            path "CMakeLists.txt"
        }
    }

    packagingOptions {
        pickFirst '**/*.so'
    }
}

flutter {
    source = "../.."
}
