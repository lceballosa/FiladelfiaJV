import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_id/models/response.dart';
import 'package:new_id/screens/TextFormFieldWithClearIcon.dart';
import 'package:new_id/screens/teenagerData.dart';
import 'package:new_id/service/request.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  RegisterState createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  bool _quiereMentorBool = false;
  bool _necesitaParqueaderoBool = false;

  Map<String, Object> registroFrom = Map();
  Map<String, Object> contacto = Map();
  final HttpService httpService = HttpService();

  

  @override
  void initState() {
    super.initState();
  }

  String _selectedValueGender = 'Selecciona';
  String _selectedValueMentor = 'Selecciona';
  String _selectedValueParqueadero = 'Selecciona';
  String _selectedValueQuiereMentor = 'Selecciona';



  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _parkingController = TextEditingController();
  final TextEditingController _quiereMentorController = TextEditingController();
  final TextEditingController _mentorController = TextEditingController();
  final TextEditingController _primerNombreController = TextEditingController();
  final TextEditingController _segundoNombreController = TextEditingController();
  final TextEditingController _primerApellidoController = TextEditingController();
  final TextEditingController _segundoApellidoController = TextEditingController();  
  final TextEditingController _celularController = TextEditingController();
  final TextEditingController _fechaNacimientoController = TextEditingController();
  final TextEditingController _contactoNombreController = TextEditingController();
  final TextEditingController _contactoTelefonoController = TextEditingController();
  final TextEditingController _contactoCorreoController = TextEditingController();
  final TextEditingController _contactoParentescoController = TextEditingController();


  final List<String> _dropdownItemsGender = [
    'Selecciona',
    'Hombre',
    'Mujer',
  ];

  final List<String> _dropdownItemsMentor = [
    'Selecciona',
    'Abraham',
    'Ana',
    'Andrea C',
    'Andrea R',
    'Briggite',
    'Dani M',
    'Diana V',
    'Jose',
    'Juan S',
    'Juanes',
    'Kathryn',
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

  final List<String> _dropdownItemsParqueadero = [
    'Selecciona',
    'Sí',
    'No'
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

  void _register() async {
    if (_formKey.currentState!.validate()) {
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registrando..."))
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
       registroFrom.addEntries({'tieneMentor': _quiereMentorBool}.entries);
       registroFrom.addEntries({'genero': _genderController.text}.entries);
       registroFrom.addEntries({'abreviaturaMentor': _mentorController.text}.entries);
       registroFrom.addEntries({
        'contacto': {
          'nombreContacto': _contactoNombreController.text,
          'telefonoContacto': _contactoTelefonoController.text,
          'correoContacto': _contactoCorreoController.text,
          'parentesco': _contactoParentescoController.text,
        }
      }.entries);

      final Response response = await httpService.registroJoven(registroFrom);
      if(response.exitoso){

        setState(() {
          registroFrom.clear();
          contacto.clear();
           _celularController.clear();
          _primerNombreController.clear();
          _segundoNombreController.clear();
          _primerApellidoController.clear();
          _segundoApellidoController.clear();
          _fechaNacimientoController.clear();
          _parkingController.clear();
          _quiereMentorController.clear();
          _genderController.clear();
          _mentorController.clear();
          _contactoCorreoController.clear();
          _contactoNombreController.clear();
          _contactoParentescoController.clear();
          _contactoTelefonoController.clear();
          _selectedValueGender = 'Selecciona';
          _selectedValueMentor = 'Selecciona';
          _selectedValueParqueadero = 'Selecciona';
          _selectedValueQuiereMentor = 'Selecciona';
        });
       

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
      message = 'El joven cumple con los requisitos para ingresar al grupo \n\nEdad: $age años \n\n¿Desear registrar?';
      possible = true;
    }else{
      message = 'El joven NO cumple con los requisitos para ingresar al grupo \n\nEdad: $age años';
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
                    'El joven cumple con los requisitos para ingresar al grupo.',
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
                onPressed: () async {
                  Navigator.of(context).pop(); // Cierra el diálogo
                  await Future.delayed(const Duration(milliseconds: 300)); // Pequeña pausa para evitar bloqueos
                  _register(); // Llama a la función de registro
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
                    'El joven NO cumple con los requisitos para ingresar al grupo.',
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

  Widget _buildTextField(String hintText, TextEditingController controller, 
    {bool isNumeric = false, bool isRequired = true}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
    child: TextFormField(
      controller: controller,
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      validator: (value) {
        if (isRequired && (value == null || value.isEmpty)) {
          return 'Ingresa un valor';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => setState(() => controller.clear()),
              )
            : null,
      ),
    ),
  );
}


  Widget _buildDropdown(String label, String? selectedValue, 
    List<String> items, TextEditingController controller, Function(String?) onChanged) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
    child: DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: label),
      value: selectedValue,
      validator: (value) => value == null || value.isEmpty ? 'Selecciona un valor' : null,
      onChanged: (newValue) {
        if (newValue != null) {
          setState(() {
            controller.text = newValue; // Actualiza el controlador
            onChanged(newValue);
          });
        }
      },
      items: items.map((String value) => 
        DropdownMenuItem(value: value, child: Text(value))).toList(),
    ),
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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/edit.png', height: 200, width: 150),
                _buildTextField("Primer nombre*", _primerNombreController),
                _buildTextField("Segundo nombre", _segundoNombreController, isRequired: false),
                _buildTextField("Primer apellido*", _primerApellidoController),
                _buildTextField("Segundo apellido*", _segundoApellidoController),
                _buildTextField("Celular*", _celularController, isNumeric: true),
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
                          controller: _fechaNacimientoController,
                          decoration: InputDecoration(
                            hintText: "Fecha de nacimiento*",
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.calendar_today),
                              onPressed: () => _selectDate(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                _buildDropdown("¿Requiere parqueadero?*", _selectedValueParqueadero, _dropdownItemsParqueadero, _parkingController, (value) => setState(() => _selectedValueParqueadero = value!)),
                _buildDropdown("¿Desea mentor?*", _selectedValueQuiereMentor, _dropdownItemsQuiereMentor, _quiereMentorController, (value) => setState(() => _selectedValueQuiereMentor = value!)),
                _buildDropdown("Sexo*", _selectedValueGender, _dropdownItemsGender,_genderController, (value) => setState(() => _selectedValueGender = value!)),
                _buildDropdown("Mentor*", _selectedValueMentor, _dropdownItemsMentor, _mentorController, (value) => setState(() => _selectedValueMentor = value!)),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: Text("Datos de Contacto", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                _buildTextField("Nombre de contacto*", _contactoNombreController),
                _buildTextField("Teléfono de contacto*", _contactoTelefonoController, isNumeric: true),
                _buildTextField("Correo de contacto*", _contactoCorreoController),
                _buildTextField("Parentesco*", _contactoParentescoController),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      _showConfirmationDialog(context);
                    },
                    child: const Text('Registrar'),
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