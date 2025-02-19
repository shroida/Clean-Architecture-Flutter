import 'package:clean_architecture_flutter/clean_app.dart';
import 'package:flutter/material.dart';
import 'core/di/dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const CleanApp());
}
