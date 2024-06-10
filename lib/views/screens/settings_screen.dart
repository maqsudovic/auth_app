import 'package:flutter/material.dart';
import 'package:todo_and_reminder_app/method/load_data.dart';
import 'package:todo_and_reminder_app/method/save_data.dart';
import 'package:todo_and_reminder_app/views/widgets/custom_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeModeChanged;
  SettingsScreen({super.key, required this.onThemeModeChanged});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
  }

  void _loadThemeMode() async {
    _isDarkMode = await loadThemeMode();
    setState(() {});
  }

  void _toggleThemeMode(bool isDarkMode) {
    setState(() {
      _isDarkMode = isDarkMode;
    });
    widget.onThemeModeChanged(isDarkMode);
    saveThemeMode(isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: CustomDrawer(
        onThemeModeChanged: (value) => _toggleThemeMode(value),
      ),
      body: SwitchListTile(
        title: Text('Dark Mode'),
        value: _isDarkMode,
        onChanged: _toggleThemeMode,
      ),
    );
  }
}
