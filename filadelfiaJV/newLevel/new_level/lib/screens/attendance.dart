import 'package:flutter/material.dart';
import 'package:new_level/models/ingreso.dart';
import 'package:new_level/models/response.dart';
import 'package:new_level/screens/TextFormFieldWithClearIcon.dart';
import 'package:new_level/screens/teenagerData.dart';
import 'package:new_level/service/request.dart';


class Attendance extends StatefulWidget {

  const Attendance({super.key});

  
  
  @override
  AttendanceState  createState(){
    return AttendanceState();
  }
}

class AttendanceState extends State<Attendance> {

  final _formKey = GlobalKey<FormState>();
  final HttpService httpService = HttpService();
  final TextEditingController _attendanceController = TextEditingController();
  bool _showClearIcon = false;


  void _clearText() {
      setState(() {
        _attendanceController.clear();
        _showClearIcon = false;
      });
  }

  @override
  void initState() {
    super.initState();
    _attendanceController.addListener(() {
      setState(() {
        _showClearIcon = _attendanceController.text.isNotEmpty;
      });
    });
  }
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff757f9a), Color(0xffd7dde8)],
                    stops: [0, 1],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                ),
                child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/immigration.png', height: 200, width: 150,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(80,20,80,30),
                      child: TextFormField(
                                validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ingresa un valor';
                                        }
                                        return null;
                                },
                                controller: _attendanceController,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white), // White underline when not focused
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0), // White underline when focused
                                  ),
                                  hintStyle: const TextStyle(color:Colors.white),
                                  hintText: "Teléfono",
                                  
                                  suffixIcon: _showClearIcon
                                      ? IconButton(
                                          icon: const Icon(Icons.clear, color: Colors.white,),
                                          onPressed: _clearText,
                                        )
                                      : null,
                                ),
                              ),
                    ),
                    ElevatedButton(onPressed:() async {
                      if(_formKey.currentState!.validate()){

                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Registrando asistencia..."),
                                      duration: Duration(seconds: 2)),
                                  );

                                  final Response response = await httpService.registroAsistencia(_attendanceController.text);
                                  if(response.exitoso){
                                   
                                    _attendanceController.clear();
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
                                }else{

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
                                              const Text('El joven no se encuentra en la base de datos'),
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
                    }, child: const Text('Ingresar asistencia')),
                  ]   
                ),
              ),
              ),
    );
  }
}