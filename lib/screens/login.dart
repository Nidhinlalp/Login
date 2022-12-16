// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isdatamatched = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 64, 55, 234),
          title: Center(child: Text('LOGINPAGE')),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 100,
                        ),
                      ),
                      hintText: 'UserName',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Value Is Empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'PassWord',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'value is Empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 64, 55, 234),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        chekLogin(context);
                      }
                    },
                    icon: const Icon(Icons.login),
                    label: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void chekLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;

    if (_username == 'Nidhin' && _password == 'nidhinlalp') {
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SVAE_KEY_NAME, true);
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          content: Text('Username Password dosenot Match'),
          duration: Duration(seconds: 3),
          margin: EdgeInsets.all(20),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ),
      );
      print('Username Password dosenot Match');
    }
  }
}
