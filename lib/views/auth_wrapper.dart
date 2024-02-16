import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'login_view.dart';
import 'home_view.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Usando StreamBuilder para escuchar los cambios en el estado de autenticación
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Si estamos esperando el primer valor del stream, mostramos un spinner
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // Si hay datos, es decir, el usuario está logueado, mostramos HomeView
        if (snapshot.hasData) {
          return const HomeView(); // Asume que HomeView es la pantalla de inicio después de iniciar sesión
        } else {
          // Si no hay datos, el usuario no está logueado, mostramos LoginView
          return LoginView(); // Asume que LoginView es la pantalla de inicio de sesión
        }
      },
    );
  }
}
