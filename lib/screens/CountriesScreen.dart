import 'package:flutter/material.dart';
import 'package:loginclase/model/counties.dart';
import 'package:loginclase/screens/AboutReg.dart';
import 'package:loginclase/screens/ProvincesScreen.dart';
import 'package:loginclase/screens/login.dart';

class CountriesScreen extends StatelessWidget {
  final int province;
  final String imageUrl; // Declarar el parámetro imageUrl
  const CountriesScreen(
      {Key? key, required this.province, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pueblos'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProvincesScreen()),
            )
          },
        ),
      ),
      body: Stack(
        children: [
          // Cuadrados
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildClickableSquare(
                  imageUrl: imageUrl,
                  text: provincies["provincies"][1]["comarques"][0]["capital"],
                  onTap: () {
                    // Navegación a la siguiente página
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutReg()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildClickableSquare(
                  imageUrl: provincies["provincies"][1]["comarques"][1]["img"],
                  text: provincies["provincies"][1]["comarques"][1]["capital"],
                  onTap: () {
                    // Navegación a la siguiente página
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutReg()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildClickableSquare(
                  imageUrl: provincies["provincies"][1]["comarques"][2]["img"],
                  text: provincies["provincies"][1]["comarques"][2]["capital"],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutReg()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildClickableSquare(
                  imageUrl: provincies["provincies"][1]["comarques"][3]["img"],
                  text: provincies["provincies"][1]["comarques"][3]["capital"],
                  onTap: () {
                    // Navegación a la siguiente página
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AboutReg()), // Reemplaza 'Page' con el nombre correcto de tu siguiente página
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClickableSquare(
      {required String imageUrl,
      required String text,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap, // Asigna la función onTap
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Image.network(
              imageUrl,
              width: 300, // Ancho del cuadrado
              height: 150, // Altura del cuadrado
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Color.fromARGB(
                    100, 255, 255, 255), // Fondo semitransparente para el texto
                padding: const EdgeInsets.all(8),
                child: Text(
                  text,
                  style: const TextStyle(
                    color:
                        Color.fromARGB(255, 255, 255, 255), // Color del texto
                    fontSize: 16, // Tamaño del texto
                    fontWeight: FontWeight.bold, // Peso del texto
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
