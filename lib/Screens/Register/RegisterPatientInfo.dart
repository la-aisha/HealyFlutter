import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopital/Models/Patient.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../Models/AllergiesResponse.dart';
import '../../Services/apiservice.dart';
import 'RegisterFileMedecin.dart';

class RegisterPatientInfo extends StatefulWidget {
  final Patient patient;

  const RegisterPatientInfo({super.key, required this.patient});

  @override
  State<RegisterPatientInfo> createState() =>
      _RegisterPatientInfoState(patient: patient);
}

class _RegisterPatientInfoState extends State<RegisterPatientInfo> {
  Patient patient;
    final _formKey = GlobalKey<FormState>();

  _RegisterPatientInfoState({required this.patient});

  @override
  TextEditingController ddnController = new TextEditingController();
  TextEditingController specialiteController = new TextEditingController();
  TextEditingController hopitalController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  TextEditingController numberController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  Future<List<AllergiesResponse>> allergies = ApiService.getAllAllergies();

    bool _isLoading = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllergies();
    print(patient.email);
  }

  Future<void> _getAllergies() async {
    try {
      List<AllergiesResponse> allergiesList =
          await ApiService.getAllAllergies();
      if (allergiesList.isNotEmpty) {
        print("List of Allergies:");
        print("--------------");
        allergiesList.forEach((allergy) {
          print("Allergy ID: ${allergy.id}");
          print("Allergy Name: ${allergy.nom}");
          print("Allergy Description: ${allergy.description}");
          print("--------------");
        });
      } else {
        print("No allergies data found.");
      }
    } catch (e) {
      print("Error fetching allergies: $e");
    }
  }

  //get genderItems => null;
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    final List<String> genderItems = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
    ];
    print("List of patient data :");

    String? selectedValue;
    return Scaffold(
      body: SingleChildScrollView(
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
                  width: 150,
                  height: 150,
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
              SizedBox(
                height: 50,
              ),
              Container(
                width: width * 5 / 6,
                height: 45,
                child: textfield(
                    placeHolder: 'Date Birth',
                    controller: ddnController,
                    isHide: false,
                    textInputType: TextInputType.datetime),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: width * 5 / 6,
                height: 45,
                child: textfield(
                    placeHolder: 'Number',
                    controller: numberController,
                    isHide: false,
                    textInputType: TextInputType.number),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: width * 5 / 6,
                height: 45,
                child: textfield(
                    placeHolder: 'Address',
                    controller: addressController,
                    isHide: false,
                    textInputType: TextInputType.text),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: width * 5 / 6,
                height: 45,
                child: suivantButton(),
              )
            ]),

        //color: Colors.red,
      ),),
    );
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
  showErrorDialog(List<String> errorMessages) {
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

          if (ddnController.text.trim().replaceAll(RegExp(r'[^\p{L}]'), '').length >= 2
) {
            errorMessages.add('Please enter at least two words for First Name');
          }

          if (addressController.text.trim().replaceAll(RegExp(r'[^\p{L}]'), '').length >= 2) {
            errorMessages.add('Please enter at least two words for Last Name');
          }
         
          if (errorMessages.isNotEmpty) {
            showErrorDialog(errorMessages);
            return; // Stop further processing if there are errors
          }

          try {
           /*  patient = Patient(
              firstname: firstNameController.text,
              lastname: lastNameController.text,
              email: emailController.text,
            );
 */
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
            ' Patient ',
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

  /* ---- champs text --- */

  TextField textfield(
      {required String placeHolder,
      bool isHide = false,
      controller,
      TextInputType? textInputType}) {
    return TextField(
      controller: controller,
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
}
