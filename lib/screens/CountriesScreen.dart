import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'inforeg.dart';

class CountriesScreen extends StatelessWidget {
  final String imageUrl;
  final String baseUrl;

  const CountriesScreen({
    Key? key,
    required this.imageUrl,
    required this.baseUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Received baseUrl in CountriesScreen: $baseUrl');

    return Scaffold(
      appBar: AppBar(
        title: Text('Pueblos'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: _fetchData(baseUrl),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Widget> squareWidgets = List.generate(
                (snapshot.data as List<dynamic>).length,
                (index) {
                  var data = snapshot.data?[
                      index]; // Agregar el operador ? para comprobación de nulabilidad
                  return _buildClickableSquare(
                    imageUrl: data?["img"] ??
                        "", // Agregar el operador ? para comprobación de nulabilidad
                    text: data?["nom"] ??
                        "", // Agregar el operador ? para comprobación de nulabilidad
                    onTap: () {
                      String selectedText = data?["nom"] ??
                          ""; // Agregar el operador ? para comprobación de nulabilidad
                      String encodedText = Uri.encodeComponent(selectedText);
                      String concatenatedUrl =
                          Uri.parse('$baseUrl/$encodedText').toString();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoReg(
                            province: index,
                            imageUrl: imageUrl,
                            baseUrl: concatenatedUrl,
                          ),
                        ),
                      );
                    },
                  );
                },
              );

              return ListView(
                children: squareWidgets,
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildClickableSquare({
    required String imageUrl,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image.network(
                imageUrl,
                width: 300,
                height: 150,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Color.fromARGB(100, 255, 255, 255),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<dynamic>> _fetchData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
