import 'package:flutter/foundation.dart';

/// Centralized error handling and logging
class AppLogger {
  AppLogger._();

  static bool _enableDebugLogs = true;
  static final List<_LogEntry> _logs = [];
  static const int maxLogs = 1000;

  /// Enable or disable debug logs
  static void setDebugMode(bool enabled) {
    _enableDebugLogs = enabled;
  }

  /// Log info message
  static void info(String message, {String? tag}) {
    _log('INFO', message, tag: tag);
  }

  /// Log warning message
  static void warning(String message, {String? tag}) {
    _log('WARN', message, tag: tag);
  }

  /// Log error message
  static void error(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log('ERROR', message, tag: tag, error: error, stackTrace: stackTrace);
  }

  /// Log debug message (only in debug mode)
  static void debug(String message, {String? tag}) {
    if (_enableDebugLogs) {
      _log('DEBUG', message, tag: tag);
    }
  }

  /// Log verbose message (only in debug mode)
  static void verbose(String message, {String? tag}) {
    if (_enableDebugLogs) {
      _log('VERBOSE', message, tag: tag);
    }
  }

  /// Internal log method
  static void _log(
    String level,
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    final entry = _LogEntry(
      level: level,
      message: message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
      timestamp: DateTime.now(),
    );

    _logs.add(entry);

    // Keep only recent logs
    if (_logs.length > maxLogs) {
      _logs.removeAt(0);
    }

    // Print to console in debug mode
    if (kDebugMode) {
      final tagStr = tag != null ? '[$tag] ' : '';
      final errorStr = error != null ? '\nError: $error' : '';
      final stackStr = stackTrace != null ? '\n$stackTrace' : '';
      debugPrint('📝 $level $tagStr$message$errorStr$stackStr');
    }
  }

  /// Get recent logs
  static List<_LogEntry> getRecentLogs({int? limit}) {
    if (limit == null) return List.unmodifiable(_logs);
    return _logs.skip(_logs.length - limit).toList();
  }

  /// Get logs by level
  static List<_LogEntry> getLogsByLevel(String level) {
    return _logs.where((log) => log.level == level).toList();
  }

  /// Get error logs only
  static List<_LogEntry> getErrorLogs() {
    return getLogsByLevel('ERROR');
  }

  /// Clear all logs
  static void clearLogs() {
    _logs.clear();
  }

  /// Export logs as string
  static String exportLogs() {
    final buffer = StringBuffer();
    buffer.writeln('=== OpenClaw Logs ===');
    buffer.writeln('Generated: ${DateTime.now().toIso8601String()}');
    buffer.writeln('Total entries: ${_logs.length}');
    buffer.writeln('');

    for (final log in _logs) {
      buffer.writeln(log.toString());
    }

    return buffer.toString();
  }

  /// Save logs to file (async)
  static Future<void> saveLogsToFile(String path) async {
    // Implementation depends on file system access
    // This is a placeholder for future implementation
    debugPrint('📁 Saving logs to: $path');
  }
}

class _LogEntry {
  final String level;
  final String message;
  final String? tag;
  final Object? error;
  final StackTrace? stackTrace;
  final DateTime timestamp;

  _LogEntry({
    required this.level,
    required this.message,
    this.tag,
    this.error,
    this.stackTrace,
    required this.timestamp,
  });

  @override
  String toString() {
    final tagStr = tag != null ? '[$tag] ' : '';
    final errorStr = error != null ? ' | Error: $error' : '';
    return '${timestamp.toIso8601String()} | $level $tagStr$message$errorStr';
  }
}

/// Safe async execution with error handling
class SafeAsync {
  /// Execute async function with error handling
  static Future<T?> run<T>({
    required Future<T> Function() operation,
    String? tag,
    T? defaultValue,
    bool rethrow = false,
  }) async {
    try {
      return await operation();
    } catch (e, stackTrace) {
      AppLogger.error('Operation failed', tag: tag, error: e, stackTrace: stackTrace);
      if (rethrow) rethrow;
      return defaultValue;
    }
  }

  /// Execute sync function with error handling
  static T? runSync<T>({
    required T Function() operation,
    String? tag,
    T? defaultValue,
    bool rethrow = false,
  }) {
    try {
      return operation();
    } catch (e, stackTrace) {
      AppLogger.error('Operation failed', tag: tag, error: e, stackTrace: stackTrace);
      if (rethrow) rethrow;
      return defaultValue;
    }
  }
}
