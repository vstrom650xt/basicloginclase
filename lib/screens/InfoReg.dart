import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'AboutReg.dart'; // Asegúrate de importar la clase AboutReg

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
              // Access the fetched data
              Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;

              // Build the Card widget
              return _buildCard(
                comarca: data['comarca'],
                capital: data['capital'],
                poblacio: data['poblacio'],
                img: data['img'],
                desc: data['desc'],
                latitud: data['latitud'],
                longitud: data['longitud'],
              );
            }
          },
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildCard({
    required String comarca,
    required String capital,
    required String poblacio,
    required String img,
    required String desc,
    required double latitud,
    required double longitud,
  }) {
    return Card(
      child: Column(
        children: [
          Image.network(img),
          ListTile(
            title: Text('Comarca: $comarca'),
            subtitle: Text('Capital: $capital\nPoblación: $poblacio'),
          ),
          ListTile(
            title: Text('Descripción:'),
            subtitle: Text(desc),
          ),
          ListTile(
            title: Text('Ubicación:'),
            subtitle: Text('Latitud: $latitud, Longitud: $longitud'),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.beach_access),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Acerca de',
        ),
      ],
      onTap: (int index) {
        if (index == 2) {
          // Navegar a la pantalla AboutReg
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AboutReg(),
            ),
          );
        }
      },
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
