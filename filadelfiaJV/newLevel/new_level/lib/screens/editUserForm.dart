import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_level/models/response.dart';
import 'package:new_level/models/search.dart';
import 'package:new_level/screens/teenagerData.dart';

import '../models/jovenData.dart';
import '../service/request.dart'; // Para formateo de fechas


class EditUserForm extends StatefulWidget {
  final UserData userData;

  const EditUserForm({required this.userData});

  @override
  _EditUserFormState createState() => _EditUserFormState();
}

class _EditUserFormState extends State<EditUserForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _primerNombreController;
  late TextEditingController _segundoNombreController;
  late TextEditingController _primerApellidoController;
  late TextEditingController _segundoApellidoController;
  late TextEditingController _celularController;
  late TextEditingController _oldCelularController;
  late TextEditingController _fechaNacimientoController;
  late TextEditingController _tipoDocumentoController;
  late TextEditingController _numeroDocumentoController;
  late TextEditingController _genderController;
  late TextEditingController _estadoCivilController;
  late TextEditingController _parkingController;

  bool _showClearIconFristName = false;
  bool _showClearIconNumDoc = false;
  bool _showClearIconSecondName = false;
  bool _showClearIconFristLastname = false;
  bool _showClearIconSecondLastname = false;
  bool _showClearIconCel = false;
  bool _showClearIconDate = false;
  bool _necesitaParqueaderoBool = false;

  Map<String, Object> registroFrom = Map();
  final HttpService httpService = HttpService();

  void _clearTextFristName() {
      setState(() {
        _primerNombreController.clear();
        _showClearIconFristName = false;
      });
  }
  void _clearTextSecondName() {
      setState(() {
        _segundoNombreController.clear();
        _showClearIconSecondName = false;
      });
  }
  void _clearTextFristLastName() {
      setState(() {
        _primerApellidoController.clear();
        _showClearIconFristLastname = false;
      });
  }
  void _clearTextSecondLastName() {
      setState(() {
        _segundoApellidoController.clear();
        _showClearIconSecondLastname = false;
      });
  }

  void _clearTextCel() {
      setState(() {
        _celularController.clear();
        _showClearIconCel = false;
      });
  }

  void _clearTextDate() {
      setState(() {
        _fechaNacimientoController.clear();
        _showClearIconDate = false;
      });
  }

  void _clearTextNumDoc() {
      setState(() {
        _numeroDocumentoController.clear();
        _showClearIconNumDoc = false;
      });
  }

  String _selectedValueGender = 'Selecciona';
  String _selectedValueCivilState = 'Selecciona';
  String _selectedValueParqueadero = 'Selecciona';
  String _selectedValueTipoDoc= 'Selecciona';

  final List<String> _dropdownItemsGender = [
    'Selecciona',
    'Hombre',
    'Mujer',
  ];

  final List<String> _dropdownItemsCivilState = [
    'Selecciona',
    'Casado/Casada',
    'Soltero/Soltera',
    'Madre soltera',
    'Padre soltero',
    'Separado/Separada',
    'Viudo/Viuda'
  ];

  final List<String> _dropdownItemsTipoDoc = [
    'Selecciona',
    'Tarjeta de identidad',
    'Cédula de extranjería',
    'Cédula de ciudadanía',
    'Pasaporte'
  ];

  final List<String> _dropdownItemsParqueadero = [
    'Selecciona',
    'Sí',
    'No'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _fechaNacimientoController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }


  @override
  void initState() {

    
    super.initState();

    _primerNombreController = TextEditingController(text: widget.userData.primerNombre);
    _segundoNombreController = TextEditingController(text: widget.userData.segundoNombre);
    _primerApellidoController = TextEditingController(text: widget.userData.primerApellido);
    _segundoApellidoController = TextEditingController(text: widget.userData.segundoApellido);
    _celularController = TextEditingController(text: widget.userData.telefono);
    _oldCelularController = TextEditingController(text: widget.userData.telefono);
    _parkingController = TextEditingController(text: widget.userData.parqueadero == true ? 'Sí': 'No');
    _tipoDocumentoController = TextEditingController(text: widget.userData.tipoDocumento);
    _numeroDocumentoController = TextEditingController(text: widget.userData.numeroDocumento);
    _genderController = TextEditingController(text: widget.userData.genero);
    _estadoCivilController = TextEditingController(text: widget.userData.estadoCivil);
    _fechaNacimientoController = TextEditingController(text: widget.userData.fechaNacimientoString);

    _selectedValueGender = widget.userData.genero;
    _selectedValueCivilState = widget.userData.estadoCivil == null || widget.userData.estadoCivil  == '' ? 'Selecciona': widget.userData.estadoCivil!;
    _selectedValueParqueadero = widget.userData.parqueadero == true ? 'Sí' : 'No';
    _selectedValueTipoDoc = (widget.userData.tipoDocumento ?? 'Selecciona');

    _primerNombreController.addListener(() {
      setState(() {
        _showClearIconFristName = _primerNombreController.text.isNotEmpty;
      });
    });

    _segundoNombreController.addListener(() {
      setState(() {
        _showClearIconSecondName = _segundoNombreController.text.isNotEmpty;
      });
    });
    _primerApellidoController.addListener(() {
      setState(() {
        _showClearIconFristLastname = _primerApellidoController.text.isNotEmpty;
      });
    });
    _segundoApellidoController.addListener(() {
      setState(() {
        _showClearIconSecondLastname = _segundoApellidoController.text.isNotEmpty;
      });
    });
    _celularController.addListener(() {
      setState(() {
        _showClearIconCel = _celularController.text.isNotEmpty;
      });
    });
    _fechaNacimientoController.addListener(() {
      setState(() {
        _showClearIconDate = _fechaNacimientoController.text.isNotEmpty;
      });
    });
    _numeroDocumentoController.addListener(() {
      setState(() {
        _showClearIconNumDoc = _numeroDocumentoController.text.isNotEmpty;
      });
    });

  }

  @override
  void dispose() {
    _primerNombreController.dispose();
    _segundoNombreController.dispose();
    _primerApellidoController.dispose();
    _segundoApellidoController.dispose();
    _celularController.dispose();
    _tipoDocumentoController.dispose();
    _numeroDocumentoController.dispose();
    _tipoDocumentoController.dispose();
    _genderController.dispose();
    _estadoCivilController.dispose();
    _fechaNacimientoController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Actualizando..."))
      );

      if(_parkingController.text == "Sí"){
        _necesitaParqueaderoBool = true;
      } else {
        _necesitaParqueaderoBool = false;
      }

      registroFrom.addEntries({'telefono': _celularController.text}.entries);
      registroFrom.addEntries({'primerNombre': _primerNombreController.text}.entries);
      registroFrom.addEntries({'segundoNombre': _segundoNombreController.text}.entries);
      registroFrom.addEntries({'primerApellido': _primerApellidoController.text}.entries);
      registroFrom.addEntries({'segundoApellido': _segundoApellidoController.text}.entries);
      registroFrom.addEntries({'fechaNacimiento': _fechaNacimientoController.text}.entries);
      registroFrom.addEntries({'parqueadero': _necesitaParqueaderoBool}.entries);
      registroFrom.addEntries({'genero': _genderController.text}.entries);
      registroFrom.addEntries({'estadoCivil': _estadoCivilController.text}.entries);
      registroFrom.addEntries({'tipoDocumento': _tipoDocumentoController.text}.entries);
      registroFrom.addEntries({'numeroDocumento': _numeroDocumentoController.text}.entries);
      registroFrom.addEntries({'oldCelular': _oldCelularController.text}.entries);
      
      final Response response = await httpService.editarJoven(registroFrom);
      if(response.exitoso){

        Search search = new Search(telefono: _celularController.text, nombre: null);
        final JovenData? jovenData = await httpService.buscarJoven(search);

        if (jovenData != null) {
        // Navigate to the desired screen after successful response
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Teenagerdata(persons: jovenData.data)),
        );
        }
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 250,
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('El registro ha sido exitoso'),
                    const Text(' '),
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
      } else {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 250,
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(response.data),
                    const Text(' '),
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
    }else{
      showDialog(
        context: context, 
        builder: (BuildContext context) {
          return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.error , color: Colors.blue),
              SizedBox(width: 8),
              Text(
                'Error',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                  Text(
                    'Faltan datos por registrar',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: const Text(
                  'Entiendo',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          );

        }
      );
    }
      
  }

  int _calculateAge(String birthDateString) {
    DateTime birthDate = DateFormat("yyyy-MM-dd").parse(birthDateString);
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  void _showConfirmationDialog(BuildContext context) {
    String birthDateString = _fechaNacimientoController.text;
    int age = _calculateAge(birthDateString);
    String message = '';
    bool possible = false;
    if(age <= 40 && age >=30 || (age > 40 && _estadoCivilController.text == 'Soltero/Soltera')){
      message = 'La persona cumple con los requisitos para ingresar al grupo \n\nEdad: $age años \n\n¿Desear registrar?';
      possible = true;
    }else{
      message = 'La persona NO cumple con los requisitos para ingresar al grupo \n\nEdad: $age años';
      possible = false;
    }
    if(possible){
        showDialog(
        context: context,
        builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.info, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                'Información',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                  const Text(
                    'La persona cumple con los requisitos para ingresar al grupo.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Edad: $age años',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '¿Deseas registrar?',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  _submit(); // Call the register function if confirmed
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.green,
                ),
                child:const Text(
                  'Confirmar',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          );
        },
      );
    }else{
       showDialog(
        context: context,
        builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.info, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                'Información',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                  const Text(
                    'La persona NO cumple con los requisitos para ingresar al grupo.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Edad: $age años',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 225, 144, 23),
                ),
                child: const Text(
                  'Entiendo',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          );
        },
      );

    }

    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
     appBar: AppBar(
      title: const Text(
        'Editar Usuario',
      ),
  ),
      body: Container(
        decoration: const BoxDecoration(
          gradient:LinearGradient(
          colors: [Color(0xff757f9a), Color(0xffd7dde8)],
          stops: [0, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/editIcon.png', height: 200, width: 150),
                Padding(
                  padding: EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: TextFormField(
                                validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ingresa un valor';
                                        }
                                        return null;
                                },
                                style: const TextStyle(color: Colors.white),
                                controller: _primerNombreController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white), // White underline when not focused
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0), // White underline when focused
                                  ),
                                  hintStyle: const TextStyle(color:Colors.white),
                                  labelText: 'Primer nombre',
                                  labelStyle:const TextStyle(color:Colors.white),
                                  hintText: "Primer nombre*",
                                  suffixIcon: _showClearIconFristName
                                      ? IconButton(
                                          icon: const Icon(Icons.clear, color: Colors.white),
                                          onPressed: _clearTextFristName,
                                        )
                                      : null,
                                ),
                              ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                                controller: _segundoNombreController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white), // White underline when not focused
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0), // White underline when focused
                                  ),
                                  hintStyle: const TextStyle(color:Colors.white),
                                  labelText: 'Segundo Nombre',
                                  labelStyle:const TextStyle(color:Colors.white),
                                  hintText: "Segundo nombre",
                                  suffixIcon: _showClearIconSecondName
                                      ? IconButton(
                                          icon: const Icon(Icons.clear, color: Colors.white),
                                          onPressed: _clearTextSecondName,
                                        )
                                      : null,
                                ),
                              ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: TextFormField(
                                validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ingresa un valor';
                                        }
                                        return null;
                                },
                                style: const TextStyle(color: Colors.white),
                                controller: _primerApellidoController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white), // White underline when not focused
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0), // White underline when focused
                                  ),
                                  hintStyle: const TextStyle(color:Colors.white),
                                  labelText: 'Primer apellido',
                                  labelStyle:const TextStyle(color:Colors.white),
                                  hintText: "Primer apellido*",
                                  suffixIcon: _showClearIconFristLastname
                                      ? IconButton(
                                          icon: const Icon(Icons.clear, color: Colors.white),
                                          onPressed: _clearTextFristLastName,
                                        )
                                      : null,
                                ),
                              ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: TextFormField(
                                validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ingresa un valor';
                                        }
                                        return null;
                                },
                                style: const TextStyle(color: Colors.white),
                                controller: _segundoApellidoController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white), // White underline when not focused
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0), // White underline when focused
                                  ),
                                  hintStyle: const TextStyle(color:Colors.white),
                                  labelText: 'Segundo apellido',
                                  labelStyle:const TextStyle(color:Colors.white),
                                  hintText: "Segundo apellido*",
                                  suffixIcon: _showClearIconSecondLastname
                                      ? IconButton(
                                          icon: const Icon(Icons.clear, color: Colors.white),
                                          onPressed: _clearTextSecondLastName,
                                        )
                                      : null,
                                ),
                              ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: TextFormField(
                                validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ingresa un valor';
                                        }
                                        return null;
                                },
                                style: const TextStyle(color: Colors.white),
                                keyboardType: TextInputType.number,
                                controller: _celularController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white), // White underline when not focused
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0), // White underline when focused
                                  ),
                                  hintStyle: const TextStyle(color:Colors.white),
                                  labelText: 'Celular',
                                  labelStyle:const TextStyle(color:Colors.white),
                                  hintText: "Celular*",
                                  suffixIcon: _showClearIconCel
                                      ? IconButton(
                                          icon: const Icon(Icons.clear, color: Colors.white),
                                          onPressed: _clearTextCel,
                                        )
                                      : null,
                                ),
                              ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: InkWell(
                    onTap: () => _selectDate(context),
                    child: IgnorePointer(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa un valor';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        controller: _fechaNacimientoController,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white), // White underline when not focused
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0), // White underline when focused
                                  ),
                                  hintStyle: const TextStyle(color:Colors.white),
                          labelText: 'Fecha de nacimiento',
                          labelStyle:const TextStyle(color:Colors.white),
                          hintText: "Fecha de nacimiento*",
                          suffixIcon: _showClearIconDate
                              ? IconButton(
                                  icon: const Icon(Icons.clear, color: Colors.white),
                                  onPressed: _clearTextDate,
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Estado civil*',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty || value.toString() == 'Selecciona'){
                              return 'Selecciona el estado civil';
                            }else{
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          value: _selectedValueCivilState,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValueCivilState = newValue!;
                              _estadoCivilController.text = _selectedValueCivilState; // Update the TextFormField
                            });
                          },
                          dropdownColor: Color.fromARGB(255, 124, 129, 132),
                          items: _dropdownItemsCivilState.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Tipo de documento*',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty || value.toString() == 'Selecciona'){
                              return 'Selecciona un tipo de documento';
                            }else{
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          value: _selectedValueTipoDoc,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValueTipoDoc = newValue!;
                              _tipoDocumentoController.text = _selectedValueTipoDoc; // Update the TextFormField
                            });
                          },
                          dropdownColor: Color.fromARGB(255, 124, 129, 132),
                          items: _dropdownItemsTipoDoc.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: TextFormField(
                                validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ingresa un valor';
                                        }
                                        return null;
                                },
                                style: const TextStyle(color: Colors.white),
                                keyboardType: TextInputType.number,
                                controller: _numeroDocumentoController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white), // White underline when not focused
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0), // White underline when focused
                                  ),
                                  
                                  labelText: 'Número de documento',
                                  labelStyle:const TextStyle(color:Colors.white),
                                  hintText: "Número de documento*",
                                  hintStyle: const TextStyle(color:Colors.white),
                                  suffixIcon: _showClearIconNumDoc
                                      ? IconButton(
                                          icon: const Icon(Icons.clear, color: Colors.white,),
                                          onPressed: _clearTextNumDoc,
                                        )
                                      : null,
                                ),
                              ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: '¿Requiere parqueadero?',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                           validator: (value){
                            if(value == null || value.isEmpty || value.toString() == 'Selecciona'){
                              return 'Selecciona un valor';
                            }else{
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          value: _selectedValueParqueadero,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValueParqueadero = newValue!;
                              _parkingController.text = _selectedValueParqueadero; // Update the TextFormField
                            });
                          },
                          dropdownColor: Color.fromARGB(255, 124, 129, 132),
                          items: _dropdownItemsParqueadero.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Sexo*',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty || value.toString() == 'Selecciona'){
                              return 'Selecciona un género';
                            }else{
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          value: _selectedValueGender,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValueGender = newValue!;
                              _genderController.text = _selectedValueGender; // Update the TextFormField
                            });
                          },
                          dropdownColor: Color.fromARGB(255, 124, 129, 132),
                          items: _dropdownItemsGender.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: ElevatedButton(
                    onPressed: () async {
                       _showConfirmationDialog(context);
                    },
                    child: const Text('Actualizar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}