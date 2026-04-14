class AppConstants {
  static const String appName = 'OpenClaw';
  static const String version = '2.0.0';
  static const String packageName = 'com.openclaw.termux';

  /// Matches ANSI escape sequences (e.g. color codes in terminal output).
  static final ansiEscape = RegExp(r'\x1b\[[0-9;]*[a-zA-Z]');

  static const String authorName = 'OpenClaw Contributors';
  static const String authorEmail = 'contact@openclaw.ai';
  static const String githubUrl = 'https://github.com/openclaw/openclaw';
  static const String license = 'MIT';

  static const String githubApiLatestRelease =
      'https://api.github.com/repos/openclaw/openclaw/releases/latest';

  // Official OpenClaw
  static const String orgName = 'OpenClaw';
  static const String orgEmail = 'contact@openclaw.ai';
  static const String discordUrl = 'https://discord.gg/clawd';
  static const String docsUrl = 'https://docs.openclaw.ai';
  static const String websiteUrl = 'https://openclaw.ai';

  static const String gatewayHost = '127.0.0.1';
  static const int gatewayPort = 18789;
  static const String gatewayUrl = 'http://$gatewayHost:$gatewayPort';

  static const String ubuntuRootfsUrl =
      'https://cdimage.ubuntu.com/ubuntu-base/releases/24.04/release/ubuntu-base-24.04.3-base-';
  static const String rootfsArm64 = '${ubuntuRootfsUrl}arm64.tar.gz';
  static const String rootfsArmhf = '${ubuntuRootfsUrl}armhf.tar.gz';
  static const String rootfsAmd64 = '${ubuntuRootfsUrl}amd64.tar.gz';

  // Node.js binary tarball — downloaded directly by Flutter, extracted by Java.
  // Bypasses curl/gpg/NodeSource which fail inside proot.
  static const String nodeVersion = '22.14.0';
  static const String nodeBaseUrl =
      'https://nodejs.org/dist/v$nodeVersion/node-v$nodeVersion-linux-';

  static String getNodeTarballUrl(String arch) {
    switch (arch) {
      case 'aarch64':
        return '${nodeBaseUrl}arm64.tar.xz';
      case 'arm':
        return '${nodeBaseUrl}armv7l.tar.xz';
      case 'x86_64':
        return '${nodeBaseUrl}x64.tar.xz';
      default:
        return '${nodeBaseUrl}arm64.tar.xz';
    }
  }

  static const int healthCheckIntervalMs = 3000; // Faster health checks
  static const int maxAutoRestarts = 5;
  static const int connectionTimeoutMs = 10000; // 10s timeout
  static const int readTimeoutMs = 30000; // 30s read timeout

  // Node constants
  static const int wsReconnectBaseMs = 350;
  static const double wsReconnectMultiplier = 1.7;
  static const int wsReconnectCapMs = 8000;
  static const String nodeRole = 'node';
  static const int pairingTimeoutMs = 300000;

  // Performance optimizations
  static const int logBufferSize = 500; // Max logs to keep in memory
  static const int cacheExpirySeconds = 3600; // 1 hour cache
  static const bool enableAnimations = true;
  static const Duration animationDuration = Duration(milliseconds: 200);

  static const String channelName = 'com.nxg.openclawproot/native';
  static const String eventChannelName = 'com.nxg.openclawproot/gateway_logs';

  static String getRootfsUrl(String arch) {
    switch (arch) {
      case 'aarch64':
        return rootfsArm64;
      case 'arm':
        return rootfsArmhf;
      case 'x86_64':
        return rootfsAmd64;
      default:
        return rootfsArm64;
    }
  }
}
