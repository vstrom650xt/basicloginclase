import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardColor: Color.fromARGB(255, 253, 251, 251),
      ),
      home: const InfoReg(),
    );
  }
}

class InfoReg extends StatelessWidget {
  const InfoReg({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Título de la aplicación'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navegar hacia atrás cuando se presiona la flecha de vuelta atrás
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        primary: true,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            //  _buildCard(
            //    imageUrl: provincies["provincies"][1]["comarques"][0]["img"],
           //     title: 'La Safor',
            //    subtitle1: 'Capital: Gandía',
            //    subtitle2: provincies["provincies"][1]["comarques"][0]["desc"],
           //   ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String imageUrl,
    required String title,
    required String subtitle1,
    required String subtitle2,
  }) {
    return Container(
      width: 400,
      child: Card(
        color: Color.fromARGB(255, 255, 255, 255),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Imagen
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 250,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            // Textos
            ListTile(
              title: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subtitle1,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    subtitle2,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
