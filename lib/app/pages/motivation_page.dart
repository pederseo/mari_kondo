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

    print("Response body: ${response.body}"); // Para verificar la respuesta real

    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body);

        if (data != null && data is List && data.isNotEmpty) {
          setState(() {
            _quote = data[0]['q'] ?? "Frase no disponible"; // "q" contiene la frase
            _author = data[0]['a'] ?? "Anónimo"; // "a" contiene el autor
          });
        } else {
          throw Exception("Formato de respuesta inesperado");
        }
      } catch (e) {
        setState(() {
          _quote = "Error al procesar la respuesta.";
          _author = "";
        });
        print("Error parsing JSON: $e");
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
      appBar: AppBar(title: Text("Frases Motivacionales")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _quote,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            if (_author.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "- $_author",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchQuote,  // Llama a la API nuevamente
              child: Text("Give me more!"),
            ),
          ],
        ),
      ),
    );
  }
}
