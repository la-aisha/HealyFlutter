import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hopital/Screens/Register/StartRegister2.dart';
import 'package:hopital/Screens/Register/introduction_screen.dart';
import 'package:im_animations/im_animations.dart';



class StartRegister extends StatefulWidget {
  const StartRegister({Key? key}) : super(key: key);
  @override
  State<StartRegister> createState() => _StartRegisterState();
}

class _StartRegisterState extends State<StartRegister> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 8), () {
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => StartRegister2())); //permet de rediriger vers une autre page sans retour
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        width: MediaQuery.of(context)
            .size
            .width, //permet de prendre tous l'espace utiliser
        height: MediaQuery.of(context).size.height,
        color: Color(0xFF1E3148),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, //espacer les elements
          children: [
            Image.asset('images/logo.png',width: 300,height: 300,),
            
          ],
        ),
      ),
    );
  }
}
