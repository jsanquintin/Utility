import 'package:flutter/material.dart';
import '../models/cliente.dart';
import '../models/vehiculo.dart';


class RecepcionVehiculosForm extends StatefulWidget {
  @override
  _RecepcionVehiculosFormState createState() => _RecepcionVehiculosFormState();
}

class _RecepcionVehiculosFormState extends State<RecepcionVehiculosForm> {
  int _currentStep = 0;
  Cliente cliente = Cliente();
  Vehiculo vehiculo = Vehiculo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recepción de Vehículos'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: _nextStep,
        onStepCancel: _prevStep,
        steps: _buildSteps(),
      ),
    );
  }


  List<Step> _buildSteps() {
    return [
      Step(
        title: const Text('Datos del Cliente'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nombre'),
              onChanged: (value) => cliente.nombre = value,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Rnc o Cedula'),
              onChanged: (value) => cliente.rnc_cedula = value,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Número de Teléfono'),
              onChanged: (value) => cliente.telefono = value,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Dirección'),
              onChanged: (value) => cliente.direccion = value,
            ),
            // Agrega aquí más campos si necesitas
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: const Text('Datos del Vehículo'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Marca'),
              onChanged: (value) => vehiculo.marca = value,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Modelo'),
              onChanged: (value) => vehiculo.modelo = value,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Año'),
              onChanged: (value) => vehiculo.ano = value,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Color'),
              onChanged: (value) => vehiculo.color = value,
            ),
            // Agrega aquí más campos si necesitas
          ],
        ),
        isActive: _currentStep >= 1,
      ),
      // Puedes agregar más pasos aquí si hay más categorías de información
    ];
  }

  void _nextStep() {
    if (_currentStep < _buildSteps().length - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      // Aquí podrías añadir lógica para manejar el envío del formulario
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }
}
