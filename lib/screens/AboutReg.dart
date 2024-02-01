import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AboutReg extends StatelessWidget {
  final double latitud;
  final double longitud;

  // Utilizamos el modificador 'final' en lugar de 'const' para los conjuntos
  final Set<String> sol = {"0"};
  final Set<String> pocsNuvols = {"1", "2", "3"};
  final Set<String> nuvols = {"45", "48"};
  final Set<String> plujasuau = {"51", "53", "55"};
  final Set<String> pluja = {
    "61", "63", "65", "66", "67", "80", "81", "82", "95", "96", "99"
  };
  final Set<String> neu = {"71", "73", "75", "77", "85", "86"};

  AboutReg({
    Key? key,
    required this.latitud,
    required this.longitud,
  }) : super(key: key);

  static const IconData thermometer = IconData(0xf864);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(thermometer, size: 100),
            FutureBuilder(
              future: _fetchData(latitud, longitud),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  Map<String, dynamic> data =
                      snapshot.data as Map<String, dynamic>;
                  Widget iconoOratge = _obtenerIcono(
                      data['current_weather']['weathercode'].toString());

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      iconoOratge,
                      TextParam(
                        texto1: data['current_weather']['temperature']
                            .toString(),
                        texto2:
                            'Wind Speed: ${data['current_weather']['windspeed']} km/h',
                        texto3:
                            'Wind Direction: ${data['current_weather']['winddirection']}°',
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _fetchData(double latitud, double longitud) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.open-meteo.com/v1/forecast?latitude=$latitud&longitude=$longitud&current_weather=true',
        ),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Widget _obtenerIcono(String value) {
    if (sol.contains(value)) {
      return Image.asset("assets/icons/png/soleado.png");
    }
    if (pocsNuvols.contains(value)) {
      return Image.asset("assets/icons/png/poco_nublado.png");
    }
    if (nuvols.contains(value)) {
      return Image.asset("assets/icons/png/nublado.png");
    }
    if (plujasuau.contains(value)) {
      return Image.asset("assets/icons/png/lluvia_debil.png");
    }
    if (pluja.contains(value)) {
      return Image.asset("assets/icons/png/lluvia.png");
    }
    if (neu.contains(value)) {
      return Image.asset("assets/icons/png/nieve.png");
    }

    return Image.asset("assets/icons/png/poco_nublado.png");
  }
}

class TextParam extends StatelessWidget {
  final String texto1;
  final String texto2;
  final String texto3;

  TextParam({
    Key? key,
    required this.texto1,
    required this.texto2,
    required this.texto3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Temperatura: $texto1°C"),
        Text(texto2),
        Text(texto3),
      ],
    );
  }
}
