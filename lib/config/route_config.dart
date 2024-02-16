import 'package:flutter/material.dart';
import '../views/home_view.dart';
import '../views/login_view.dart';
import '../views/welcome_view.dart';
import '../views/auth_wrapper.dart';

class RouteConfig {
  static final routes = <String, WidgetBuilder>{
    '/': (context) => const AuthWrapper(),
    '/login': (context) => LoginView(), // Asegúrate de que esta línea esté presente
    '/welcome': (context) => const WelcomeView(),
    '/home': (context) => const HomeView(),
    // Agrega más rutas según sea necesario
  };
}
