import 'package:flutter/material.dart';
import 'package:loginclase/model/counties.dart';
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

class ProvincesScreen extends StatelessWidget {
  const ProvincesScreen({
    Key? key,
  }) : super(key: key);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProvinceWidget(
                imageUrl: provincies["provincies"][2]["img"],
                provinceName: 'Castellon',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CountriesScreen(
                        province: 0,
                        imageUrl: provincies["provincies"][2]["img"],
                      ),
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.all(14.0),
              ),
              ProvinceWidget(
                imageUrl: provincies["provincies"][0]["img"],
                provinceName: 'Valencia',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CountriesScreen(
                        province: 1,
                        imageUrl: provincies["provincies"][0]["img"],
                      ),
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.all(14.0),
              ),
              ProvinceWidget(
                imageUrl: provincies["provincies"][1]["img"],
                provinceName: 'Alicante',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CountriesScreen(
                        province: 2,
                        imageUrl: provincies["provincies"][1]["img"],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
