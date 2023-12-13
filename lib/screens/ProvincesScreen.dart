import 'package:flutter/material.dart';
import 'package:loginclase/model/counties.dart';

///el objeto

class ProvinceWidget extends StatelessWidget {
  final String imageUrl;
  final String provinceName;

  const ProvinceWidget({
    Key? key,
    required this.imageUrl,
    required this.provinceName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 300, // Adjust the width according to your needs
      height: 300,
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
    );
  }
}

// su uso
class ProvincesScreen extends StatelessWidget {
  const ProvincesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProvinceWidget(
                imageUrl: provincies["provincies"][2]["img"],
                provinceName: 'Castellon',
              ),
              const Padding(
                padding: EdgeInsets.all(14.0),
              ),
              ProvinceWidget(
                imageUrl: provincies["provincies"][0]["img"],
                provinceName: 'Valencia',
              ),
              const Padding(
                padding: EdgeInsets.all(14.0),
              ),
              ProvinceWidget(
                imageUrl: provincies["provincies"][1]["img"],
                provinceName: 'Alicante',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
