class JovenData {

  final List<UserData> data;
  final bool exitoso;

  JovenData({required this.data, required this.exitoso});

  factory JovenData.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<UserData> data = dataList.map((i) => UserData.fromJson(i)).toList();

    return JovenData(
      data: data,
      exitoso: json['exitoso'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((v) => v.toJson()).toList(),
      'exitoso': exitoso,
    };
  }
}

class UserData {
  final String telefono;
  final String primerNombre;
  final String? segundoNombre;
  final String? primerApellido;
  final String? segundoApellido;
  final String? fechaNacimiento;
  final bool? parqueadero;
  final int asistencias;
  final String genero;
  final int? edad;
  final String? fechaNacimientoString;
  final String? tipoDocumento;
  final String? numeroDocumento;
  final String? nombreCompleto;
  final String? estadoCivil;
  //final String profilePictureUrl = "";

  UserData({
    required this.telefono,
    required this.primerNombre,
    this.segundoNombre,
    this.primerApellido,
    this.segundoApellido,
    this.tipoDocumento,
    this.numeroDocumento,
    this.nombreCompleto,
    this.estadoCivil,
    this.fechaNacimiento,
    this.parqueadero,
    required this.asistencias,
    required this.genero,
    this.edad,
    this.fechaNacimientoString
    //required this.profilePictureUrl
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      telefono: json['telefono'],
      primerNombre: json['primerNombre'],
      segundoNombre: json['segundoNombre'],
      primerApellido: json['primerApellido'],
      segundoApellido: json['segundoApellido'],
      fechaNacimiento: json['fechaNacimiento'],
      parqueadero: json['parqueadero'],
      tipoDocumento: json['tipoDocumento'],
      numeroDocumento: json['numeroDocumento'],
      estadoCivil: json['estadoCivil'],
      asistencias: json['asistencias'],
      genero: json['genero'],
      edad: json['edad'],
      nombreCompleto: json['nombreCompleto'],
      fechaNacimientoString: json['fechaNacimientoString']
      //profilePictureUrl: json['profilePictureUrl']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'telefono': telefono,
      'primerNombre': primerNombre,
      'segundoNombre': segundoNombre,
      'primerApellido':primerApellido,
      'segundoApellido': segundoApellido,
      'fechaNacimiento': fechaNacimiento,
      'parqueadero': parqueadero,
      'tipoDocumento': tipoDocumento,
      'numeroDocumento': numeroDocumento,
      'estadoCivil': estadoCivil,
      'asistencias': asistencias,
      'genero': genero,
      'nombreCompleto': nombreCompleto,
      'edad':edad,
      'fechaNacimientoString': fechaNacimientoString,
    };
  }
}