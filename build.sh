#!/bin/bash

# OpenClaw Termux - Build Script v2.0.0
# Automates the build process for Flutter APK and AAB

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
APP_NAME="OpenClaw"
VERSION="2.0.0"
FLUTTER_DIR="flutter_app"
BUILD_DIR="build"
OUTPUT_DIR="releases"

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   OpenClaw Termux - Build Script v2    ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}❌ Flutter is not installed or not in PATH${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Flutter found: $(flutter --version | head -n 1)${NC}"
echo ""

# Navigate to Flutter app directory
echo -e "${YELLOW}📁 Navigating to Flutter app directory...${NC}"
cd "$FLUTTER_DIR"

# Clean build
echo -e "${YELLOW}🧹 Cleaning previous builds...${NC}"
flutter clean
echo ""

# Get dependencies
echo -e "${YELLOW}📦 Getting dependencies...${NC}"
flutter pub get
echo ""

# Run analyzer
echo -e "${YELLOW}🔍 Running static analysis...${NC}"
if flutter analyze; then
    echo -e "${GREEN}✅ Analysis passed${NC}"
else
    echo -e "${RED}❌ Analysis failed. Please fix errors before building.${NC}"
    exit 1
fi
echo ""

# Run tests (if any)
echo -e "${YELLOW}🧪 Running tests...${NC}"
if flutter test; then
    echo -e "${GREEN}✅ Tests passed${NC}"
else
    echo -e "${YELLOW}⚠️  Tests failed or no tests found (continuing...)${NC}"
fi
echo ""

# Create releases directory
cd ..
mkdir -p "$OUTPUT_DIR"

# Build APK (universal)
echo -e "${YELLOW}📱 Building Universal APK...${NC}"
cd "$FLUTTER_DIR"
flutter build apk --release --dart-define=app.version=$VERSION
cd ..

# Copy APK to releases directory
cp "$FLUTTER_DIR/build/app/outputs/flutter-apk/app-release.apk" "$OUTPUT_DIR/openclaw-v$VERSION.apk"
echo -e "${GREEN}✅ APK built: $OUTPUT_DIR/openclaw-v$VERSION.apk${NC}"
echo ""

# Build APK per ABI (smaller file sizes)
echo -e "${YELLOW}📱 Building APK per ABI...${NC}"
flutter build apk --release --split-per-abi --dart-define=app.version=$VERSION

# Copy split APKs
cp "$FLUTTER_DIR/build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk" "$OUTPUT_DIR/openclaw-v$VERSION-armv7.apk"
cp "$FLUTTER_DIR/build/app/outputs/flutter-apk/app-arm64-v8a-release.apk" "$OUTPUT_DIR/openclaw-v$VERSION-arm64.apk"
cp "$FLUTTER_DIR/build/app/outputs/flutter-apk/app-x86_64-release.apk" "$OUTPUT_DIR/openclaw-v$VERSION-x86_64.apk"

echo -e "${GREEN}✅ Split APKs built${NC}"
echo ""

# Build AAB (for Google Play)
echo -e "${YELLOW}📦 Building AAB (Android App Bundle)...${NC}"
flutter build appbundle --release --dart-define=app.version=$VERSION

# Copy AAB to releases directory
cp "$FLUTTER_DIR/build/app/outputs/bundle/release/app-release.aab" "$OUTPUT_DIR/openclaw-v$VERSION.aab"
echo -e "${GREEN}✅ AAB built: $OUTPUT_DIR/openclaw-v$VERSION.aab${NC}"
echo ""

# Generate checksums
echo -e "${YELLOW}🔐 Generating SHA256 checksums...${NC}"
cd "$OUTPUT_DIR"
sha256sum openclaw-v$VERSION.apk > openclaw-v$VERSION.apk.sha256
sha256sum openclaw-v$VERSION-armv7.apk > openclaw-v$VERSION-armv7.apk.sha256
sha256sum openclaw-v$VERSION-arm64.apk > openclaw-v$VERSION-arm64.apk.sha256
sha256sum openclaw-v$VERSION-x86_64.apk > openclaw-v$VERSION-x86_64.apk.sha256
sha256sum openclaw-v$VERSION.aab > openclaw-v$VERSION.aab.sha256
cd ..

echo -e "${GREEN}✅ Checksums generated${NC}"
echo ""

# Display build summary
echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║         Build Summary                  ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}Version:${NC} $VERSION"
echo -e "${GREEN}Build Time:${NC} $(date '+%Y-%m-%d %H:%M:%S')"
echo ""
echo -e "${YELLOW}Output Files:${NC}"
ls -lh "$OUTPUT_DIR"/*.apk "$OUTPUT_DIR"/*.aab 2>/dev/null | awk '{print "  📄 " $9 " (" $5 ")"}'
echo ""
echo -e "${GREEN}✅ Build completed successfully!${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Test the APK on real devices"
echo "  2. Create GitHub release"
echo "  3. Upload APK and AAB files"
echo "  4. Update changelog"
echo ""
