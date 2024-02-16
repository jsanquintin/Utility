import 'package:flutter/material.dart';
import '../config/menu_config.dart';
import 'adaptive_menu.dart';
import '../models/menu_item.dart'; // Ajusta la ruta según sea necesario


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    List<MenuItem> filteredMenuItems = isMobile
        ? menuItems.where((item) => item.title == 'Recepción de Vehículos' || item.title == 'Cotización').toList()
        : menuItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        actions: !isMobile ? [AdaptiveMenu(menuItems: filteredMenuItems)] : [],
      ),
      drawer: isMobile ? Drawer(child: AdaptiveMenu(menuItems: filteredMenuItems)) : null,
      body: Center(
        child: Text('Bienvenido al Taller Automotriz'),
      ),
    );
  }
}
