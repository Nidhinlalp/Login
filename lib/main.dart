import 'package:flutter/material.dart';
import 'package:loginpage/screens/splash.dart';
const SVAE_KEY_NAME='UserLogggedIn';


void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});                                                                                                               
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       backgroundColor: Colors.black,
       
      ),
      home:const ScreenSplash(),
    );
  }
}

