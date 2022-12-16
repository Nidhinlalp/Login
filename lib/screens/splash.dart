import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loginpage/screens/home.dart';
import 'package:loginpage/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';


class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
     chekUserLoggedIn();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 17, 17),
      body: Center(
      child:Image.asset('assets/images/splash.gif',
      height: 200,
      ),
      ),
      );
  }
 
  Future<void>gotoLogin()async{
   
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx)=>ScreenLogin(),
      ),
    );
  }
  Future<void> chekUserLoggedIn()async
  {
     await Future.delayed(Duration(seconds: 4));
    final _sharedPrefs= await SharedPreferences.getInstance();
   final  _userLoggedIn= _sharedPrefs.getBool(SVAE_KEY_NAME);
   if(_userLoggedIn==null)
   {
    gotoLogin();
   }else{
   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ScreenHome())); 
   }
  }
}
