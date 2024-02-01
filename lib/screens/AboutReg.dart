import 'package:flutter/material.dart';

class AboutReg extends StatelessWidget {
  const AboutReg({
    Key? key,
    required this.latitud,
    required this.longitud,
  }) : super(key: key);

  static const IconData thermometer = IconData(0xf864);

  final double latitud;
  final double longitud;

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
            TextParam(
              texto1: 'Valor1',
              texto2: 'Latitud: $latitud',
              texto3: 'Longitud: $longitud',
            ),
          ],
        ),
      ),
    );
  }
}

class TextParam extends StatelessWidget {
  final String texto1;
  final String texto2;
  final String texto3;

  const TextParam({
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
        Text("poblacion: $texto1"),
        Text(texto2),
        Text(texto3),
      ],
    );
  }
}
