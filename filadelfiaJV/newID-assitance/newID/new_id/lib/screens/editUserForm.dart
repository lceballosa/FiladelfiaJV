import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_id/models/response.dart';
import 'package:new_id/models/search.dart';
import 'package:new_id/screens/searchForm.dart';
import 'package:new_id/screens/teenagerData.dart';

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
  late TextEditingController _genderController;
  late TextEditingController _parkingController;
  late TextEditingController _quiereMentorController = TextEditingController();
  late TextEditingController _mentorController = TextEditingController();
  late TextEditingController _contactoNombreController = TextEditingController();
  late TextEditingController _contactoTelefonoController = TextEditingController();
  late TextEditingController _contactoCorreoController = TextEditingController();
  late TextEditingController _contactoParentescoController = TextEditingController();

  bool _showClearIconFristName = false;
  bool _showClearIconSecondName = false;
  bool _showClearIconFristLastname = false;
  bool _showClearIconSecondLastname = false;
  bool _showClearIconCel = false;
  bool _showClearIconDate = false;
  bool _necesitaParqueaderoBool = false;
  bool _quiereMentorBool = false;
  bool _showClearIconNombreContacto = false;
  bool _showClearIconTelefonoContacto = false;
  bool _showClearIconCorreoContacto = false;
  bool _showClearIconParentescoo = false;

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

  void _clearTextNombreContacto() {
      setState(() {
        _contactoNombreController.clear();
        _showClearIconNombreContacto = false;
      });
  }

  void _clearTextTelefonoContacto() {
      setState(() {
        _contactoTelefonoController.clear();
        _showClearIconTelefonoContacto = false;
      });
  }

  void _clearTextCorreoContacto() {
      setState(() {
        _contactoCorreoController.clear();
        _showClearIconCorreoContacto = false;
      });
  }

  void _clearTextParentesco() {
      setState(() {
        _contactoParentescoController.clear();
        _showClearIconParentescoo = false;
      });
  }


  String _selectedValueGender = 'Selecciona';
  String _selectedValueParqueadero = 'Selecciona';
  String _selectedValueMentor = 'Selecciona';
  String _selectedValueQuiereMentor = 'Selecciona';

  final List<String> _dropdownItemsGender = [
    'Selecciona',
    'Hombre',
    'Mujer',
  ];


  final List<String> _dropdownItemsParqueadero = [
    'Selecciona',
    'Sí',
    'No'
  ];

  final List<String> _dropdownItemsMentor = [
    'Selecciona',
    'Abraham',
    'Ana',
    'Andrea C',
    'Andrea R',
    'Briggite',
    'Dani M',
    'Dani O',
    'Diana M',
    'Diana V',
    'Jose',
    'Juan S',
    'Juanes',
    'Kathryn',
    'Laura',
    'Lorena',
    'Mercy',
    'Nelson',
    'Nohemi',
    'Valentina',
    'Y Andrea',
    'Yaung',
    'No tiene',
    'No desea'

    //TODO: completar
  ];

  final List<String> _dropdownItemsQuiereMentor = [
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
    _genderController = TextEditingController(text: widget.userData.genero);
    _fechaNacimientoController = TextEditingController(text: widget.userData.fechaNacimientoString);
    _mentorController = TextEditingController(text: widget.userData.abreviaturaMentor ?? 'No desea');
    _quiereMentorController = TextEditingController(text: widget.userData.tieneMentor == true ? 'Sí': 'No');
    _contactoNombreController = TextEditingController(text: widget.userData.contacto?.nombreContacto ?? '');
    _contactoTelefonoController = TextEditingController(text: widget.userData.contacto?.telefonoContacto ?? '');
    _contactoCorreoController = TextEditingController(text: widget.userData.contacto?.correoContacto ?? '');
    _contactoParentescoController = TextEditingController(text: widget.userData.contacto?.parentesco ?? '');


    _selectedValueGender = widget.userData.genero;
    _selectedValueMentor = widget.userData.abreviaturaMentor ?? 'No desea' ;
    _selectedValueParqueadero = widget.userData.parqueadero == true ? 'Sí' : 'No';
    _selectedValueQuiereMentor = widget.userData.tieneMentor == true ? 'Sí': 'No';

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
    _contactoNombreController.addListener(() {
      setState(() {
        _showClearIconNombreContacto = _contactoNombreController.text.isNotEmpty;
      });
    });
    _contactoTelefonoController.addListener(() {
      setState(() {
        _showClearIconTelefonoContacto = _contactoTelefonoController.text.isNotEmpty;
      });
    });
    _contactoCorreoController.addListener(() {
      setState(() {
        _showClearIconCorreoContacto = _contactoCorreoController.text.isNotEmpty;
      });
    });
    _contactoParentescoController.addListener(() {
      setState(() {
        _showClearIconParentescoo = _contactoParentescoController.text.isNotEmpty;
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
    _genderController.dispose();
    _fechaNacimientoController.dispose();
    _mentorController.dispose();
    _quiereMentorController.dispose();
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
      if(_quiereMentorController.text == "Sí"){
        _quiereMentorBool = true;
      } else {
        _quiereMentorBool = false;
      }

      registroFrom.addEntries({'telefono': _celularController.text}.entries);
      registroFrom.addEntries({'primerNombre': _primerNombreController.text}.entries);
      registroFrom.addEntries({'segundoNombre': _segundoNombreController.text}.entries);
      registroFrom.addEntries({'primerApellido': _primerApellidoController.text}.entries);
      registroFrom.addEntries({'segundoApellido': _segundoApellidoController.text}.entries);
      registroFrom.addEntries({'fechaNacimiento': _fechaNacimientoController.text}.entries);
      registroFrom.addEntries({'parqueadero': _necesitaParqueaderoBool}.entries);
      registroFrom.addEntries({'genero': _genderController.text}.entries);
      registroFrom.addEntries({'tieneMentor': _quiereMentorBool}.entries);
      registroFrom.addEntries({'abreviaturaMentor': _mentorController.text}.entries);
      registroFrom.addEntries({'oldCelular': _oldCelularController.text}.entries);
       registroFrom.addEntries({
        'contacto': {
          'nombreContacto': _contactoNombreController.text,
          'telefonoContacto': _contactoTelefonoController.text,
          'correoContacto': _contactoCorreoController.text,
          'parentesco': _contactoParentescoController.text,
        }
      }.entries);
      
      final Response response = await httpService.editarJoven(registroFrom);
      if(response.exitoso){

        Search search = new Search(telefono: _celularController.text, nombre: null);
        final JovenData? jovenData = await httpService.buscarJoven(search);

        if (jovenData != null) {
        // Navigate to the desired screen after successful response
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchForm()),
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
    if(age <= 30 && age >=12){
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
          gradient: LinearGradient(
          colors: [Color(0xff5433ff), Color(0xff20bdff), Color(0xffa5fecb)],
          stops: [0, 0.5, 1],
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
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: TextFormField(
                                validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ingresa un valor';
                                        }
                                        return null;
                                },
                                controller: _primerNombreController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  ),
                                  labelText: 'Primer nombre',
                                  hintText: "Primer nombre*",
                                  suffixIcon: _showClearIconFristName
                                      ? IconButton(
                                         icon: const Icon(Icons.clear),
                                          onPressed: _clearTextFristName,
                                        )
                                      : null,
                                ),
                              ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: TextFormField(
                                controller: _segundoNombreController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  ),
                                  labelText: 'Segundo Nombre',
                                  hintText: "Segundo nombre",
                                  suffixIcon: _showClearIconSecondName
                                      ? IconButton(
                                         icon: const Icon(Icons.clear),
                                          onPressed: _clearTextSecondName,
                                        )
                                      : null,
                                ),
                              ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: TextFormField(
                                validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ingresa un valor';
                                        }
                                        return null;
                                },
                                controller: _primerApellidoController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  ),
                                  labelText: 'Primer apellido',
                                  hintText: "Primer apellido*",
                                  suffixIcon: _showClearIconFristLastname
                                      ? IconButton(
                                          icon: const Icon(Icons.clear),
                                          onPressed: _clearTextFristLastName,
                                        )
                                      : null,
                                ),
                              ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: TextFormField(
                                validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ingresa un valor';
                                        }
                                        return null;
                                },

                                controller: _segundoApellidoController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  ),
                                  labelText: 'Segundo apellido',
                                  hintText: "Segundo apellido*",
                                  suffixIcon: _showClearIconSecondLastname
                                      ? IconButton(
                                          icon: const Icon(Icons.clear),
                                          onPressed: _clearTextSecondLastName,
                                        )
                                      : null,
                                ),
                              ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: TextFormField(
                                validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ingresa un valor';
                                        }
                                        return null;
                                },
                                keyboardType: TextInputType.number,
                                controller: _celularController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  ),
                                  labelText: 'Celular',
                                  hintText: "Celular*",
                                  suffixIcon: _showClearIconCel
                                      ? IconButton(
                                          icon: const Icon(Icons.clear),
                                          onPressed: _clearTextCel,
                                        )
                                      : null,
                                ),
                              ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 30),
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
                        controller: _fechaNacimientoController,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  ),
                          labelText: 'Fecha de nacimiento',
                          hintText: "Fecha de nacimiento*",
                          suffixIcon: _showClearIconDate
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: _clearTextDate,
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: '¿Requiere parqueadero?',
                          ),
                           validator: (value){
                            if(value == null || value.isEmpty || value.toString() == 'Selecciona'){
                              return 'Selecciona un valor';
                            }else{
                              return null;
                            }
                          },
                          value: _selectedValueParqueadero,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValueParqueadero = newValue!;
                              _parkingController.text = _selectedValueParqueadero; // Update the TextFormField
                            });
                          },
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
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Sexo*',
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty || value.toString() == 'Selecciona'){
                              return 'Selecciona un valor';
                            }else{
                              return null;
                            }
                          },
                          value: _selectedValueGender,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValueGender = newValue!;
                              _genderController.text = _selectedValueGender; // Update the TextFormField
                            });
                          },
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: '¿Desea mentor?',
                          ),
                           validator: (value){
                            if(value == null || value.isEmpty || value.toString() == 'Selecciona'){
                              return 'Selecciona un valor';
                            }else{
                              return null;
                            }
                          },
                          value: _selectedValueQuiereMentor,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValueQuiereMentor = newValue!;
                              _quiereMentorController.text = _selectedValueQuiereMentor; 
                            });
                          },
                          items: _dropdownItemsQuiereMentor.map<DropdownMenuItem<String>>((String value) {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Mentor*',
                          ),
                           validator: (value){
                            if(value == null || value.isEmpty || value.toString() == 'Selecciona'){
                              return 'Selecciona un valor';
                            }else{
                              return null;
                            }
                          },
                          value: _selectedValueMentor,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValueMentor = newValue!;
                              _mentorController.text = _selectedValueMentor; // Update the TextFormField
                            });
                          },
                          items: _dropdownItemsMentor.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: Text("Datos de Contacto", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: TextFormField(
                                validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ingresa un valor';
                                        }
                                        return null;
                                },

                                controller: _contactoNombreController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  ),
                                  labelText: 'Nombre contacto',
                                  hintText: "SNombre contacto*",
                                  suffixIcon: _showClearIconNombreContacto
                                      ? IconButton(
                                          icon: const Icon(Icons.clear),
                                          onPressed: _clearTextNombreContacto,
                                        )
                                      : null,
                                ),
                              ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: TextFormField(
                                validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ingresa un valor';
                                        }
                                        return null;
                                },

                                controller: _contactoTelefonoController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  ),
                                  labelText: 'Teléfono contacto',
                                  hintText: "Teléfono contacto*",
                                  suffixIcon: _showClearIconTelefonoContacto
                                      ? IconButton(
                                          icon: const Icon(Icons.clear),
                                          onPressed: _clearTextTelefonoContacto,
                                        )
                                      : null,
                                ),
                              ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: TextFormField(
                                validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ingresa un valor';
                                        }
                                        return null;
                                },

                                controller: _contactoCorreoController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  ),
                                  labelText: 'Correo contacto',
                                  hintText: "Correo contacto*",
                                  suffixIcon: _showClearIconCorreoContacto
                                      ? IconButton(
                                          icon: const Icon(Icons.clear),
                                          onPressed: _clearTextCorreoContacto,
                                        )
                                      : null,
                                ),
                              ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 30),
                  child: TextFormField(
                                validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ingresa un valor';
                                        }
                                        return null;
                                },

                                controller: _contactoParentescoController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  ),
                                  labelText: 'Parentesco',
                                  hintText: "Parentesco*",
                                  suffixIcon: _showClearIconParentescoo
                                      ? IconButton(
                                          icon: const Icon(Icons.clear),
                                          onPressed: _clearTextParentesco,
                                        )
                                      : null,
                                ),
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