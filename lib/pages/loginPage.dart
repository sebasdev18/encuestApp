// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Icon(
              Icons.lock,
              size: 100,
            ),
            SizedBox(height: 100),
            Text(
              'Bienvenido',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Text(
              'Usuario',
              style: TextStyle(color: Colors.black45),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.blueGrey,
                      )),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      fillColor: Colors.white,
                      filled: true)),
            ),
            Text(
              'Contraseña',
              style: TextStyle(color: Colors.black45),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                  controller: _passController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.blueGrey,
                      )),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      fillColor: Colors.white,
                      filled: true)),
            ),
          ]),
        ),
      ),
    );
  }
}
