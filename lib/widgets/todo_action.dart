import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class TodoAction extends StatefulWidget {
  const TodoAction({Key? key}) : super(key: key);

  @override
  _TodoActionState createState() => _TodoActionState();
}

class _TodoActionState extends State<TodoAction> {
  final _textFieldController = TextEditingController();
  String newTask = '';

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _submit() {
    if (newTask.isNotEmpty) {
      Provider.of<TodoProvider>(context, listen: false).addTask(newTask);
      _textFieldController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TodoProvider>(context);
    return Column(
      children: [
        TextField(
          controller: _textFieldController,
          decoration: const InputDecoration(
            hintText: "Add New Task",
          ),
          onChanged: (value) {
            newTask = value;
          },
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text("Submit"),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: task.allTasks.length,
          itemBuilder: (context, index) => ListTile(
            leading: Checkbox(
              value: task.allTasks[index].completed,
              onChanged: (_) => task.toggleTask(task.allTasks[index]),
            ),
            title: Text(task.allTasks[index].todoTitle),
            trailing: IconButton(
              onPressed: () {
                task.deleteTask(task.allTasks[index]);
              },
              icon: const Icon(Icons.delete),
            ),
          ),
        ),
      ],
    );
  }
}
