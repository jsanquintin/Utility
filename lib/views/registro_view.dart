import 'package:flutter/material.dart';
import '../models/compania.dart';
import '../models/sucursal.dart';


class RegistroScreen extends StatefulWidget {
  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _formKey = GlobalKey<FormState>();
  List<Compania> companias = []; // Este sería tu listado de compañías obtenido de la base de datos
  List<Sucursal> sucursales = []; // Listado de sucursales, inicialmente vacío

  String? companiaSeleccionada;
  String? sucursalSeleccionada;

  @override
  void initState() {
    super.initState();
    cargarCompanias(); // Cargar las compañías al iniciar
  }

  Future<void> cargarCompanias() async {
    // Aquí cargarías las compañías de tu base de datos
    // Por ahora, lo dejaremos como un método vacío
  }

  Future<void> cargarSucursales(int companiaId) async {
    // Basado en la compañía seleccionada, cargar las sucursales correspondientes
    // Por ahora, lo dejaremos como un método vacío
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registro")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // Dropdown para seleccionar la compañía
            DropdownButtonFormField<String>(
              value: companiaSeleccionada,
              onChanged: (newValue) {
                setState(() {
                  companiaSeleccionada = newValue;
                  sucursalSeleccionada = null; // Resetear la selección de sucursal
                  cargarSucursales(int.parse(newValue!)); // Cargar sucursales basado en la compañía seleccionada
                });
              },
              items: companias.map<DropdownMenuItem<String>>((Compania compania) {
                return DropdownMenuItem<String>(
                  value: compania.companiaId.toString(),
                  child: Text(compania.nombre),
                );
              }).toList(),
              validator: (value) => value == null ? 'Seleccione una compañía' : null,
              decoration: InputDecoration(labelText: "Compañía"),
            ),

            // Dropdown para seleccionar la sucursal
            DropdownButtonFormField<String>(
              value: sucursalSeleccionada,
              onChanged: (newValue) {
                setState(() {
                  sucursalSeleccionada = newValue;
                });
              },
              items: sucursales.map<DropdownMenuItem<String>>((Sucursal sucursal) {
                return DropdownMenuItem<String>(
                  value: sucursal.sucursalId.toString(),
                  child: Text(sucursal.nombre),
                );
              }).toList(),
              validator: (value) => value == null ? 'Seleccione una sucursal' : null,
              decoration: InputDecoration(labelText: "Sucursal"),
            ),

            // Otros campos de formulario y un botón de registro aquí...

          ],
        ),
      ),
    );
  }
}
