import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hopital/Register/StartRegister2.dart';
import 'package:hopital/introduction_screen.dart';

class StartRegister2 extends StatefulWidget {
  const StartRegister2({Key? key}) : super(key: key);
  @override
  State<StartRegister2> createState() => _StartRegister2();
}

class _StartRegister2 extends State<StartRegister2> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => IntroScreen())); //permet de rediriger vers une autre page sans retour
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
        color: Colors.white,
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, //espacer les elements
          children: [
            Image.asset('images/logo2.png',width: 300,height: 300,),
            
          ],
        ),
      ),
    );
  }
}
