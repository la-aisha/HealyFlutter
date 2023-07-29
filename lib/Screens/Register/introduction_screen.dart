import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopital/Models/Role.dart';
import 'package:hopital/Screens/Register/Welcome.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
   IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<PageViewModel>? pages=[
    PageViewModel(
      title:'Lorem ipsum dolor sit amet, consectetur adipiscing' ,
      body:'Curabitur rhoncus tincidunt augue, at sollicitudin mi rhoncus vitae. In hac habitasse platea dictumst. Quisque pellentesque, mauris ut eleifend tincidunt, ' ,
      
      image: Center(child: Image.asset('images/medecin.png'),),
      decoration: PageDecoration(
      titleTextStyle: GoogleFonts.dosis(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 20,
            fontStyle: FontStyle.normal,
          ),
      )

    ),
     PageViewModel(
      title:' at finibus nunc ' ,
      body:'Curabitur rhoncus tincidunt augue, at sollicitudin mi rhoncus vitae. In hac habitasse platea dictumst. Quisque pellentesque, mauris ut eleifend tincidunt, ' ,
      /* footer:ElevatedButton(onPressed: (){},
      child: const Text('lets go')), */
      image: Center(child: Image.asset('images/gyneco.png'),),
      decoration: PageDecoration(
     titleTextStyle: GoogleFonts.dosis(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 20,
            fontStyle: FontStyle.normal,
          ),
      )

    ),
    
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
         child: IntroductionScreen(
        
        pages: pages,
        dotsDecorator: DotsDecorator(
          size: Size(11,11),
          activeSize: Size.square(15),
          color: Color(0xFF1E3148) ,
          activeColor: Color(0xFF1E3148),
          
        ),
        showBackButton: false,
        done: Image.asset(
          'images/arrow2.png',
          color: Color(0xFF1E3148),
          width: 30,
          height: 30,
        ),
       /*  showSkipButton: true,
         skip: Text(
          'skip',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontSize: 20,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.center,
        ), */
        showNextButton: true,
        next:Icon(Icons.arrow_forward,size: 10,color: Color(0xFF1E3148),),
        onDone: ()=>onDone(context) ,
        curve: Curves.bounceOut,


      )),
      
      
    );
  }

  void onDone(context) async{
    /* final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false); */

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Welcome(role_id: 0),));

  }
}