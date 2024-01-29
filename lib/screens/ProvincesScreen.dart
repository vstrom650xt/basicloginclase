import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginclase/logic/peticiones.dart';
import 'package:loginclase/screens/CountriesScreen.dart';

class ProvinceWidget extends StatelessWidget {
  final String imageUrl;
  final String provinceName;
  final VoidCallback onTap;

  const ProvinceWidget({
    Key? key,
    required this.imageUrl,
    required this.provinceName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blue, Color.fromARGB(255, 94, 32, 209)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Text(provinceName),
      ),
    );
  }
}

class ProvincesScreen extends StatefulWidget {
  const ProvincesScreen({Key? key}) : super(key: key);

  @override
  _ProvincesScreenState createState() => _ProvincesScreenState();
}

class _ProvincesScreenState extends State<ProvincesScreen> {
  late List<Map<String, dynamic>> provincies;

  @override
  void initState() {
    super.initState();
    _fetchProvincies();
  }

  Future<void> _fetchProvincies() async {
    const String obtenerProvincias =
        'https://node-comarques-rest-server-production.up.railway.app/api/comarques';

    try {
      final response = await http.get(Uri.parse(obtenerProvincias));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        setState(() {
          provincies = List<Map<String, dynamic>>.from(responseData);
        });
      } else {
        print('Error en la petición: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provincias'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Center(
          child: provincies != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    provincies.length,
                    (index) => ProvinceWidget(
                      imageUrl: provincies[index]["img"],
                      provinceName: provincies[index]["provincia"],
                      onTap: () {
                        // Concatenar la URL con el nombre de la provincia
                        String provinciaUrl = 'https://node-comarques-rest-server-production.up.railway.app/api/comarques/${provincies[index]["provincia"]}';
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CountriesScreen(
                              province: index,
                              imageUrl: provincies[index]["img"],
                              url: provinciaUrl,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}