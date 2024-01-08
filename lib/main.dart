import 'package:flutter/material.dart';
import 'package:loginclase/screens/AboutReg.dart';
import 'package:loginclase/screens/CountriesScreen.dart';
import 'package:loginclase/screens/InfoReg.dart';
import 'package:loginclase/screens/Login.dart';
import 'package:loginclase/screens/Registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 21, 133, 113)),
          useMaterial3: true,
        ),
        home: const login()
        //Registro(),

        //   const InfoReg(),
        //   const ProvincesScreen(),
        //   const AboutReg(),
        //   const CountriesScreen(),
        );
  }
}
