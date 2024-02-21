import 'package:flutter/material.dart';
import '../models/cliente.dart';
import '../models/vehiculo.dart';
import 'package:flutter/services.dart';
import '../services/DatabaseHelper.dart';




class RecepcionVehiculosForm extends StatefulWidget {
  const RecepcionVehiculosForm({Key? key}) : super(key: key);

  @override
  _RecepcionVehiculosFormState createState() => _RecepcionVehiculosFormState();
}

class _RecepcionVehiculosFormState extends State<RecepcionVehiculosForm> {
  int _currentStep = 0;
  Cliente cliente = Cliente();
  Vehiculo vehiculo = Vehiculo();
  final TextEditingController _controller = TextEditingController();

  List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  // Datos de ejemplo, reemplazar con datos de la base de datos en un caso real
  List<String> marcasList = ['Toyota', 'Ford', 'Chevrolet'];
  List<String> modelosList = ['Corolla', 'Mustang', 'Camaro'];
  List<String> anosList = ['2019', '2020', '2021'];
  List<String> coloresList = ['Rojo', 'Azul', 'Negro'];

  String? marcaSeleccionada;
  String? modeloSeleccionado;
  String? anoSeleccionado;
  String? colorSeleccionado;

  @override
  void initState() {
    super.initState();
    // Aquí puedes inicializar valores si es necesario
  }

  @override
  void dispose() {
    // Paso 3: Disponer el TextEditingController
    _controller.dispose();
    super.dispose();
  }

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
                onChanged: (value) => cliente.documento = value,
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
          onChanged: (value) => cliente.telefono1 = value,
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
              TextFormField(
                decoration: const InputDecoration(labelText: 'Chasis:', hintText: 'Introduce número de Chasis'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    print('El campo Número de Chasis está vacío');
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  final upperValue = value.toUpperCase();
                  vehiculo.chasis = upperValue; // Asegura que el valor se guarde en mayúsculas
                  // Esto es necesario para actualizar el campo de texto visualmente con el valor en mayúsculas
                  _controller.text = upperValue;
                  _controller.selection = TextSelection.fromPosition(TextPosition(offset: upperValue.length));
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")), // Permite solo letras y números
                ],
                // Asegúrate de inicializar y disponer el TextEditingController en el estado de tu widget
                controller: _controller,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'KM/MI', hintText: 'Introduce el kilometraje o millas.'),
                validator: (value) {
                  if (value == null || value.isEmpty){
                    print('El campo kilomatraje o milla esta vacío');
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                onChanged: (value) => vehiculo.kilometraje_millas = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Placa', hintText: 'Introduce la placa.'),
                validator: (value) {
                  if (value == null || value.isEmpty){
                    print('El campo placa esta vacío');
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                onChanged: (value) => vehiculo.placa = value,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Marca'),
                value: marcaSeleccionada,
                items: marcasList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) => setState(() => marcaSeleccionada = newValue),
                validator: (value) => value == null ? 'Este campo es obligatorio' : null,
              ),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Modelo'),
                value: modeloSeleccionado,
                items: modelosList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) => setState(() => modeloSeleccionado = newValue),
                validator: (value) => value == null ? 'Este campo es obligatorio' : null,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Año'),
                value: anoSeleccionado,
                items: anosList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) => setState(() => anoSeleccionado = newValue),
                validator: (value) => value == null ? 'Este campo es obligatorio' : null,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Color'),
                value: colorSeleccionado,
                items: coloresList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) => setState(() => colorSeleccionado = newValue),
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


  void _nextStep() async {
    final isLastStep = _currentStep == _buildSteps().length - 1;
    if (isLastStep) {
      if (_formKeys[_currentStep].currentState!.validate()) {
        try {
          // Antes de intentar la inserción, asegúrate de que los valores seleccionados se asignen al objeto vehiculo
          vehiculo.marca = marcaSeleccionada ?? ""; // Asegúrate de tener un valor por defecto o manejar el caso de null
          vehiculo.modelo = modeloSeleccionado ?? "";
          vehiculo.color = colorSeleccionado ?? "";
          vehiculo.ano = int.tryParse(anoSeleccionado ?? "0") ?? 0; // Convierte el año a int, maneja null y valores no válidos

          // Verifica si los datos críticos del vehículo están presentes
          if (vehiculo.marca.isEmpty || vehiculo.modelo.isEmpty || vehiculo.color.isEmpty || vehiculo.ano == 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Por favor, completa todos los campos del vehículo.')),
            );
            return; // Detiene la ejecución si falta algún dato crítico
          }

          final dbHelper = DatabaseHelper.instance;

          // Insertar cliente y vehículo en la base de datos
          await dbHelper.insertarCliente(cliente);
          await dbHelper.insertarVehiculo(vehiculo);

          // Mostrar un mensaje de éxito
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Datos enviados con éxito')),
          );

          // Opcional: Navegar a otra pantalla o restablecer el formulario
        } catch (e) {
          // Manejar el error, por ejemplo, mostrando un mensaje al usuario
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al enviar datos: $e')),
          );
          print('Error al enviar datos: $e');
        }
      }
    } else {
      if (_formKeys[_currentStep].currentState!.validate()) {
        setState(() => _currentStep++);
      }
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }
}