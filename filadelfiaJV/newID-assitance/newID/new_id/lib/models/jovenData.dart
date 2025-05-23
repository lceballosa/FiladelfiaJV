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
  final bool? tieneMentor;
  final int? idMentor;
  final int? idGrupoEdad;
  final int asistencias;
  final String genero;
  final String? abreviaturaMentor;
  final String? grupoEdadNombre;
  final int? edad;
  final String? fechaNacimientoString;
  final String? nombreCompleto;
  final Contacto? contacto;

  UserData({
    required this.telefono,
    required this.primerNombre,
    this.segundoNombre,
    this.primerApellido,
    this.segundoApellido,
    this.fechaNacimiento,
    this.nombreCompleto,
    this.parqueadero,
    this.tieneMentor,
    this.idMentor,
    this.idGrupoEdad,
    required this.asistencias,
    required this.genero,
    this.abreviaturaMentor,
    this.edad,
    this.grupoEdadNombre,
    this.fechaNacimientoString,
    this.contacto,
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
      tieneMentor: json['tieneMentor'],
      idMentor: json['idMentor'],
      idGrupoEdad: json['idGrupoEdad'],
      asistencias: json['asistencias'],
      genero: json['genero'],
      abreviaturaMentor: json['abreviaturaMentor'],
      edad: json['edad'],
      grupoEdadNombre: json['grupoEdadNombre'],
      nombreCompleto: json['nombreCompleto'],
      fechaNacimientoString: json['fechaNacimientoString'],
      contacto: json['contacto'] != null ? Contacto.fromJson(json['contacto']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'telefono': telefono,
      'primerNombre': primerNombre,
      'segundoNombre': segundoNombre,
      'primerApellido': primerApellido,
      'segundoApellido': segundoApellido,
      'fechaNacimiento': fechaNacimiento,
      'parqueadero': parqueadero,
      'tieneMentor': tieneMentor,
      'idMentor': idMentor,
      'idGrupoEdad': idGrupoEdad,
      'asistencias': asistencias,
      'genero': genero,
      'abreviaturaMentor': abreviaturaMentor,
      'edad': edad,
      'grupoEdad': grupoEdadNombre,
      'fechaNacimientoString': fechaNacimientoString,
      'contacto': contacto?.toJson(),
    };
  }
}

class Contacto {
  final String? nombreContacto;
  final String? telefonoContacto;
  final String? correoContacto;
  final String? parentesco;

  Contacto({
    this.nombreContacto,
    this.telefonoContacto,
    this.correoContacto,
    this.parentesco,
  });

  factory Contacto.fromJson(Map<String, dynamic> json) {
    return Contacto(
      nombreContacto: json['nombreContacto'],
      telefonoContacto: json['telefonoContacto'],
      correoContacto: json['correoContacto'],
      parentesco: json['parentesco'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombreContacto': nombreContacto,
      'telefonoContacto': telefonoContacto,
      'correoContacto': correoContacto,
      'parentesco': parentesco,
    };
  }
}
