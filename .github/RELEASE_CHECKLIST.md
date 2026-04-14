# 📋 Release Checklist

Use this checklist before creating a new release.

## Pre-Release

### Code Quality
- [ ] All tests passing (`flutter test` & `npm test`)
- [ ] No linting errors (`flutter analyze` & `npm run lint`)
- [ ] Code coverage acceptable (>70% recommended)
- [ ] No security vulnerabilities (`npm audit` & `dart pub outdated`)

### Documentation
- [ ] CHANGELOG.md updated with new version
- [ ] README.md updated if features changed
- [ ] README.id.md updated (Indonesian translation)
- [ ] Version numbers updated in:
  - [ ] `flutter_app/pubspec.yaml` (version & build number)
  - [ ] `package.json` (version)
  - [ ] `flutter_app/lib/constants.dart` (version constant)
- [ ] Release notes drafted in RELEASE-vX.X.X.md

### Testing
- [ ] Tested on Android 10+
- [ ] Setup wizard completes successfully
- [ ] Gateway starts without errors
- [ ] Health checks working (3s interval)
- [ ] Terminal emulator functional
- [ ] Web dashboard loads properly
- [ ] API providers configurable
- [ ] Logs viewable and searchable
- [ ] Dark mode (AMOLED) working correctly
- [ ] No crashes during normal usage (15+ min)
- [ ] Memory usage stable (<200MB)
- [ ] App survives background/foreground switch

### Performance
- [ ] App cold start < 3 seconds
- [ ] Health check interval: 3000ms
- [ ] No memory leaks detected
- [ ] Battery optimization warning shown

### Build
- [ ] Build script runs successfully (`./build.sh`)
- [ ] Universal APK generated
- [ ] Split APKs generated (armv7, arm64, x86_64)
- [ ] AAB generated (for Google Play)
- [ ] SHA256 checksums generated
- [ ] File sizes reasonable (<100MB for universal APK)

## Release Process

### 1. Create Release Branch
```bash
git checkout -b release/v2.0.0
```

### 2. Update Version Numbers
```bash
# Update in pubspec.yaml, package.json, constants.dart
# Then commit:
git commit -am "chore: bump version to 2.0.0"
```

### 3. Run Final Tests
```bash
# CLI
npm run lint
npm test

# Flutter
cd flutter_app
flutter analyze
flutter test
```

### 4. Build Release
```bash
./build.sh
```

### 5. Test APKs
- Install on physical devices (different Android versions)
- Test all critical features
- Verify no crashes

### 6. Create Git Tag
```bash
git checkout main
git merge release/v2.0.0
git tag -a v2.0.0 -m "Release v2.0.0 - Performance Optimized"
git push origin --tags
```

### 7. Trigger GitHub Release
- Push tag to trigger GitHub Actions workflow
- Monitor build: https://github.com/openclaw/openclaw/actions
- Wait for artifacts to be generated

### 8. Verify Release
- [ ] GitHub Release created automatically
- [ ] All APK files uploaded
- [ ] AAB file uploaded
- [ ] Checksums included
- [ ] Release notes formatted correctly

### 9. Post-Release
- [ ] Test download from GitHub Releases
- [ ] Verify APK installs correctly
- [ ] Announce on Discord
- [ ] Update documentation website
- [ ] Notify contributors

## Hotfix Release

For critical bug fixes:

1. Create hotfix branch from tag:
   ```bash
   git checkout -b hotfix/fix-name v2.0.0
   ```

2. Fix the issue and test thoroughly

3. Bump patch version (2.0.0 → 2.0.1)

4. Follow release process above

## Version Numbering

Following [Semantic Versioning](https://semver.org/):

- **MAJOR.MINOR.PATCH** (e.g., 2.0.0)
- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

### Examples
- `2.0.0` - Major release with breaking changes
- `2.1.0` - New features
- `2.1.1` - Bug fixes
- `2.2.0-beta.1` - Pre-release

## Rollback Procedure

If critical issues found in release:

1. **Yank release** on GitHub (mark as pre-release)
2. **Announce** issue on Discord
3. **Create hotfix** branch from previous stable tag
4. **Fix** the issue urgently
5. **Release** patch version (e.g., 2.0.1)
6. **Document** the issue in CHANGELOG

---

## Sign-Off

Before releasing, confirm:

- [ ] I have tested all critical features
- [ ] I have verified build artifacts
- [ ] I have updated all documentation
- [ ] I am confident this release is stable

**Released by:** _________________  
**Date:** _________________  
**Version:** _________________

---

*Last updated: April 14, 2026*
