import 'package:flutter/material.dart';
import 'package:new_id/models/actividadDelDia.dart';
import 'package:new_id/models/response.dart';
import 'package:new_id/service/request.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  AttendanceState createState() {
    return AttendanceState();
  }
}

class AttendanceState extends State<Attendance> {
  final _formKey = GlobalKey<FormState>();
  final HttpService httpService = HttpService();
  final TextEditingController _attendanceController = TextEditingController();
  Map<String, Object> passesRequest = {};
  bool _showClearIcon = false;

  List<Map<String, dynamic>> _checkboxOptions = []; // Lista para almacenar las opciones de los checkboxes
  List<int> _selectedOptions = []; // Lista para almacenar las opciones seleccionadas
  String actividadDiaTitulo = ''; // Título de la actividad del día

  void _clearText() {
    setState(() {
      _attendanceController.clear();
      _showClearIcon = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _cargarActividadDia();
    _attendanceController.addListener(() {
      setState(() {
        _showClearIcon = _attendanceController.text.isNotEmpty;
      });
    });
  }

  Future<void> _cargarActividadDia() async {
    try {
      final ResponseActividadDia response = await httpService.cargarActividadDia();
      if (response.exitoso) {
        final List<dynamic> passes = response.data?.newidPassesDiaList ?? [];
        setState(() {
          _checkboxOptions = passes.map<Map<String, dynamic>>((item) {
            return {
              'id': item.id,
              'passe': item.passe,
              'puntos': item.puntos,
            };
          }).toList();
          actividadDiaTitulo = response.data?.actividadDia ?? '';
        });
      } else {
        _showBottomSheet('Error al cargar actividad del día. Intenta nuevamente.');
      }
    } catch (e) {
      _showBottomSheet('Error en el servicio. Validar con administrador.');
    }
  }

  void _showBottomSheet(String message) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(message),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text('Cerrar'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff5433ff), Color(0xff20bdff), Color(0xffa5fecb)],
            stops: [0, 0.5, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView( // Hacer que la pantalla sea desplazable
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/immigration.png',
                  height: 200,
                  width: 150,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa un valor';
                          }
                          return null;
                        },
                        controller: _attendanceController,
                        decoration: InputDecoration(
                          hintText: "Telefono",
                          suffixIcon: _showClearIcon
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: _clearText,
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (_checkboxOptions.isNotEmpty)
                        Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    'Passes $actividadDiaTitulo',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  children: _checkboxOptions.map((option) {
                                    return CheckboxListTile(
                                      title: Text('${option['passe']} (${option['puntos']} puntos)'),
                                      value: _selectedOptions.contains(option['id']),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            _selectedOptions.add(option['id']);
                                          } else {
                                            _selectedOptions.remove(option['id']);
                                          }
                                        });
                                      },
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Registrando asistencia..."),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      passesRequest.addEntries({
                        'newidPassesDiaList': _selectedOptions.map((id) => {'id': id}).toList(),
                      }.entries);
                      passesRequest.addEntries({'idJoven': _attendanceController.text}.entries);
                      final Response response = await httpService.registroAsistencia(_attendanceController.text);
                      if (response.exitoso) {
                        _attendanceController.clear();
                        _selectedOptions.clear();
                        _showBottomSheet(response.data);
                      } else {
                        _showBottomSheet('El joven no se encuentra en la base de datos.');
                      }
                      final Response responsePasses = await httpService.registroPasse(passesRequest);
                      if (responsePasses.exitoso) {
                        _attendanceController.clear();
                        _showBottomSheet(responsePasses.data);
                      } else {
                        _showBottomSheet('Error al registrar pases. Validar con administrador.');
                      }
                    }
                  },
                  child: const Text('Ingresar asistencia'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}