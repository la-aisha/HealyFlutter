import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopital/Register/RegisterInfoMedecin.dart';
import 'package:hopital/Register/Welcome.dart';

class RegisterMedecin extends StatefulWidget {
  @override
  RegisterStateMedecin createState() => RegisterStateMedecin();
}

class RegisterStateMedecin extends State<RegisterMedecin> {
  /* ----- les controllers */

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
    TextEditingController passwordconfirmController = new TextEditingController();

  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

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
                    height: 15,
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
                        isHide: false,
                        textInputType: TextInputType.visiblePassword),
                  ),
                  SizedBox(height: 60,),
                  Container(
                    width: width * 5 / 6,
                    height: 45,
                    child:
                  suivantButton()),
                  SizedBox(height: 20,),
                  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Deja inscrit ?",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 0.45),
                                fontSize: 17.3514,
                                fontStyle: FontStyle.normal
                            ),
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                              onPressed: (){
                                final medecinInfo = RegisterMedecinInfo();
                                Navigator.of(context).push(
                                MaterialPageRoute(builder: (BuildContext ctx){
                                return medecinInfo ;
                                }
                                ));
                              },
                              child:    Text(
                                "Se connecter?",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFFF66C4),
                                    fontSize: 17.3514,
                                    fontStyle: FontStyle.normal
                                ),
                                textAlign: TextAlign.center,
                              ),
                          )
                        ]),
                        /* Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        greyLine(38),
                        Padding(padding: EdgeInsets.only(right: 2)),
                        
                         Text(
                            '  Ou',
                            style: TextStyle(color:Colors.blue),
                            textAlign: TextAlign.center,
                          ),
                        

                        greyLine(14)
                      ],
                    ), */
                    SizedBox(height: 20,),
                    Container(
                      width: width * 5 / 6,
                      height: 50,
                      child:
                        OptionRegisterImg(path: "images/googleLogo.png", text: "Continuer avec Google",),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: width * 5 / 6,
                      height: 50,
                      child: OptionRegisterIcon( icon: Icons.facebook , text: "Continuer avec Facebook",color: Colors.blue,context: context ) ,
                    ),


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
            .push(MaterialPageRoute(builder: (context) => RegisterMedecinInfo()));
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
