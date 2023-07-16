import 'package:flutter/material.dart';
import 'package:hopital/Register/StartRegister2.dart';
import 'package:hopital/Register/Welcome.dart';

class StartRegister extends StatefulWidget {
  const StartRegister({super.key});

  @override
  State<StartRegister> createState() => StartRegisterState();
}

class StartRegisterState extends State<StartRegister> {
  @override
  void initstate() {
    super.initState();
    _navigatetoStartRegister2();
  }

  _navigatetoStartRegister2(){
     Future.delayed(
      Duration(milliseconds: 9500),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Welcome()));


      }
    );
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return Scaffold(
      //appBar: AppBar,
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: Image.asset(
          'images/logo.png',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
