import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:todo_and_reminder_app/models/note.dart';
import 'package:todo_and_reminder_app/views/screens/update_note.dart';

void _showAddNoteDialog(BuildContext context) {
  String title = '';
  String content = '';

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Add Note'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              onChanged: (value) {
                title = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Content'),
              onChanged: (value) {
                content = value;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (title.isNotEmpty && content.isNotEmpty) {
                add(title, content);
                Navigator.of(context).pop();
              }
            },
            child: Text('Add'),
          ),
        ],
      );
    },
  );
}

void _showEditNoteDialog(BuildContext context, note) {
  String title = note.title;
  String content = note.content;

  TextEditingController titleController = TextEditingController(text: title);
  TextEditingController contentController = TextEditingController(text: content);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Edit Note'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onChanged: (value) {
                title = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Content'),
              controller: contentController,
              onChanged: (value) {
                content = value;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (title.isNotEmpty && content.isNotEmpty) {
                updateNote(note.id, title, content);
                Navigator.of(context).pop();
              }
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
}

