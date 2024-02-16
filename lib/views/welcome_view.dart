import 'package:flutter/material.dart';
import 'dart:async';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  void initState() {
    super.initState();
    // Navega a la siguiente pantalla después de un retraso
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bienvenido")),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("¡Bienvenido a tu Taller Automotriz!"),
            CircularProgressIndicator(), // Opcional: Muestra un indicador de carga
          ],
        ),
      ),
    );
  }
}
