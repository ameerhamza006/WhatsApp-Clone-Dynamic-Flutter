import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/presention/screens/home_screen.dart';
import 'package:flutter_whatsapp_clone/presention/screens/registration_screen.dart';
import 'package:flutter_whatsapp_clone/presention/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => WelcomeScreen()
      ), (route) => false,
      );
      //TODO:
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("WhatsApp Clone", style: TextStyle(fontSize: 20,color: Colors.white),),
      ),
    );
  }
}
