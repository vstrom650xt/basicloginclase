import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InfoReg extends StatelessWidget {
  final int province;
  final String imageUrl;
  final String baseUrl;

  const InfoReg({
    Key? key,
    required this.province,
    required this.imageUrl,
    required this.baseUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Received baseUrl in InfoReg: $baseUrl');

    return Scaffold(
      appBar: AppBar(
        title: Text('Información de la Comarca'),
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
              // Aquí puedes construir la interfaz utilizando los datos obtenidos
              // Puedes acceder a los datos como snapshot.data

              return Container(
                child: Text('Información de la Comarca'),
              );
            }
          },
        ),
      ),
    );
  }

  Future<dynamic> _fetchData(String url) async {
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
