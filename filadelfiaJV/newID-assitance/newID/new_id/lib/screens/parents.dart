import 'package:flutter/material.dart';

import 'package:new_id/service/request.dart';

import 'registerPadres.dart';
import 'searchFormPadres.dart';


class Parents extends StatefulWidget {
  const Parents({super.key});
  
  @override
  ParentState createState() => ParentState();
}

class ParentState extends State<Parents> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // This ensures the gradient is visible behind the AppBar
      appBar: AppBar(
        title: const Text('Gestión de Padres'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255) , // Make AppBar transparent to show gradient behind it
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff5433ff), Color(0xff20bdff), Color(0xffa5fecb)],
            stops: [0, 0.5, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/family.png', 
              width: 300,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPadres()),
                  );
                },
                child: const Text('Registrar padre'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchFormPadres()),
                  );
                },
                child: const Text('Consultar padre'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
