import 'package:flutter/material.dart';

class AboutReg extends StatelessWidget {
  const AboutReg({Key? key});
  static const IconData thermometer = IconData(0xf864);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('La Safor'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/images/wall.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconData(0xf864, fontFamily: 'iconFont'),
                  size: 40,
                  color: const Color.fromARGB(255, 44, 43, 36),
                ),
                Text("5.4*"),
                Padding(padding: EdgeInsets.all(50)),
              ],
            ),
            TextParam(
              texto1: '16.516', texto2: '1561.125', texto3: '189.119',
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
    super.key,
    required this.texto1, required this.texto2, required this.texto3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("poblacion:$texto1"),
        Text("Latitud:$texto2"),
        Text("Longitud:$texto3"),

      ],
    );
  }
}
