import 'package:flutter/material.dart';
import 'package:loginclase/model/counties.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Cuadrados
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSquare(
                  imageUrl: provincies["provincies"][1]["comarques"][0]["img"],
                  text: provincies["provincies"][1]["comarques"][0]["capital"],
                ),
                SizedBox(height: 10),
                _buildSquare(
                  imageUrl: provincies["provincies"][1]["comarques"][1]["img"],
                  text: provincies["provincies"][1]["comarques"][1]["capital"],
                ),
                SizedBox(height: 10),
                _buildSquare(
                  imageUrl: provincies["provincies"][1]["comarques"][2]["img"],
                  text: provincies["provincies"][1]["comarques"][2]["capital"],
                ),
                SizedBox(height: 10),
                _buildSquare(
                  imageUrl: provincies["provincies"][1]["comarques"][3]["img"],
                  text: provincies["provincies"][1]["comarques"][3]["capital"],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSquare({required String imageUrl, required String text}) {
    return ClipRRect(
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
                  color: Color.fromARGB(255, 255, 255, 255), // Color del texto
                  fontSize: 16, // Tamaño del texto
                  fontWeight: FontWeight.bold, // Peso del texto
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
