import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'views/auth_wrapper.dart';
import 'view_models/login_view_model.dart';
import 'view_models/navigation_view_model.dart';
import 'config/route_config.dart';
import 'utils/firebase_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => NavigationViewModel()),
      ],
      child: MaterialApp(
        title: 'Taller Automotriz',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple, // Define el color principal
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepPurple, // Color de fondo para AppBars
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          // Otros ajustes de tema global aquí...
        ),
        initialRoute: '/',
        routes: RouteConfig.routes,
      ),
    );
  }
}
