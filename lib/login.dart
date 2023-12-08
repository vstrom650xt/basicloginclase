import 'package:flutter/material.dart';

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
                    horizontal: size.width * 0.1, vertical: size.width * 0.1),
                child: TextField(
                  style: TextStyle(color: Colors.white),
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
                padding: EdgeInsets.only(
                    left: size.width * .1,
                    right: size.width * 0.1,
                    bottom: size.height * 0.1),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'contraseña',
                      labelStyle: TextStyle(
                          color: Color(0xFFBEBCBC),
                          fontWeight: FontWeight.w700)),
                  onChanged: (value) {},
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        Color.fromARGB(255, 173, 70, 5), // Background color
                    onPrimary: const Color.fromARGB(
                        255, 253, 253, 253), // Text Color (Foreground color)
                  ),
                  onPressed: () => {},
                  child: const Text("Iniciar Sesión"))
            ],
          ),
        ),
      ),
    );
  }
}
