# Contributing to OpenClaw Termux

Terima kasih atas minatmu untuk berkontribusi! 🎉

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards)
- [Commit Messages](#commit-messages)

---

## Code of Conduct

- Be respectful and inclusive
- Help others learn and grow
- Focus on constructive feedback
- Keep discussions professional and on-topic

---

## Getting Started

### 1. Fork the Repository

```bash
# Click "Fork" on GitHub, then clone your fork
git clone https://github.com/YOUR_USERNAME/openclaw-termux.git
cd openclaw-termux
```

### 2. Create a Branch

```bash
# Use descriptive branch names
git checkout -b feature/your-feature-name
# or
git checkout -b fix/issue-number-description
```

### 3. Make Your Changes

- Follow the coding standards below
- Test your changes thoroughly
- Update documentation if needed

---

## Development Setup

### Flutter App Development

```bash
# Navigate to Flutter app
cd flutter_app

# Install dependencies
flutter pub get

# Run in debug mode
flutter run

# Run tests
flutter test

# Build release APK
flutter build apk --release

# Build for specific architecture
flutter build apk --release --target-platform=android-arm64
```

### CLI Development

```bash
# Install dependencies
npm install

# Run linting
npm run lint

# Fix linting issues
npm run lint:fix

# Test the CLI
node bin/openclawx --help
```

---

## Pull Request Process

### 1. Before Submitting

- [ ] Code follows style guidelines
- [ ] Tests pass (if applicable)
- [ ] Documentation updated
- [ ] Changelog updated
- [ ] No sensitive data exposed

### 2. PR Title Format

Use conventional commits format:

```
feat: add new feature
fix: fix bug in gateway service
docs: update README
refactor: improve performance
test: add unit tests
chore: update dependencies
```

### 3. PR Description Template

```markdown
## Description
Brief description of changes

## Related Issues
Closes #123

## Testing
How to test these changes:
1. Step 1
2. Step 2

## Screenshots (if UI changes)
[Add screenshots here]
```

---

## Coding Standards

### Dart/Flutter

```dart
// ✅ DO: Use meaningful names
class GatewayService {
  Future<void> startGateway() async { ... }
}

// ✅ DO: Use final for immutable variables
final String apiKey = '...';

// ✅ DO: Handle errors properly
try {
  await operation();
} catch (e, stackTrace) {
  AppLogger.error('Operation failed', error: e, stackTrace: stackTrace);
}

// ❌ DON'T: Use magic numbers
const int healthCheckInterval = 3000; // 3 seconds

// ❌ DON'T: Ignore errors
await operation(); // Missing try-catch
```

### JavaScript/Node.js

```javascript
// ✅ DO: Use ES6+ features
const startGateway = async () => {
  try {
    await operation();
  } catch (error) {
    logger.error('Gateway failed', error);
  }
};

// ✅ DO: Use template literals
const url = `http://${host}:${port}`;

// ❌ DON'T: Use var
var x = 10; // Use let or const instead
```

### File Organization

```
flutter_app/lib/
├── main.dart              # App entry point
├── app.dart               # App configuration
├── constants.dart         # App constants
├── models/                # Data models
├── providers/             # State management
├── screens/               # UI screens
├── services/              # Business logic
├── utils/                 # Utilities
└── widgets/               # Reusable widgets
```

---

## Commit Messages

### Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting)
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance tasks

### Examples

```bash
feat(gateway): add auto-restart on failure

Implemented automatic gateway restart when health check fails.
Max 5 restart attempts before giving up.

Closes #45

---

fix(terminal): resolve crash on Android 10

Fixed null pointer exception in terminal initialization.
Added proper null checks for legacy Android versions.

Fixes #67

---

docs(readme): add Indonesian translation

Added Bahasa Indonesia sections to README.
Updated installation instructions.
```

---

## Performance Guidelines

### Memory Management

- Limit cached data size
- Clear timers on dispose
- Use lazy loading for large lists
- Avoid memory leaks in streams

### Network Requests

- Implement retry logic
- Set proper timeouts
- Cache responses when appropriate
- Handle network errors gracefully

### UI Performance

- Use `const` constructors
- Avoid rebuilding unnecessary widgets
- Use `ListView.builder` for long lists
- Implement pagination for large datasets

---

## Questions?

- 💬 Join our [Discord](https://discord.gg/clawd)
- 📖 Read the [docs](https://docs.openclaw.ai)
- 🐛 Report issues on [GitHub](https://github.com/openclaw/openclaw/issues)

---

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
