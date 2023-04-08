import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:yourworkoutroutine/Pages/Login_Page.dart';
import 'package:yourworkoutroutine/Pages/new_user.dart';
import 'package:yourworkoutroutine/Services/home_or_new.dart';
import 'package:yourworkoutroutine/Services/login_or_register.dart';

import 'package:yourworkoutroutine/main.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeOrNew();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
