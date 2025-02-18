import 'package:clean_architecture_flutter/core/theming/app_theme.dart';
import 'package:flutter/material.dart';

class CleanApp extends StatelessWidget {
  const CleanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: const Scaffold(
        body: Center(
          child: Text('adf'),
        ),
      ),
    );
  }
}
