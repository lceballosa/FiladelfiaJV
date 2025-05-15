import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:new_id/models/actividadDelDia.dart';
import 'package:new_id/models/ingreso.dart';
import 'package:new_id/models/jovenData.dart';
import 'package:new_id/models/response.dart';
import 'package:new_id/models/search.dart';
import 'package:new_id/service/globals.dart';

class HttpService {

  Future<Ingreso> ingreso(Map<String, String> ingreso) async {
    
    var url = Uri.parse(baseURL+'/ingresar');
    var body  = json.encode(ingreso);
    http.Response response = await http.post(url, headers: httpHeaders, body: body);
    if (response.statusCode == 200) {
      Ingreso ans = Ingreso.fromJson(json.decode(response.body));
      return ans;
    }
    return Ingreso(exitoso: false);
  }

  Future<ResponseActividadDia> cargarActividadDia() async {
    
    var url = Uri.parse(baseURL+'/admin/verActividad');
    http.Response response = await http.get(url, headers: httpHeaders);
    if (response.statusCode == 200) {
      ResponseActividadDia ans = ResponseActividadDia.fromJson(json.decode(response.body));
      return ans;
    }
    return ResponseActividadDia(exitoso: false);
  }

  Future<Response> registroAsistencia(String telefono) async {
    Uri url = Uri.parse(baseURL+'/registrarAsistencia/'+telefono);

    http.Response response = await http.get(url, headers: httpHeaders);
    if (response.statusCode == 200) {
      Response ans = Response.fromJson(json.decode(response.body));
      return ans;
    }
    return Response(exitoso: false, data:"Error en el servicio");
  }

  Future<Response> registroAsistenciaPray(String telefono) async {
    Uri url = Uri.parse(baseURL+'/registrarAsistenciaPray/'+telefono);

    http.Response response = await http.get(url, headers: httpHeaders);
    if (response.statusCode == 200) {
      Response ans = Response.fromJson(json.decode(response.body));
      return ans;
    }
    return Response(exitoso: false, data:"Error en el servicio");
  }

  Future<Response> buscarPadre(String telefono) async {
    Uri url = Uri.parse(baseURL+'/buscarPadre/'+telefono);

    http.Response response = await http.get(url, headers: httpHeaders);
    if (response.statusCode == 200) {
      Response ans = Response.fromJson(json.decode(response.body));
      return ans;
    }
    return Response(exitoso: false, data:"Error en el servicio");
  }


  Future<Response> registroJoven(Map<String, Object> registro) async {
    
    var url = Uri.parse(baseURL+'/registrarJoven');
    var body  = json.encode(registro);
    http.Response response = await http.post(url, headers: httpHeaders, body: body);
    if (response.statusCode == 200) {
      Response ans = Response.fromJson(json.decode(response.body));
      return ans;
    }
    return Response(exitoso: false, data:"Error en el servicio");
  }

  Future<Response> registroPadre(Map<String, Object> registro) async {
    
    var url = Uri.parse(baseURL+'/registrarPadre');
    var body  = json.encode(registro);
    http.Response response = await http.post(url, headers: httpHeaders, body: body);
    if (response.statusCode == 200) {
      Response ans = Response.fromJson(json.decode(response.body));
      return ans;
    }
    return Response(exitoso: false, data:"Error en el servicio");
  }

  Future<Response> editarJoven(Map<String, Object> registro) async {
    
    var url = Uri.parse(baseURL+'/editarJoven');
    var body  = json.encode(registro);
    http.Response response = await http.post(url, headers: httpHeaders, body: body);
    if (response.statusCode == 200) {
      Response ans = Response.fromJson(json.decode(response.body));
      return ans;
    }
    return Response(exitoso: false, data:"Error en el servicio");
  }

  Future<JovenData?> buscarJoven(Search search) async {
  final url = Uri.parse('$baseURL/buscar');
  final body = json.encode(search.toJson()); // Ensure search is properly encoded

    try {
      final response = await http.post(url, headers: httpHeaders, body: body);

      if (response.statusCode == 200) {
        // Decode response body as UTF-8 to handle special characters
        final decodedResponse = utf8.decode(response.bodyBytes);
        final jsonResponse = json.decode(decodedResponse);
        
        // Check if the response contains valid JSON data and convert it
        if (jsonResponse != null) {
          return JovenData.fromJson(jsonResponse);
        }
      } else {
        // Handle non-200 responses here (e.g., logging or throwing an exception)
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions (e.g., network issues, JSON parsing errors)
      print('An error occurred: $e');
    }

  return null;
  }

  Future<Response> registroPasse(Map<String, Object> registro) async {
    
    var url = Uri.parse(baseURL+'/admin/registrarPasse');
    var body  = json.encode(registro);
    http.Response response = await http.post(url, headers: httpHeaders, body: body);
    if (response.statusCode == 200) {
      Response ans = Response.fromJson(json.decode(response.body));
      return ans;
    }
    return Response(exitoso: false, data:"Error en el servicio");
  }
}