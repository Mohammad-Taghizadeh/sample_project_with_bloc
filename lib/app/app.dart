import 'package:flutter/material.dart';
import 'package:sample_project_with_bloc/presentation/theme_manager.dart';

class MyApp extends StatefulWidget {

  MyApp._internal();
  int appState = 0;
  static final MyApp instance = MyApp._internal();

  factory MyApp() => instance;
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
    );
  }
}
