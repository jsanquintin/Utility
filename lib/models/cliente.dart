class Cliente {
  String cliente;
  String compania;
  String sucursal;
  String documento;
  String telefono1;
  String? telefono2;
  String nombre;
  String? email;
  String direccion;
  String estado;
  String usuario_crea;
  String fecha;

  Cliente({
     this.cliente = '',
     this.compania = '1',
     this.sucursal = '1',
     this.documento = '',
     this.telefono1 = '',
    this.telefono2 = '',
     this.nombre = '',
    this.email ='',
     this.direccion = '',
     this.estado = '',
     this.usuario_crea = '',
     this.fecha = '2024-01-01',
  });

  Map<String, dynamic> toMap() {
    return {
     // 'cliente': cliente,
      'compania_id': compania,
      'sucursal_id': sucursal,
      'documento': documento,
      'telefono1': telefono1,
      'telefono2': telefono2,
      'nombre': nombre,
      'email': email,
      'direccion': direccion,
      'estado': estado,
      'usuario_crea': usuario_crea,
      'fecha_creacion': fecha
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      cliente: map['cliente'],
      compania: map['compania'],
      sucursal: map['sucursal'],
      documento: map['documento'],
      telefono1: map['telefono1'],
      telefono2: map['telefono2'],
      nombre: map['nombre'],
      email: map['email'],
      direccion: map['direccion'],
      estado: map['estado'],
      usuario_crea: map['usuario_crea'],
      fecha: map['fecha'],
    );
  }
}
