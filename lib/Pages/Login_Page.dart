import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yourworkoutroutine/Services/auth.dart';
import 'dart:io';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Authenticate _auth = Authenticate();

  void somethin() {
    _auth._handleSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  somethin();
                },
                child: Text("child"))
          ],
        ),
      ),
    );
  }
}
