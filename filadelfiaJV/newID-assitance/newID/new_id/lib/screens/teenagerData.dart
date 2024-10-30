import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // for File
import 'package:new_id/models/jovenData.dart';
import 'package:characters/characters.dart';
import 'package:new_id/screens/editUserForm.dart';

class Teenagerdata extends StatefulWidget {
  final List<UserData> persons;

  const Teenagerdata({required this.persons});

  @override
  _TeenagerdataState createState() => _TeenagerdataState();
}

class _TeenagerdataState extends State<Teenagerdata> {
  final ImagePicker _picker = ImagePicker();
  Map<int, File?> _imageFiles = {}; // Map to store image files for each index

  Future<void> _updateData(int index) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Actualizar Datos', style: TextStyle(fontFamily: 'Roboto')),
          content: const Text('La lógica para actualizar datos va aquí.', style: TextStyle(fontFamily: 'Roboto')),
          actions: <Widget>[
            TextButton(
              child: const Text('OK', style: TextStyle(fontFamily: 'Roboto')),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _uploadPhoto(int index) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFiles[index] = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados', style: TextStyle(fontFamily: 'Roboto')),
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
        child:
          ListView.builder(
            itemCount: widget.persons.length,
            itemBuilder: (context, index) {
              final person = widget.persons[index];
              final imageFile = _imageFiles[index];
          
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          GestureDetector(
                            onTap: () => _uploadPhoto(index),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: imageFile != null
                                  ? FileImage(imageFile)
                                  : null,
                              backgroundColor: Colors.grey.shade300, // Show the selected image if available
                              child: imageFile == null
                                  ? const Icon(Icons.person, size: 35, color: Colors.white) // Placeholder icon
                                  : null,
                            ),
                          ),
                          Positioned(
                            bottom: -5,
                            right: -5,
                            child: IconButton(
                              icon: const Icon(Icons.add_a_photo, color: Colors.blue, size: 24),
                              onPressed: () => _uploadPhoto(index),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              person.nombreCompleto ?? person.primerNombre,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildDetailRow('Celular:', person.telefono),
                            _buildDetailRow('Edad:', person.edad.toString() ?? 'Sin datos'),
                            _buildDetailRow('Grupo edad:', person.grupoEdad.toString() ?? 'Sin datos'),
                            _buildDetailRow('Mentor:', person.abreviaturaMentor ?? 'Sin datos'),
                            _buildDetailRow('Fecha de nacimiento:', person.fechaNacimientoString ?? 'Sin datos'),
                            _buildDetailRow('Requiere parqueadero:', person.parqueadero == true ? 'Sí' : 'No'),
                            _buildDetailRow('Asistencias:', person.asistencias.toString()),
                            _buildDetailRow('Sexo:', person.genero),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditUserForm(
                                          userData: person
                                        ),
                                      ),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Ubuntu',
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
