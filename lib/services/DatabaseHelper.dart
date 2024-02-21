import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import '../models/cliente.dart';
import '../models/vehiculo.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('util.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getApplicationDocumentsDirectory();
    final path = join(dbPath.path, filePath);

    // Incrementa la versión para invocar onUpgrade cuando sea necesario.
    return await openDatabase(path, version: 1, onCreate: _createDB, onUpgrade: _onUpgrade);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS companias (
      compania_id INTEGER PRIMARY KEY AUTOINCREMENT,
      nombre TEXT NOT NULL
    );
    
    CREATE TABLE IF NOT EXISTS sucursales (
      sucursal_id INTEGER PRIMARY KEY AUTOINCREMENT,
      nombre TEXT NOT NULL,
      compania_id INTEGER,
      FOREIGN KEY (compania_id) REFERENCES companias(compania_id)
    );
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS util_clientes (
      cliente_id INTEGER PRIMARY KEY AUTOINCREMENT,
      compania_id INTEGER NOT NULL,
      sucursal_id INTEGER NOT NULL,
      documento TEXT UNIQUE NOT NULL,
      nombre TEXT NOT NULL,
      email TEXT,
      telefono1 TEXT,
      telefono2 TEXT,
      direccion TEXT,
      estado TEXT CHECK(estado IN ('Activo', 'Inactivo')),
      usuario_crea TEXT,
      fecha_creacion TEXT DEFAULT (datetime('now','localtime')),
      FOREIGN KEY (compania_id) REFERENCES companias(compania_id),
      FOREIGN KEY (sucursal_id) REFERENCES sucursales(sucursal_id)
    );
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS util_vehiculos (
      vehiculo_id INTEGER PRIMARY KEY AUTOINCREMENT,
      compania_id INTEGER NOT NULL,
      sucursal_id INTEGER NOT NULL,
      chasis TEXT NOT NULL,
      placa TEXT UNIQUE NOT NULL,
      marca TEXT NOT NULL,
      modelo TEXT NOT NULL,
      kilometraje_millas INTEGER,
      color TEXT,
      tipo TEXT,
      ano INTEGER,
      estado TEXT CHECK(estado IN ('Activo', 'Inactivo')),
      usuario_crea TEXT,
      fecha_creacion TEXT DEFAULT (datetime('now','localtime')),
      FOREIGN KEY (compania_id) REFERENCES companias(compania_id),
      FOREIGN KEY (sucursal_id) REFERENCES sucursales(sucursal_id)
    );
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Aquí puedes manejar actualizaciones específicas basadas en versiones antiguas y nuevas.
    // Por ejemplo, si oldVersion es 1 y newVersion es 2, ejecuta un conjunto específico de comandos SQL.
  }

  Future<int> insertarCliente(Cliente cliente) async {
    final db = await database;


    // Validación o asignación de valor predeterminado para 'estado'
    if (cliente.estado.isEmpty) {
      cliente.estado = 'Activo'; // Asume 'Activo' como valor predeterminado si 'estado' está vacío
    }

    final id = await db.insert('util_clientes', cliente.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<int> insertarVehiculo(Vehiculo vehiculo) async {
    final db = await database;

    if (vehiculo.estado.isEmpty) {
      vehiculo.estado = 'Activo'; // Asume un valor predeterminado o maneja el error como sea apropiado
    }

    final id = await db.insert('util_vehiculos', vehiculo.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
