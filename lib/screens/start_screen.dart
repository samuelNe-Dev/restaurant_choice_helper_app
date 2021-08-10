import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_choice_helper_app/screens/login_screen.dart';

import 'home_screen.dart';

class Startpage extends StatefulWidget {
  const Startpage({ Key? key }) : super(key: key);

  @override
  _StartpageState createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),(){
      if(auth.currentUser == null){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginScreen()), (route) => false);
      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HomeScreen()), (route) => false);
      }
    });
    return Scaffold(
      body: Center(
        child: Text("Startseite")
      )

    );
  }
}