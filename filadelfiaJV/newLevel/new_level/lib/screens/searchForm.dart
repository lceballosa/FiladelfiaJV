import 'package:flutter/material.dart';
import 'package:new_level/models/jovenData.dart';
import 'package:new_level/models/search.dart';
import 'package:new_level/screens/TextFormFieldWithClearIcon.dart';
import 'package:new_level/screens/teenagerData.dart';
import 'package:new_level/service/request.dart';


class SearchForm extends StatefulWidget {

  const SearchForm({super.key});

  
  
  @override
  MyCustomFormState  createState(){
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<SearchForm> {

  final _formKey = GlobalKey<FormState>();

final TextEditingController _nombreController = TextEditingController();
final TextEditingController _celularController = TextEditingController();
bool _showClearIconName = false;
bool _showClearIconCel = false;
final HttpService httpService = HttpService();

   void _clearTextName() {
      setState(() {
        _nombreController.clear();
        _showClearIconName = false;
      });
  }

  void _clearTextCel() {
      setState(() {
        _celularController.clear();
        _showClearIconCel = false;
      });
  }

  @override
  void initState() {
    super.initState();
    _nombreController.addListener(() {
      setState(() {
        _showClearIconName = _nombreController.text.isNotEmpty;
      });
    });
    _celularController.addListener(() {
      setState(() {
        _showClearIconCel = _celularController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
                decoration: const BoxDecoration(
                  gradient:LinearGradient(
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
                    Image.asset('assets/magnifier.png'),
                    //Search by celphone
                     Padding(
                      padding: EdgeInsets.fromLTRB(80,60,80,30),
                      child: TextFormField(
                                keyboardType: TextInputType.number,
                                style: const TextStyle(color: Colors.white),
                                controller: _celularController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white), // White underline when not focused
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0), // White underline when focused
                                  ),
                                  hintStyle: const TextStyle(color:Colors.white),
                                  hintText: "Ingresa el número de celular",
                                  suffixIcon: _showClearIconCel
                                      ? IconButton(
                                          icon: const Icon(Icons.clear, color: Colors.white),
                                          onPressed: _clearTextCel,
                                        )
                                      : null,
                                ),
                              ),
                    ),
                    ElevatedButton(onPressed:() async {
                      if(_formKey.currentState!.validate()){

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Buscando...")),
                        );
                        Search search = new Search(telefono: _celularController.text, nombre: null);
                        print(search.toJson());
                        final JovenData? jovenData = await httpService.buscarJoven(search);
                        if(jovenData!= null){
                          if(jovenData.data.isNotEmpty){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> Teenagerdata(persons:jovenData.data)));
                          }else{
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
                                      const Text('¡El joven no se encuentra registrado!'),
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
                    }, child: const Text('Buscar por celular')),
                    //Search by name
                    Padding(
                      padding: EdgeInsets.fromLTRB(80,0,80,30),
                      child:TextFormField(
                                controller: _nombreController,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white), // White underline when not focused
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0), // White underline when focused
                                  ),
                                  hintStyle: const TextStyle(color:Colors.white),
                                  hintText: "Ingresa el nombre",
                                  suffixIcon: _showClearIconName
                                      ? IconButton(
                                          icon: const Icon(Icons.clear, color: Colors.white,),
                                          onPressed: _clearTextName,
                                        )
                                      : null,
                                ),
                              ),
                    ),
                    ElevatedButton(onPressed:() async {
                      if(_formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Buscando...")),
                        );
                        Search search = Search(telefono: null, nombre: _nombreController.text);
                        print(search.toJson());
                        final JovenData? jovenData = await httpService.buscarJoven(search);
                        if(jovenData!= null){
                          if(jovenData.data.isNotEmpty){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>  Teenagerdata(persons:jovenData.data)));
                          }else{
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
                                      const Text('¡El joven no se encuentra registrado!'),
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
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("kk...")),
                        );
                      }
                    }, child: const Text('Buscar por nombre')),
                  ]   
                ),
              ),
              ),
    );
  }
}