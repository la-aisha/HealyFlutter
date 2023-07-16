import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:hopital/Register/RegisterFileMedecin.dart';

class RegisterMedecinInfo extends StatefulWidget {
  const RegisterMedecinInfo({super.key});

  @override
  State<RegisterMedecinInfo> createState() => _RegisterMedecinInfoState();
}

class _RegisterMedecinInfoState extends State<RegisterMedecinInfo> {
  @override
  TextEditingController ddnController = new TextEditingController();
  TextEditingController specialiteController = new TextEditingController();
    TextEditingController hopitalController = new TextEditingController();
    TextEditingController addressController = new TextEditingController();


  TextEditingController numberController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  
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
    String? selectedValue;
    return Scaffold(
      body: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Image.asset(
                      'images/logo.png',
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
                    height: 15,
                  ),
                  Container(
                      width: width * 5 / 6,
                      height: 45,

                    child :DropdownButtonFormField2<String>(
                
                isExpanded: false,
                decoration: InputDecoration(
                  // Add Horizontal padding using menuItemStyleData.padding so it matches
                  // the menu padding when button's width is not specified.
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // Add more decoration..
                ),
                hint: const Text(
                  'Select Your Hospital',
                  style: TextStyle(fontSize: 14),
                ),
                items: genderItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select Your Hospital.';
                  }
                  return null;
                },
                onChanged: (value) {
                  //Do something when selected item is changed.
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
                  
                  ),
                  SizedBox(
                    height: 15,
                  ),
                 
                  Container(
                      width: width * 5 / 6,
                      height: 45,

                    child :DropdownButtonFormField2<String>(
                
                isExpanded: false,
                decoration: InputDecoration(
                  // Add Horizontal padding using menuItemStyleData.padding so it matches
                  // the menu padding when button's width is not specified.
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // Add more decoration..
                ),
                hint: const Text(
                  'Select Your Speciality',
                  style: TextStyle(fontSize: 14),
                ),
                items: genderItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please selects speciality.';
                  }
                  return null;
                },
                onChanged: (value) {
                  //Do something when selected item is changed.
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
                  
                  ),
                   SizedBox(
                    height: 100,
                  ),
                  Container(
                    width: width * 5 / 6,
                    height: 45,
                    child:
                  suivantButton()),
                  
                ]),
                
          )

          //color: Colors.red,

          ),
    );
  


}

  /* ----- GREY LINE ---- */
  Container greyLine(double valMargin){
    return Container(
      width: 133,
      height: 1,
      color: Colors.blue,
      margin:EdgeInsets.only(left: valMargin) ,
    );
  }
ElevatedButton suivantButton() {
  return ElevatedButton(
      onPressed: () {
        //final signin = SignIn();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RegisterFileMedecin()));
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              //side: const BorderSide(color: Colors.blue, width: 2),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.blue)),
      child: Text(
        'Suivant',
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400, color: Colors.white, fontSize: 20),
  ));
}
/* --- fqcebook --- */
ElevatedButton OptionRegisterIcon({ required String text, IconData? icon , required Color color , required BuildContext context }  ){
  return ElevatedButton(onPressed: (){    
   
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
      Icon(icon , color: color,),
      Padding(padding: EdgeInsets.only(left: 10)),
      Text(text , style: TextStyle( fontSize: 16 , fontWeight: FontWeight.w500 , color: Colors.black,),)
    ],
  ),
   style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Colors.blue, width: 2),
      ),
    ),
    backgroundColor: MaterialStateProperty.all(Colors.white)),
  );
}

/* ---- Option Register */
ElevatedButton OptionRegisterImg({String? path , required String text, IconData? icon} ){
  return ElevatedButton(onPressed: (){
  }, 
  child: Row(
    children: [
      Image.asset("$path" ,width: 23 ,height: 22,) ,
     // Icon(icon , color: Colors.black,),

      Padding(padding: EdgeInsets.only( left : 10) ,
      child:Text(text , style: TextStyle( fontSize: 16 , fontWeight: FontWeight.w500 , color: Colors.black,),),)
    ],
  ),
   style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Colors.blue, width: 2),
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
            color: Colors.blue,
            fontSize: 21.95,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          ' Medecin ',
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
              color: Colors.blue,
              width: 3.0,
            ))),
    obscureText: isHide,
    keyboardType: textInputType,
  );


  
}

  
}