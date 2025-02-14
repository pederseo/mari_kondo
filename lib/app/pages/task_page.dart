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
  // int contador = 0;

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
        // contador = _tasks.length;
        _saveTasks();
      });
    }
  }

  // Eliminar tarea
  _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
      _saveTasks();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFE904C), // Fondo de la pantalla
      appBar: AppBar(
        title: Text("Lista de Tareas"),
        backgroundColor: Color(0xFFC66751),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFFFBF1D9), // Color del card
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Mis Tareas",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC66751),
                  ),
                ),
                // Text(
                //   "Total de tareas: ${contador}",
                // ),
                SizedBox(height: 10),
                TextField(
                  controller: _taskController,
                  decoration: InputDecoration(
                    labelText: "Ingrese una tarea",
                    labelStyle: TextStyle(color: Color(0xFFC66751)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFFC66751)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFFC66751), width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF19AA8),
                  ),
                  onPressed: _addTask,
                  child: Text("Agregar Tarea", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Color(0xFFFBF1D9),
                        child: ListTile(
                          title: Text(
                            _tasks[index],
                            style: TextStyle(color: Color(0xFFC66751)),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Color(0xFFC66751)),
                            onPressed: () => _deleteTask(index),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
