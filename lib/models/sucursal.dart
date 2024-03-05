class Sucursal {
  final int sucursalId;
  final String nombre;
  final int companiaId;

  Sucursal({this.sucursalId = 0, required this.nombre, required this.companiaId});

  Map<String, dynamic> toMap() {
    return {
      'sucursal_id': sucursalId,
      'nombre': nombre,
      'compania_id': companiaId,
    };
  }

  factory Sucursal.fromMap(Map<String, dynamic> map) {
    return Sucursal(
      sucursalId: map['sucursal_id'],
      nombre: map['nombre'],
      companiaId: map['compania_id'],
    );
  }
}
