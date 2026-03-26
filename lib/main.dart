import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Main App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoPage(),
    );
  }
}

// Main Screen
class ToDoPage extends StatefulWidget {
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

// State (where data is stored)
class _ToDoPageState extends State<ToDoPage> {

  // 🔹 list to store tasks
  List<String> tasks = [];

  // 🔹 controller to read input
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do App"),
      ),

      body: Column(
        children: [

          // 🔹 input field
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Enter task",
            ),
          ),

          // 🔹 add button
          ElevatedButton(
            onPressed: () {
              setState(() {
                tasks.add(controller.text); // add task
                controller.clear(); // clear input
              });
            },
            child: Text("Add"),
          ),

          // 🔹 list of tasks
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]),

                  // 🔹 delete button
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        tasks.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}