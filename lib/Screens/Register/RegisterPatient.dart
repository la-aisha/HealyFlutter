import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopital/Models/Patient.dart';
import 'package:hopital/Models/Role.dart';
import 'package:hopital/Screens/Register/Otp.dart';
import 'package:hopital/Screens/Register/RegisterInfoMedecin.dart';
import 'package:hopital/Screens/Register/RegisterPatientInfo.dart';
import 'package:hopital/Screens/Register/Welcome.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterPatient extends StatefulWidget {
  int role_id;
  Patient patient;
  RegisterPatient({Key? key, required this.role_id, required this.patient})
      : super(key: key);
  @override
  RegisterPatientState createState() =>
      RegisterPatientState(role_id: role_id, patient: patient);
}

class RegisterPatientState extends State<RegisterPatient> {
  final _formKey = GlobalKey<FormState>();
    bool passwordVisible = false;
      //bool passwordVisible = !isHide; // Track the password visibility state



  @override
  void initState() {
    super.initState();
    print(role_id);
   passwordVisible=true;

  }

  final int role_id;
  Patient patient;

  // RegisterPatient({required this.role_id});
  RegisterPatientState(
      {Key? key, required this.role_id, required this.patient});

  /* ----- les controllers */
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController passwordconfirmController = new TextEditingController();

  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

    bool _isLoading = false;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Image.asset(
                      'images/logo2.png',
                      width: 100,
                      height: 100,
                    ),
                  )),
                  SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: welcomeText(),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: width * 5 / 6,
                    height: 45,
                    child: textfield(
                        placeHolder: 'First Name',
                        controller: firstNameController,
                        isHide: false,
                        textInputType: TextInputType.name),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: width * 5 / 6,
                    height: 45,
                    child: textfield(
                        placeHolder: 'Last Name',
                        controller: lastNameController,
                        isHide: false,
                        textInputType: TextInputType.name),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: width * 5 / 6,
                    height: 45,
                    child: textfield(
                        placeHolder: 'Email',
                        controller: emailController,
                        isHide: false,
                        textInputType: TextInputType.emailAddress),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: width * 5 / 6,
                    height: 45,
                    child: textfield(
                        placeHolder: 'Password',
                        controller: passwordController,
                        isHide: true,
                        textInputType: TextInputType.visiblePassword),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: width * 5 / 6,
                    height: 45,
                    child: textfield(
                        placeHolder: 'Password Confirm',
                        controller: passwordconfirmController,
                        isHide: true,
                        
                        textInputType: TextInputType.visiblePassword),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Stack(
                    children: [
                      Container(
                          width: width * 5 / 6,
                          height: 45,
                          child: suivantButton()),
                      if (_isLoading)
                        Positioned.fill(
                          child: Center(
                            child: LoadingAnimationWidget.discreteCircle(
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Deja inscrit ?",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 0.45),
                          fontSize: 17.3514,
                          fontStyle: FontStyle.normal),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () async {
                        //patient =  Patient(firstname: firstNameController.text ,lastname: lastNameController.text ,email: emailController.text);
                        final info = RegisterPatientInfo(
                          patient: patient,
                        );
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext ctx) {
                          return info;
                        }));
                      },
                      child: Text(
                        "Se connecter?",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1E3148),
                            fontSize: 17.3514,
                            fontStyle: FontStyle.normal),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: width * 5 / 6,
                    height: 50,
                    child: OptionRegisterImg(
                      path: "images/googleLogo.png",
                      text: "Continuer avec Google",
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: width * 5 / 6,
                    height: 50,
                    child: OptionRegisterIcon(
                        icon: Icons.facebook,
                        text: "Continuer avec Facebook",
                        color: Color(0xFF1E3148),
                        context: context),
                  ),
                ]),
          ),
        ),

        //color: Colors.red,
      ),
    );
  }

  /* ------ error modal ------- */

