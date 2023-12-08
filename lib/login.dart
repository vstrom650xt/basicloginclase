import 'package:flutter/material.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1, vertical: size.width * 0.1),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: 'email',
                    labelStyle: TextStyle(
                        color: Color(0xFFBEBCBC), fontWeight: FontWeight.w700)),
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
                decoration: const InputDecoration(
                    labelText: 'contraseña',
                    labelStyle: TextStyle(
                        color: Color(0xFFBEBCBC), fontWeight: FontWeight.w700)),
                onChanged: (value) {},
              ),
            ),
            ElevatedButton(
                onPressed: () => {}, child: const Text("Iniciar Sesión"))
          ],
        ),
      ),
    );
  }
}
