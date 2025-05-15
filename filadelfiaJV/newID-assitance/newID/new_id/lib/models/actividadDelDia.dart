import 'dart:convert';

class ActividadDelDia {
  int? id;
  int? idNewIdTipoActividades;
  String? actividadDia;
  DateTime? fecha;
  List<NewidPassesDia>? newidPassesDiaList;

  ActividadDelDia({
    this.id,
    this.idNewIdTipoActividades,
    this.actividadDia,
    this.fecha,
    this.newidPassesDiaList,
  });

  factory ActividadDelDia.fromJson(Map<String, dynamic> json) {
    return ActividadDelDia(
      id: json['id'],
      idNewIdTipoActividades: json['idNewIdTipoActividades'],
      actividadDia: json['actividadDia'],
      fecha: json['fecha'] != null ? DateTime.parse(json['fecha']) : null,
      newidPassesDiaList: json['newidPassesDiaList'] != null
          ? (json['newidPassesDiaList'] as List)
              .map((item) => NewidPassesDia.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idNewIdTipoActividades': idNewIdTipoActividades,
      'actividadDia': actividadDia,
      'fecha': fecha?.toIso8601String(),
      'newidPassesDiaList': newidPassesDiaList?.map((item) => item.toJson()).toList(),
    };
  }

  // Decode JSON with UTF-8
  static ActividadDelDia fromUtf8Json(String source) {
    final decoded = utf8.decode(source.codeUnits);
    return ActividadDelDia.fromJson(jsonDecode(decoded));
  }

  // Encode JSON with UTF-8
  String toUtf8Json() {
    final jsonString = jsonEncode(toJson());
    return utf8.encode(jsonString).toString();
  }
}

class NewidPassesDia {
  int? id;
  int? idPasse;
  String? passe;
  int? puntos;
  int? idActividadDelDia;

  NewidPassesDia({
    this.id,
    this.idPasse,
    this.passe,
    this.puntos,
    this.idActividadDelDia,
  });

  factory NewidPassesDia.fromJson(Map<String, dynamic> json) {
    return NewidPassesDia(
      id: json['id'],
      idPasse: json['idPasse'],
      passe: json['passe'],
      puntos: json['puntos'],
      idActividadDelDia: json['idActividadDelDia'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idPasse': idPasse,
      'passe': passe,
      'puntos': puntos,
      'idActividadDelDia': idActividadDelDia,
    };
  }
}

class ResponseActividadDia {
  ActividadDelDia? data;
  bool exitoso;

  ResponseActividadDia({
    this.data,
    required this.exitoso,
  });

  factory ResponseActividadDia.fromJson(Map<String, dynamic> json) {
    return ResponseActividadDia(
      data: json['data'] != null ? ActividadDelDia.fromJson(json['data']) : null,
      exitoso: json['exitoso'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
      'exitoso': exitoso,
    };
  }

  // Decode JSON with UTF-8
  static ResponseActividadDia fromUtf8Json(String source) {
    final decoded = utf8.decode(source.codeUnits);
    return ResponseActividadDia.fromJson(jsonDecode(decoded));
  }

  // Encode JSON with UTF-8
  String toUtf8Json() {
    final jsonString = jsonEncode(toJson());
    return utf8.encode(jsonString).toString();
  }
}