/* ---- champs text --- */

  TextFormField textfield(
      {required String placeHolder,
      bool isHide = false,
      controller,
      
      InputDecoration? decoration,
       TextInputType? textInputType,
      // void Function(String)? event,
      }) {
    return TextFormField(
      //  onChanged: event,

      controller: controller,
      validator: (value) {
        /*  if (controller == firstNameController ||
            controller == lastNameController) {
          if (!hasTwoWords(value!)) {
            return 'Please enter at least two words';
          }
        } else if (controller == emailController) {
          if (isEmailValid(value!)) {
            return 'Enter a valid email';
          }
        } else if (placeHolder == 'Password') {
          if (!isPasswordValid(value!)) {
            return 'Password should be at least 8 characters long';
          }
        } */
      },
      decoration: InputDecoration(
          labelStyle: GoogleFonts.poppins(
            fontSize: 21.43,
            color: Color.fromRGBO(0, 0, 0, 0.2),
          ),
          hintText: placeHolder,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xFF1E3148),
                width: 3.0,
              ))),
      obscureText: isHide,
      keyboardType: textInputType,
    );
  }

// Password validation function
  bool isPasswordValid(String password) {
    return password.length >= 8;
  }

// Email validation regex pattern
  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

// Function to validate if the input has at least two words
  bool hasTwoWords(String value) {
    return value.trim().split(' ').length >= 2;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    if (!value.contains('@') && !value.contains('.')) {
      return 'Please enter a valid email address';
    }
    return 'Please enter your email';
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return 'Password can only contain letters and numbers';
    }
    return null;
  }

  /* ----- GREY LINE ---- */
  Container greyLine(double valMargin) {
    return Container(
      width: 133,
      height: 1,
      color: Color(0xFF1E3148),
      margin: EdgeInsets.only(left: valMargin),
    );
  }

  void showErrorDialog(List<String> errorMessages) {
    showDialog(
      // barrierColor: Colors.grey,
      barrierDismissible: true,

      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Error',
            style: GoogleFonts.poppins(),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var errorMessage in errorMessages) Text(errorMessage),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Color(0xFF1E3148)),
              ),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  ElevatedButton suivantButton() {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          setState(() {
            _isLoading = true;
          });
          // Simulate some asynchronous task (e.g., API call) using `await Future.delayed`
          await Future.delayed(Duration(seconds: 2));
          setState(() {
            _isLoading = false;
          });
          List<String> errorMessages = [];

          if (firstNameController.text.trim().replaceAll(RegExp(r'[^\p{L}]'), '').length >= 2
) {
            errorMessages.add('Please enter at least two words for First Name');
          }

          if (lastNameController.text.trim().replaceAll(RegExp(r'[^\p{L}]'), '').length >= 2) {
            errorMessages.add('Please enter at least two words for Last Name');
          }
          if (passwordController.text != passwordconfirmController.text) {
            errorMessages.add('The two passwords are not the same');
          }          if (!isEmailValid(emailController.text)) {
            errorMessages.add('Enter a valid email');
          }

          if (!isPasswordValid(passwordController.text)) {
            errorMessages.add('Password should be at least 8 characters long');
          }

          if (passwordController.text != passwordconfirmController.text) {
            errorMessages.add('Password and Confirm Password do not match');
          }

          if (errorMessages.isNotEmpty) {
            showErrorDialog(errorMessages);
            return; // Stop further processing if there are errors
          }

          try {
            patient = Patient(
              firstname: firstNameController.text,
              lastname: lastNameController.text,
              email: emailController.text,
            );

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RegisterPatientInfo(patient: patient),
              ),
            );
          } catch (e) {
            showErrorDialog([e.toString()]);
          }
        }
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Color(0xFF1E3148)),
      ),
      child: Text(
        'Suivant',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

/* --- fqcebook --- */
  ElevatedButton OptionRegisterIcon(
      {required String text,
      IconData? icon,
      required Color color,
      required BuildContext context}) {
    return ElevatedButton(
      onPressed: () {
        /*  if(icon == Icons.mail){
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext ctx){
        return Login() ;
    })) ;

   }
 */
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          )
        ],
      ),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: const BorderSide(color: Color(0xFF1E3148), width: 2),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.white)),
    );
  }

/* ---- Option Register */
  ElevatedButton OptionRegisterImg(
      {String? path, required String text, IconData? icon}) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        children: [
          Image.asset(
            "$path",
            width: 23,
            height: 22,
          ),
          // Icon(icon , color: Colors.black,),

          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: const BorderSide(color: Color(0xFF1E3148), width: 2),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.white)),
    );
  }

/* ---fonction pour aligner deux row */
  Center welcomeText() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Aligns text to the left

        children: [
          Text(
            'BIENVENUE,',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E3148),
              fontSize: 21.95,
              decoration: TextDecoration.underline,
              decorationColor: Color(0xFF1E3148),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            ' Patient',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 21.95,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
