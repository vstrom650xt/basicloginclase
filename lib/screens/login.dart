import 'package:flutter/material.dart';
import 'package:loginclase/screens/CountriesScreen.dart';
import 'package:loginclase/screens/InfoReg.dart';
import 'package:loginclase/screens/ProvincesScreen.dart';
import 'package:loginclase/screens/Registro.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/images/wall.jpg"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.25, vertical: size.width * 0.03),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'email',
                      labelStyle: TextStyle(
                          color: Color(0xFFBEBCBC),
                          fontWeight: FontWeight.w700)),
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'contraseña',
                      labelStyle: TextStyle(
                          color: Color(0xFFBEBCBC),
                          fontWeight: FontWeight.w700)),
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(54.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 173, 70, 5),
                              foregroundColor:
                                  const Color.fromARGB(255, 253, 253, 253)),
                          onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProvincesScreen()),
                                )
                              },
                          child: const Text("Iniciar Sesión")),
                      const SizedBox(
                          width:
                              16.0), // Puedes ajustar el valor según tus necesidades

                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 173, 70, 5),
                              foregroundColor:
                                  const Color.fromARGB(255, 253, 253, 253)),
                          onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Registro()),
                                )
                              },
                          child: const Text("Registro"))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
