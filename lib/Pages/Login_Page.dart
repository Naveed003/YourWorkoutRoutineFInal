import 'package:flutter/material.dart';
import 'package:yourworkoutroutine/Services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void SignIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => AuthService().signInWithGoogle(),
                child: Text('Login')),
          ],
        ),
      ),
    );
  }
}
