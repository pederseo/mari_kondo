import 'package:flutter/material.dart';
import 'task_page.dart';
import 'motivation_page.dart';
import 'prueba.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Tareas")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "¡Bienvenido a tu Lista de Tareas!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaskListPage()),
                );
              },
              child: Text("Ir a Lista de Tareas"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MotivationPage()),
                );
              },
              child: Text("Ir a Frases Motivacionales"),
            ),
          ],
        ),
      ),
    );
  }
}
