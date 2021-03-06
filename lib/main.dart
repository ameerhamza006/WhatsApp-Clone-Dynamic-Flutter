import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/presention/screens/splash_screen.dart';
import 'package:flutter_whatsapp_clone/presention/widgets/theme/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor
      ),
      home: SplashScreen(),
    );
  }
}
