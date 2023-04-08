import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourworkoutroutine/Components/date_picker.dart';
import 'package:yourworkoutroutine/Components/drop_down.dart';
import 'package:yourworkoutroutine/Components/my_textfield.dart';
import 'package:yourworkoutroutine/Services/auth.dart';

class NewUser extends StatefulWidget {
  final void tog;
  const NewUser({super.key, required this.tog});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final sexController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;
  var name = [];

  getProfileImage() {
    if (user.photoURL != null) {
      return NetworkImage(user.photoURL!);
    } else {
      return AssetImage('assets/images/person2.png');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    emailController.text = user.email!;
    sexController.text = "Male";
    if (user.displayName != null) {
      nameController.text = user.displayName!;
      name.addAll(['Full Name', '', false]);
    } else {
      print('fgd');
      name.addAll(['Full Name', '', true]);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double WIDTH = MediaQuery.of(context).size.width;
    final double HEIGHT = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(25, HEIGHT * 10 / 100, 25, 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let\'s get you Set Up ',
                  style: TextStyle(
                    color: Colors.brown[700],
                    fontFamily: 'Anton',
                    fontSize: WIDTH * 6 / 100,
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.fromLTRB(0, 50, 0, 30),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.brown.shade700, width: 3),
                        borderRadius: BorderRadius.circular(100)),
                    child: CircleAvatar(
                      backgroundImage: getProfileImage(),
                      backgroundColor: Colors.transparent,
                      radius: WIDTH * 15 / 100,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                      width: (WIDTH - 50),
                      height: 50,
                      child: MyTextFormField(
                        controller: nameController,
                        labelText: name[0],
                        hintText: name[1],
                        horPadding: 0,
                        enableCheck: name[2],
                        keyboardType: TextInputType.name,
                      )),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: (WIDTH - 50),
                    height: 50,
                    child: MyTextFormField(
                      controller: emailController,
                      labelText: 'EMAIL ID',
                      hintText: '',
                      horPadding: 0,
                      enableCheck: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                Row(
                  children: [
                    MyCustomeDatePicker(
                      controller: dobController,
                      label: 'Date of Birth',
                      width: (WIDTH - 50 - 10) / 2,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    MyDropDownMenu(
                      controller: sexController,
                      width: (WIDTH - 50 - 10) / 2,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                          width: (WIDTH - 50 - 10) / 2,
                          height: 50,
                          child: MyTextFormField(
                            controller: weightController,
                            labelText: 'Weight',
                            hintText: 'Kg',
                            horPadding: 0,
                            enableCheck: true,
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: false, decimal: true),
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                          width: (WIDTH - 50 - 10) / 2,
                          height: 50,
                          child: MyTextFormField(
                            controller: heightController,
                            labelText: 'Height',
                            hintText: 'cm',
                            horPadding: 0,
                            enableCheck: true,
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: false, decimal: true),
                          )),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => FirebaseAuth.instance.signOut(),
                  child: Text("gfd"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
