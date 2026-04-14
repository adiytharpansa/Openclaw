# 🚀 Quick Start Guide

Panduan cepat untuk developer yang ingin contribute atau build sendiri.

---

## 📋 Prerequisites

### Yang Dibutuhkan:

1. **Flutter SDK** (v3.24.0 atau lebih baru)
   ```bash
   # Install via snap (Linux)
   sudo snap install flutter --classic
   
   # Atau download dari https://flutter.dev
   ```

2. **Node.js** (v22 atau lebih baru)
   ```bash
   # Install via nvm (recommended)
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
   nvm install 22
   ```

3. **Java JDK** (v17 atau lebih baru)
   ```bash
   # Ubuntu/Debian
   sudo apt install openjdk-17-jdk
   
   # macOS
   brew install openjdk@17
   ```

4. **Android SDK** & **Android Studio**
   - Download dari https://developer.android.com/studio
   - Setup Android SDK dan emulator (opsional)

---

## 🔧 Setup Development Environment

### 1. Clone Repository

```bash
git clone https://github.com/openclaw/openclaw.git
cd openclaw/termux
```

### 2. Setup Flutter App

```bash
cd flutter_app

# Get dependencies
flutter pub get

# Verify installation
flutter doctor

# Run in debug mode
flutter run
```

### 3. Setup CLI

```bash
cd ..

# Install dependencies
npm install

# Link CLI for development
npm link

# Test CLI
openclawx --help
```

---

## 🏗️ Build Commands

### Development Build

```bash
# Flutter app (debug)
cd flutter_app
flutter run

# CLI (development)
npm link
openclawx --help
```

### Release Build

```bash
# Build universal APK
./build.sh

# Or manually:
cd flutter_app
flutter build apk --release

# Build for specific architecture
flutter build apk --release --target-platform=android-arm64

# Build AAB (Google Play)
flutter build appbundle --release
```

### Test Build

```bash
# Run all tests
cd flutter_app
flutter test

# Run with coverage
flutter test --coverage

# Analyze code
flutter analyze

# CLI tests
npm test
npm run lint
```

---

## 📱 Run on Device

### Via USB

```bash
# Enable USB debugging on Android
# Connect device via USB
# Run:

flutter devices  # List connected devices
flutter run      # Run on connected device
```

### Via Emulator

```bash
# Start Android emulator from Android Studio
# Then run:

flutter emulators           # List available emulators
flutter emulators --launch  # Launch emulator
flutter run                 # Run on emulator
```

---

## 🧪 Testing

### Unit Tests

```bash
cd flutter_app
flutter test test/unit/
```

### Widget Tests

```bash
cd flutter_app
flutter test test/widget/
```

### Integration Tests

```bash
cd flutter_app
flutter test integration_test/
```

### CLI Tests

```bash
npm test
npm run lint
```

---

## 🐛 Debugging

### Enable Debug Logs

Edit `flutter_app/lib/main.dart`:

```dart
// Enable verbose logging
AppLogger.setDebugMode(true);
```

### View Logs

```bash
# Via ADB
adb logcat | grep -i openclaw

# Or in app: Settings → View Logs
```

### Debug Performance

```dart
// Add performance tracking
import 'utils/performance_utils.dart';

PerformanceUtils.startTimer('operation_name');
await expensiveOperation();
PerformanceUtils.endTimer('operation_name');
```

---

## 📦 Common Tasks

### Update Dependencies

```bash
# Flutter
cd flutter_app
flutter pub upgrade

# CLI
npm update
```

### Clean Build

```bash
# Flutter
cd flutter_app
flutter clean
flutter pub get

# CLI
rm -rf node_modules
npm install
```

### Check Code Quality

```bash
# Flutter
flutter analyze

# CLI
npm run lint
```

### Generate Documentation

```bash
# Install dartdoc
dart pub global activate dartdoc

# Generate docs
cd flutter_app
dart doc
```

---

## 🚨 Troubleshooting

### Flutter Doctor Issues

```bash
# Run flutter doctor for detailed diagnosis
flutter doctor -v

# Common fixes:
flutter config --android-sdk /path/to/sdk
flutter doctor --android-licenses
```

### Build Failed

```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter build apk --release

# Check Java version
java -version  # Should be 17+
```

### Gradle Issues

```bash
# Update Gradle
cd flutter_app/android
./gradlew wrapper --gradle-version=8.0

# Or edit android/gradle/wrapper/gradle-wrapper.properties
distributionUrl=https\://services.gradle.org/distributions/gradle-8.0-all.zip
```

### Dependency Conflicts

```bash
# Flutter: Check for conflicts
flutter pub outdated

# CLI: Check for vulnerabilities
npm audit
npm audit fix
```

---

## 📚 Resources

- **Flutter Docs**: https://docs.flutter.dev
- **Dart Docs**: https://dart.dev/guides
- **Android Dev**: https://developer.android.com
- **OpenClaw Docs**: https://docs.openclaw.ai

---

## 💡 Tips

1. **Use VS Code** dengan Flutter extension untuk development lebih cepat
2. **Enable hot reload** saat development untuk iterate lebih cepat
3. **Test di multiple devices** dengan Android versions berbeda
4. **Monitor memory usage** dengan DevTools
5. **Keep dependencies updated** tapi test sebelum upgrade major versions

---

## 🤝 Need Help?

- 💬 **Discord**: https://discord.gg/clawd
- 📖 **Docs**: https://docs.openclaw.ai
- 🐛 **Issues**: https://github.com/openclaw/openclaw/issues

---

*Happy Coding! 🚀*
