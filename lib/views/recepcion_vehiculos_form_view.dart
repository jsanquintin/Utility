import 'package:flutter/material.dart';
import '../models/cliente.dart';
import '../models/vehiculo.dart';


class RecepcionVehiculosForm extends StatefulWidget {
  const RecepcionVehiculosForm({Key? key}) : super(key: key);

  @override
  _RecepcionVehiculosFormState createState() => _RecepcionVehiculosFormState();
}

class _RecepcionVehiculosFormState extends State<RecepcionVehiculosForm> {
  int _currentStep = 0;
  Cliente cliente = Cliente();
  Vehiculo vehiculo = Vehiculo();

  List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recepción de Vehículos'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: _nextStep,
        onStepCancel: _prevStep,
        steps: _buildSteps(),
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (_currentStep > 0)
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: const Text('Atrás'),
                  ),
                TextButton(
                  onPressed: details.onStepContinue,
                  child: _currentStep == _buildSteps().length - 1 ? const Text('Finalizar') : const Text('Continuar'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Step> _buildSteps() {
    return [
      Step(
        title: const Text('Datos del Cliente'),
        content: Form(
          key: _formKeys[0],
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre',hintText: 'Introduce el nombre completo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.name,
                onChanged: (value) => cliente.nombre = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Rnc o Cedula:', hintText: 'Introduce RNC o cédula'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    print('El campo Rnc o Cedula está vacío');
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                onChanged: (value) => cliente.rnc_cedula = value,
              ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Número de Teléfono:', hintText: 'Introduce número de teléfono'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              print('El campo Número de Teléfono está vacío');
              return 'Este campo es obligatorio';
            }
            return null;
          },
          keyboardType: TextInputType.phone,
          onChanged: (value) => cliente.telefono = value,
        ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Correo:', hintText: 'Introduce  correo electrónico'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    print('El campo Correo está vacío');
                    return 'Este campo es obligatorio';
                  } else if (!value.contains('@')) {
                    return 'Por favor, introduce un correo válido';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => cliente.email = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Dirección:', hintText: 'Introduce  dirección'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    print('El campo Dirección está vacío');
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.streetAddress,
                onChanged: (value) => cliente.direccion = value,
              ),
            ],
          ),
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: const Text('Datos del Vehículo'),
        content: Form(
          key: _formKeys[1],
          child: Column(
            children: <Widget>[
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Marca'),
                // Asumiendo que tienes una lista de marcas
                items: ['Toyota', 'Ford', 'Chevrolet'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) => setState(() => vehiculo.marca = newValue!),
                validator: (value) => value == null ? 'Este campo es obligatorio' : null,
              ),
              // Agrega más campos aquí
            ],
          ),
        ),
        isActive: _currentStep >= 1,
      ),
    ];
  }

  void _nextStep() {
    if (_currentStep < _buildSteps().length - 1) {
      if (_formKeys[_currentStep].currentState!.validate()) {
        setState(() => _currentStep++);
      }
    } else {
      if (_formKeys[_currentStep].currentState!.validate()) {
        // Aquí podrías manejar la lógica de finalización, como enviar los datos a un servidor
        print('Todos los datos son válidos. Procesar información...');
      }
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }
}