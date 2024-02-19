import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import 'package:provider/provider.dart';
import '../view_models/login_view_model.dart';

class AdaptiveMenu extends StatelessWidget {
  final List<MenuItem> menuItems;

  const AdaptiveMenu({Key? key, required this.menuItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;
        return isMobile ? _mobileMenu(context) : _webMenu(context);
      },
    );
  }

  Widget _mobileMenu(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: menuItems.map((item) => ListTile(
                leading: Icon(item.icon),
                title: Text(item.title),
                onTap: () {
                  Navigator.of(context).pop(); // Cierra el drawer
                  if (item.title == "Recepción de Vehículos") {
                    Navigator.of(context).pushNamed('/recepcionVehiculosForm');
                  } else if (item.routeName != null) {
                    Navigator.of(context).pushNamed(item.routeName!);
                  }
                },
              )).toList(),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.red),
            title: Text('Salir', style: TextStyle(color: Colors.red)),
            onTap: () async {
              // Implementa la funcionalidad de cerrar sesión
              await Provider.of<LoginViewModel>(context, listen: false).signOut();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
    );
  }

  Widget _webMenu(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: menuItems.map((item) => _createWebMenuItem(item, context)).toList(),
        ),
        _logoutButton(context),
      ],
    );
  }

  Widget _createWebMenuItem(MenuItem item, BuildContext context) {
    if (item.subItems != null && item.subItems!.isNotEmpty) {
      return DropdownButtonHideUnderline(
        child: DropdownButton<MenuItem>(
          icon: Icon(item.icon, color: Colors.black),
          onChanged: (MenuItem? value) {
            if (value != null && value.routeName != null) {
              Navigator.of(context).pushNamed(value.routeName!);
            }
          },
          items: item.subItems!.map((MenuItem subItem) {
            return DropdownMenuItem<MenuItem>(
              value: subItem,
              child: Text(subItem.title),
            );
          }).toList(),
        ),
      );
    } else {
      return TextButton(
        onPressed: item.routeName != null ? () => Navigator.of(context).pushNamed(item.routeName!) : null,
        child: Row(
          children: [
            Icon(item.icon, color: Colors.black),
            Text(item.title, style: TextStyle(color: Colors.black)),
          ],
        ),
      );
    }
  }

  Widget _logoutButton(BuildContext context) {
    return TextButton(
      onPressed: () async {
        // Implementa la funcionalidad de cerrar sesión
        await Provider.of<LoginViewModel>(context, listen: false).signOut();
        Navigator.of(context).pushReplacementNamed('/login');
      },
      style: TextButton.styleFrom(
        primary: Colors.red, // Color del texto
      ),
      child: Row(
        children: [
          Icon(Icons.exit_to_app, color: Colors.red), // Icono de salir
          Text('Salir', style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
