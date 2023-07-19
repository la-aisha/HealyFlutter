import 'package:flutter/material.dart';
//import 'StartRegister.dart'
import 'package:hopital/Login/Signin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopital/Register/RegisterMedecin.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    Color myColor = Color(0xFF1E3148);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        //mainAxisAlignment: MainAxisAlignment.center ,
        //crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            SizedBox(height: height / 15),
            Center(
              child: Image.asset(
                'images/logo2.png',
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: height / 8),
           const Center(
              //color:Colors.red,
              child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisSize: MainAxisSize.max,
                children: [
                Padding(padding: EdgeInsets.only(top: 20),
               /*  child:const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'BIENVENUE,',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue,
                        fontFamily: 'Tektur',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                      ),
                    ),
                    TextSpan(
                        text: 'que cherchez-vous?',
                        style: TextStyle(
                          fontSize: 19.421,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        )),
                  ],
                ),
              ),
              */   ),
             /*  Padding(padding: EdgeInsets.only(top: 20),
              child: Container(
                //margin: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 3.0),
                child: Text(
                  'Lorem ipsum dolo sit amet, consectetur adipiscing elit ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 18.23,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
                ),
                */ ],
              )
            ),
            //const SizedBox(height: 60),
            //SizedBox(height: height / 8),
            SizedBox(height: height / 8),
            Container(
              //color:Colors.red,
              width: width * 3 / 4,
              height: 75,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegisterMedecin(),
                  ));
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
                  backgroundColor: MaterialStateProperty.all(myColor)),
                child: Text(
                  'Je suis un  Patient',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 20

                  ),
                ),
              ),
            ),
            //const SizedBox(height: 26.81),
            SizedBox(height: height / 30),
            Container(
              // color:Colors.red,
              width: width * 3 / 4,
              height: 75,
              child: ElevatedButton(
                onPressed: () {
                  //final signin = SignIn();
                  Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => RegisterMedecin()));
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: const BorderSide(color: Color(0xFF1E3148), width: 2),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                child: Text(
                  'Je suis un Medecin',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 20
                  ),
                )),
            )

  //text
          ],
        )),
    );
  }
}


