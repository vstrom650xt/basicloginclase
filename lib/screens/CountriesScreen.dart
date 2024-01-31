// lib/screens/countries_screen.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'info_reg.dart';

class CountriesScreen extends StatelessWidget {
  final int province;
  final String imageUrl;
  final String baseUrl;

  const CountriesScreen({
    Key? key,
    required this.province,
    required this.imageUrl,
    required this.baseUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Received imageUrl in CountriesScreen: $baseUrl');

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
                  return _buildClickableSquare(
                    imageUrl: imageUrl,
                    text: (snapshot.data as List<dynamic>)[index].toString(),
                    onTap: () {
                      String selectedText =
                          (snapshot.data as List<dynamic>)[index].toString();
                      String concatenatedUrl = '$baseUrl$infoComarcaPath$selectedText';

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoReg(baseUrl: concatenatedUrl),
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
