import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_and_reminder_app/method/load_data.dart';
import 'package:todo_and_reminder_app/method/save_data.dart';
import 'package:todo_and_reminder_app/views/screens/home_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isDarkMode = await loadThemeMode();
  runApp(MyApp(isDarkMode: isDarkMode));
}

class MyApp extends StatefulWidget {
  final bool isDarkMode;
  MyApp({required this.isDarkMode});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
  }

  void _toggleThemeMode(bool isDarkMode) {
    setState(() {
      _isDarkMode = isDarkMode;
    });
    saveThemeMode(isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Homescreen(onThemeModeChanged: _toggleThemeMode),
    );
  }
}
