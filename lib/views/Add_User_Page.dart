import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _formKey = GlobalKey<FormState>();
  String? nombres;
  String? correo;
  String? rol;
  String? clave;
  bool estatus = true;

  void _registerUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: correo!,
          password: clave!,
        );

        // Una vez que el usuario se crea con éxito, puedes añadir información adicional en Firestore.
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'nombres': nombres,
          'correo': correo,
          'rol': rol,
          'estatus': estatus,
          'fecha_crea': FieldValue.serverTimestamp(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Usuario creado con éxito")),
        );

        // Limpiar el formulario y resetear el estado
        _formKey.currentState!.reset();
        setState(() {
          estatus = true;
        });

      } on FirebaseAuthException catch (e) {
        String message;
        if (e.code == 'weak-password') {
          message = 'La contraseña proporcionada es demasiado débil.';
        } else if (e.code == 'email-already-in-use') {
          message = 'Ya existe una cuenta para ese correo electrónico.';
        } else {
          message = 'Ocurrió un error: ${e.code}';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error al registrar el usuario")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Usuario'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombres'),
                onSaved: (value) => nombres = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor introduzca los nombres';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Correo Electrónico'),
                onSaved: (value) => correo = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor introduzca el correo electrónico';
                  } else if (!value.contains('@')) {
                    return 'Por favor introduzca un correo válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Rol'),
                onSaved: (value) => rol = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor introduzca un rol';
                  }
                  return null;
                },
              ),
              SwitchListTile(
                title: const Text('Estatus'),
                value: estatus,
                onChanged: (bool val) => setState(() => estatus = val),
                secondary: const Icon(Icons.lightbulb_outline),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Clave'),
                onSaved: (value) => clave = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor introduzca la clave';
                  }
                  return null;
                },
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: _registerUser,
                child: Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
