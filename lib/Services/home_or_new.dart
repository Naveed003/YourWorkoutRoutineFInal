import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:yourworkoutroutine/Pages/new_user.dart';
import 'package:yourworkoutroutine/main.dart';

class HomeOrNew extends StatefulWidget {
  const HomeOrNew({super.key});

  @override
  State<HomeOrNew> createState() => _HomeOrNewState();
}

class _HomeOrNewState extends State<HomeOrNew> {
  bool check = false;

  void toggle() {
    setState(() {});
  }

  @override
  Widget build(context) {
    final user = FirebaseAuth.instance.currentUser!;
    final uID = user.uid;
    final ref = FirebaseDatabase.instance.ref();

    return FutureBuilder<DataSnapshot>(
        future: ref.child('USERS/$uID').get(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasData && snapshot.data!.exists) {
            return HomePage();
          } else {
            return NewUser(tog: toggle);
          }
        });
  }
}
