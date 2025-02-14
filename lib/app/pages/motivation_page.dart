import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MotivationPage extends StatefulWidget {
  const MotivationPage({super.key});

  @override
  _MotivationPageState createState() => _MotivationPageState();
}

class _MotivationPageState extends State<MotivationPage> {
  String _quote = "Cargando frase...";
  String _author = "";

  @override
  void initState() {
    super.initState();
    _fetchQuote();
  }

  // Función para obtener una frase aleatoria desde la API
  Future<void> _fetchQuote() async {
    final response = await http.get(Uri.parse('https://zenquotes.io/api/random'));

    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body);
        if (data is List && data.isNotEmpty) {
          setState(() {
            _quote = data[0]['q'] ?? "Frase no disponible";
            _author = data[0]['a'] ?? "Anónimo";
          });
        } else {
          throw Exception("Formato de respuesta inesperado");
        }
      } catch (e) {
        setState(() {
          _quote = "Error al procesar la respuesta.";
          _author = "";
        });
      }
    } else {
      setState(() {
        _quote = "Error al obtener la frase. Intenta de nuevo.";
        _author = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFE904C), // Fondo de la pantalla
      appBar: AppBar(
        title: Text("Frases Motivacionales"),
        backgroundColor: Color(0xFFC66751),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFFFBF1D9), // Fondo del card
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Inspiración del Día",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC66751),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  _quote,
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                if (_author.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "- $_author",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFC66751)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF19AA8),
                  ),
                  onPressed: _fetchQuote,
                  child: Text("No me gusto la frase", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
