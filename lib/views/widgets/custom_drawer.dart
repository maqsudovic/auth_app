import 'package:flutter/material.dart';
import 'package:todo_and_reminder_app/views/screens/home_screens.dart';
import 'package:todo_and_reminder_app/views/screens/login_page.dart';
import 'package:todo_and_reminder_app/views/screens/notescreens.dart';
import 'package:todo_and_reminder_app/views/screens/settings_screen.dart';
import 'package:todo_and_reminder_app/views/widgets/tasks_screen.dart';

class CustomDrawer extends StatelessWidget {
  final ValueChanged<bool> onThemeModeChanged;
  CustomDrawer({super.key, required this.onThemeModeChanged});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text("Menu"),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) {
                    return Homescreen(onThemeModeChanged: onThemeModeChanged);
                  },
                ),
              );
            },
            leading: const Icon(Icons.home),
            title: const Text("Home Page"),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) {
                    return SettingsScreen(
                        onThemeModeChanged: onThemeModeChanged);
                  },
                ),
              );
            },
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) {
                    return ContactsScreen();
                  },
                ),
              );
            },
            leading: const Icon(Icons.tour_outlined),
            title: const Text("Todo"),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) {
                    return NoteScreen();
                  },
                ),
              );
            },
            leading: const Icon(Icons.note),
            title: const Text("Note"),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) {
                    return LoginScreen();
                  },
                ),
              );
            },
            leading: const Icon(Icons.login),
            title: const Text("Login"),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
        ],
      ),
    );
  }
}
