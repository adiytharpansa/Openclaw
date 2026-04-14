import 'dart:async';
import 'package:flutter/foundation.dart';

/// Performance monitoring and optimization utilities
class PerformanceUtils {
  PerformanceUtils._();

  static final Map<String, DateTime> _timers = {};
  static final List<_PerformanceMetric> _metrics = [];
  static const int maxMetrics = 100;

  /// Start a performance timer
  static void startTimer(String label) {
    _timers[label] = DateTime.now();
  }

  /// End a performance timer and record the metric
  static void endTimer(String label) {
    final start = _timers.remove(label);
    if (start == null) return;

    final duration = DateTime.now().difference(start);
    _recordMetric(label, duration.inMilliseconds);

    if (kDebugMode) {
      debugPrint('⏱️ $label: ${duration.inMilliseconds}ms');
    }
  }

  /// Record a performance metric
  static void _recordMetric(String label, int milliseconds) {
    _metrics.add(_PerformanceMetric(
      label: label,
      milliseconds: milliseconds,
      timestamp: DateTime.now(),
    ));

    // Keep only recent metrics
    if (_metrics.length > maxMetrics) {
      _metrics.removeAt(0);
    }
  }

  /// Get recent performance metrics
  static List<_PerformanceMetric> getRecentMetrics() {
    return List.unmodifiable(_metrics);
  }

  /// Clear all metrics
  static void clearMetrics() {
    _metrics.clear();
    _timers.clear();
  }

  /// Check if app is running in debug mode
  static bool get isDebugMode => kDebugMode;

  /// Check if app is running in profile mode
  static bool get isProfileMode => kProfileMode;

  /// Check if app is running in release mode
  static bool get isReleaseMode => kReleaseMode;

  /// Debounce function for expensive operations
  static Timer? debounce(Duration duration, void Function() action) {
    Timer? timer;
    return Timer(duration, () {
      timer?.cancel();
      action();
    });
  }

  /// Throttle function to limit execution rate
  static bool throttle(Duration duration, DateTime? lastExecution) {
    if (lastExecution == null) return true;
    return DateTime.now().difference(lastExecution) > duration;
  }
}

class _PerformanceMetric {
  final String label;
  final int milliseconds;
  final DateTime timestamp;

  _PerformanceMetric({
    required this.label,
    required this.milliseconds,
    required this.timestamp,
  });

  @override
  String toString() => '$label: ${milliseconds}ms at $timestamp';
}

/// Cache utility for expensive operations
class CacheManager {
  final Map<String, _CacheEntry> _cache = {};
  final Duration defaultExpiry;

  CacheManager({this.defaultExpiry = const Duration(hours: 1)});

  /// Get value from cache
  T? get<T>(String key) {
    final entry = _cache[key];
    if (entry == null) return null;

    if (entry.isExpired) {
      _cache.remove(key);
      return null;
    }

    return entry.value as T?;
  }

  /// Set value in cache
  void set<T>(String key, T value, {Duration? expiry}) {
    _cache[key] = _CacheEntry(
      value: value,
      expiry: expiry ?? defaultExpiry,
    );
  }

  /// Remove value from cache
  void remove(String key) {
    _cache.remove(key);
  }

  /// Clear all cache
  void clear() {
    _cache.clear();
  }

  /// Clear expired entries
  void clearExpired() {
    _cache.removeWhere((_, entry) => entry.isExpired);
  }

  /// Get cache size
  int get size => _cache.length;
}

class _CacheEntry {
  final dynamic value;
  final DateTime expiresAt;

  _CacheEntry({
    required this.value,
    required Duration expiry,
  }) : expiresAt = DateTime.now().add(expiry);

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}
