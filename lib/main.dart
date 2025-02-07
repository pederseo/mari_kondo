// import 'package:flutter/material.dart';
// import './app/pages/home_page.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

// Pantalla principal con un Scaffold
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Cheat Sheet'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Texto en Flutter
          Text(
            'Hola, Flutter!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 20),

          // Botón Elevado
          ElevatedButton(
            onPressed: () {
              print('Botón Presionado');
            },
            child: Text('Presióname'),
          ),

          SizedBox(height: 20),

          // Campo de Texto
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingresa algo',
              ),
            ),
          ),

          SizedBox(height: 20),

          // Imagen desde la red
          Image.network(
            'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExaGQzaTI4dTM2Nm5qb2hyMWIwY3pvMjgzZGJ5azN6Z3ludHNmbG9xMyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/Dwv8Wl7vI1JUuOektL/giphy.gif',
            height: 100,
          ),
        ],
      ),

      // Barra de Navegación Inferior
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
