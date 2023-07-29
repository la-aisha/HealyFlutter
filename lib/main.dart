import 'package:flutter/material.dart';
import 'package:hopital/Models/Role.dart';

import 'Screens/Register/RegisterMedecin.dart';
import 'Screens/Register/Welcome.dart';






bool show = true;
void main() async {
  /* WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true; */
  runApp(App());
}

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    RoleId roleId; 
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      

      
      //home: OnboardScreen(),
       //home: show ? IntroScreen() :  Welcome(),
       // home: RepositoryProvider(create: (context) => AppRepository(),

       // child: SignIn(),
      home: Welcome(role_id: 0) ,
  
    


    );
  }
}
