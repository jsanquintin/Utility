import 'package:flutter/material.dart';
import '../models/menu_item.dart';

final List<MenuItem> menuItems = [
  MenuItem(
    title: 'Ventas',
    icon: Icons.point_of_sale,
    subItems: [
      MenuItem(title: 'Mantenimiento', icon: Icons.build, routeName: '/ventas/mantenimiento'),
      MenuItem(title: 'Procesos', icon: Icons.loop, routeName: '/ventas/procesos'),
      MenuItem(title: 'Reportes', icon: Icons.report, routeName: '/ventas/reportes'),
      MenuItem(title: 'Consulta', icon: Icons.search, routeName: '/ventas/consulta'),
    ],
  ),
  // Repite la estructura similar para Servicios, Inventario, etc.
  MenuItem(
    title: 'Recepción de Vehículos',
    icon: Icons.car_repair,
    subItems: [
      MenuItem(title: 'Mantenimiento', icon: Icons.build, routeName: '/recepcionVehiculos/mantenimiento'),
      MenuItem(title: 'Procesos', icon: Icons.loop, routeName: '/recepcionVehiculos/procesos'),
      MenuItem(title: 'Reportes', icon: Icons.report, routeName: '/recepcionVehiculos/reportes'),
      MenuItem(title: 'Consulta', icon: Icons.search, routeName: '/recepcionVehiculos/consulta'),
    ],
  ),
  MenuItem(
    title: 'Cotización',
    icon: Icons.attach_money,
    subItems: [
      MenuItem(title: 'Mantenimiento', icon: Icons.build, routeName: '/cotizacion/mantenimiento'),
      MenuItem(title: 'Procesos', icon: Icons.loop, routeName: '/cotizacion/procesos'),
      MenuItem(title: 'Reportes', icon: Icons.report, routeName: '/cotizacion/reportes'),
      MenuItem(title: 'Consulta', icon: Icons.search, routeName: '/cotizacion/consulta'),
    ],
  ),
  MenuItem(
    title: 'Gestión de Usuarios',
    icon: Icons.people,
    subItems: [
      MenuItem(title: 'Crear Usuario', icon: Icons.person_add, routeName: '/gestionUsuarios/crear'),
      MenuItem(title: 'Editar Usuario', icon: Icons.edit, routeName: '/gestionUsuarios/editar'),
      MenuItem(title: 'Eliminar Usuario', icon: Icons.delete, routeName: '/gestionUsuarios/eliminar'),
    ],
  ),
  MenuItem(
    title: 'Gestión de Compañías',
    icon: Icons.business,
    subItems: [
      MenuItem(title: 'Agregar Compañía', icon: Icons.add_business, routeName: '/gestionCompanias/agregar'),
      MenuItem(title: 'Editar Compañía', icon: Icons.edit, routeName: '/gestionCompanias/editar'),
      MenuItem(title: 'Eliminar Compañía', icon: Icons.delete, routeName: '/gestionCompanias/eliminar'),
    ],
  ),
  MenuItem(
    title: 'Gestión de Sucursales',
    icon: Icons.store,
    subItems: [
      MenuItem(title: 'Agregar Sucursal', icon: Icons.add_business, routeName: '/gestionSucursales/agregar'),
      MenuItem(title: 'Editar Sucursal', icon: Icons.edit, routeName: '/gestionSucursales/editar'),
      MenuItem(title: 'Eliminar Sucursal', icon: Icons.delete, routeName: '/gestionSucursales/eliminar'),
    ],
  ),
];
