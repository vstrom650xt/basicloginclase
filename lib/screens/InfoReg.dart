import 'package:flutter/material.dart';
import 'package:loginclase/model/counties.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardColor: Colors.white, // Establece el color de fondo de las tarjetas
        // Otros ajustes de tema según sea necesario
      ),
      home: InfoReg(),
    );
  }
}

class InfoReg extends StatelessWidget {
  const InfoReg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('La safor'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        primary: true,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCard(
                imageUrl: provincies["provincies"][1]["comarques"][0]["img"],
                title: 'La Safor',
                subtitle1: 'Capital: Gandía',
                subtitle2: provincies["provincies"][1]["comarques"][0]["desc"],
              ),
              SizedBox(height: 10),
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
