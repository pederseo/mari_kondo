import 'package:flutter/material.dart';
import 'task_page.dart';
import 'motivation_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override

  final hola = "hola";

  

  String _mensaje () {
    int hour = DateTime.now().hour;
    print(hour);

    if (hour >= 5) {
      return "buenos dias!";

    } else if (hour >= 12) {
      return "buenas tardes!";

    } else {
      return "buenas noches";
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFE904C),
      appBar: AppBar(
        title: Text("Lista de Tareas"),
        backgroundColor: Color(0xFFC66751),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // GIF en la parte superior
          Image.network(
            "https://media.giphy.com/media/Dwv8Wl7vI1JUuOektL/giphy.gif?cid=790b76119ii766hnr236v4ym4ulgwyuh1hm7kbyr12oxl30j&ep=v1_gifs_search&rid=giphy.gif&ct=g",
            height: 200,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.broken_image,
              size: 100,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 20),

          // Card con contenido
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFFBF1D9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_mensaje()),
                  Text(
                    '''¡Bienvenido a tu Lista de Tareas!\n Organiza tus pendientes, mantén el enfoque y deja que una dosis de inspiración te guíe.''',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC66751),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF19AA8),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TaskListPage()),
                      );
                    },
                    child: Text("Lista de Tareas", style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF19AA8),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MotivationPage()),
                      );
                    },
                    child: Text("Inspirame", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
