import 'package:flutter/material.dart';
import 'package:new_level/models/ingreso.dart';
import 'package:new_level/screens/TextFormFieldWithClearIcon.dart';
import 'package:new_level/screens/searchForm.dart';
import 'package:new_level/screens/bottonNav.dart';
import 'package:new_level/service/request.dart';


class home extends StatefulWidget {
  const home({super.key});
  
  @override
  homeState  createState(){
    return homeState();
  }
}

class homeState extends State<home> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  bool passwordVisible = true;  
  Map<String, String> ingresoForm = Map();
  final HttpService httpService = HttpService();


  @override
  Widget build(BuildContext context) {

   return Container(
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
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          Image.asset(
            'assets/logoNewLevel.png', 
            width: 300,
            height: 150,),
           Padding(
            padding: EdgeInsets.fromLTRB(80,80,80,30),
            child: TextField( 
              controller: _passwordController,
              obscureText: passwordVisible,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle: const TextStyle(color: Colors.white),
                labelText: 'Contraseña',
                enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // White underline when not focused
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0), // White underline when focused
                    ),
                suffixIcon: IconButton(
                     color: Colors.white,
                     icon: Icon(passwordVisible
                         ? Icons.visibility_off
                         : Icons.visibility),
                     onPressed: () {
                       setState(
                         () {
                           passwordVisible = !passwordVisible;
                         },
                       );
                     },
                   ),
              ),
            )
          ),
          ElevatedButton(onPressed:() async {
            if(_formKey.currentState!.validate()){
              if(_passwordController.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Ingresa lo datos")),
              );
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Buscando...")),
              );
              ingresoForm.addEntries({'password':_passwordController.text}.entries);
              final Ingreso ingreso = await httpService.ingreso(ingresoForm);
              if(ingreso.exitoso){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> const Bottonnav()));
                _passwordController.clear();
             }else{
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Dato incorrecto. Intenta de nuevo")),
              );
               _passwordController.clear();
              }          
             }
              
            }else{
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Completa la información")),
              );

            }
          }, child: const Text('Ingresar')),
        ]
        
      ),
    ),
    );
    
  }


}