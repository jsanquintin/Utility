class Vehiculo {
  String compania;
  String sucursal;
  String vehiculo;
  String chasis;
  String placa;
  String marca;
  String modelo;
  String kilometraje_millas;
  String color;
  String tipo;
  int ano;
  String estado;

  Vehiculo({
     this.compania = '1',
     this.sucursal = '1',
     this.vehiculo = '',
     this.chasis  = '',
     this.placa   = '',
     this.marca   = '',
     this.modelo  = '',
     this.kilometraje_millas = '',
     this.color = '',
     this.tipo = '',
     this.ano = 0,
     this.estado = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'compania_id': compania,
      'sucursal_id': sucursal,
      //'vehiculo': vehiculo,
      'chasis': chasis,
      'placa': placa,
      'marca': marca,
      'modelo': modelo,
      'kilometraje_millas': kilometraje_millas,
      'color': color,
      'tipo': tipo,
      'ano': ano,
      'estado': estado,
    };
  }

  factory Vehiculo.fromMap(Map<String, dynamic> map) {
    return Vehiculo(
      compania: map['compania'],
      sucursal: map['sucursal'],
      vehiculo: map['vehiculo'],
      chasis: map['chasis'],
      placa: map['placa'],
      marca: map['marca'],
      modelo: map['modelo'],
      kilometraje_millas: map['kilometraje_millas'],
      color: map['color'],
      tipo: map['tipo'],
      ano: map['ano'],
      estado: map['estado'],
    );
  }
}
