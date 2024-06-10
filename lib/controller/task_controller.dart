
import 'package:todo_and_reminder_app/models/task.dart';

class ContactsController {
  List<Contact> list = [];

  void add(String name, String task) {
    list.add(Contact(name: name, task: task));
  }

  void delete(int index) {
    list.removeAt(index);
  }

  void edit({required int index, required String name, required String task}) {
    list[index] = Contact(name: name, task: task);
  }
}
