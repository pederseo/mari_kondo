import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final TextEditingController _taskController = TextEditingController();
  List<String> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  // Cargar tareas desde SharedPreferences
  _loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _tasks = prefs.getStringList('tasks') ?? [];
    });
  }

  // Guardar tareas en SharedPreferences
  _saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('tasks', _tasks);
  }

  // Agregar tarea
  _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add(_taskController.text);
        _taskController.clear();
        _saveTasks(); // Guardamos las tareas actualizadas
      });
    }
  }

  // Eliminar tarea
  _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
      _saveTasks(); // Guardamos las tareas actualizadas
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Tareas")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de texto para ingresar tarea
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: "Ingrese una tarea",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Botón para agregar tarea
            ElevatedButton(
              onPressed: _addTask,
              child: Text("Agregar Tarea"),
            ),
            SizedBox(height: 20),
            // Mostrar tareas en una lista
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_tasks[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteTask(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
