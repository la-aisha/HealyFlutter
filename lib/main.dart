import 'package:flutter/material.dart';
import 'package:hopital/Register/RegisterFileMedecin.dart';
import 'package:hopital/Register/RegisterMedecin.dart';
import 'package:hopital/Register/RegisterInfoMedecin.dart';
import 'package:hopital/Register/StartRegister.dart';
import 'package:hopital/Register/Welcome.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home: RegisterFileMedecin(),
    );
  }
}
