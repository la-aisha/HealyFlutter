import 'package:flutter/material.dart';
import 'package:hopital/Register/Onboard.dart';
import 'package:hopital/Register/Otp.dart';
import 'package:hopital/Register/RegisterFileMedecin.dart';
import 'package:hopital/Register/RegisterMedecin.dart';
import 'package:hopital/Register/RegisterInfoMedecin.dart';
import 'package:hopital/Register/StartRegister.dart';
import 'package:hopital/Register/StartRegister2.dart';
import 'package:hopital/Register/Welcome.dart';
import 'package:hopital/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(MyApp());
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
      //home: OnboardScreen(),
       //home: show ? IntroScreen() :  Welcome(),
        home:  StartRegister() ,


    );
  }
}
