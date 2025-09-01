import 'package:crud_app/screens/add_newProduct_screen.dart';
import 'package:crud_app/screens/home.dart';
import 'package:crud_app/screens/update_Product_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CrudApp());
}

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud App',
      theme: ThemeData(colorSchemeSeed: Colors.blueAccent),
      home: HomeScreen(),
    );
  }
}
