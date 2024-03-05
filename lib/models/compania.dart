class Compania {
  final int companiaId;
  final String nombre;

  Compania({this.companiaId = 0, required this.nombre});

  Map<String, dynamic> toMap() {
    return {
      'compania_id': companiaId,
      'nombre': nombre,
    };
  }

  factory Compania.fromMap(Map<String, dynamic> map) {
    return Compania(
      companiaId: map['compania_id'],
      nombre: map['nombre'],
    );
  }
}
