import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'utils/app_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Enable system UI overlay
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  
  // Initialize logger
  AppLogger.info('OpenClaw starting...');
  
  runApp(const OpenClawApp());
}
