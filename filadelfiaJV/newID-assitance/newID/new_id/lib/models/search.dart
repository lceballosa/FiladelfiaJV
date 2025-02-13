class Search {
  final String? telefono;
  final String? nombre;

  Search({this.telefono, this.nombre});

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      telefono: json['telefono'] != null ? json['telefono'].toString() : null,
      nombre: json['nombre'] != null ? json['nombre'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'telefono': telefono,
      'nombre': nombre,
    };
  }
}
