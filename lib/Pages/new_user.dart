// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yourworkoutroutine/Components/check_box.dart';
import 'package:yourworkoutroutine/Components/date_picker.dart';
import 'package:yourworkoutroutine/Components/drop_down.dart';
import 'package:yourworkoutroutine/Components/my_squaretile.dart';
import 'package:yourworkoutroutine/Components/my_textfield.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

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
  final sitUpsCount = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;
  File? img1;
  File? img2;

  File? img3;

  var name = [];
  var images = <File?>[null, null, null];
  var healthController = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  getProfileImage() {
    if (user.photoURL != null) {
      return NetworkImage(user.photoURL!);
    } else {
      return const AssetImage('assets/images/person2.png');
    }
  }

  void submit() {
    if (nameController.text == null ||
        emailController.text == null ||
        dobController.text == null ||
        sexController.text == null ||
        weightController.text == null ||
        heightController.text == null ||
        images[0] == null ||
        images[1] == null ||
        images[2] == null ||
        sitUpsCount.text == null) {
      wrongMessage('Fill in the missing fields');
    }
  }

  void wrongMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.yellow[800],
              title: Center(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.black),
                ),
              ));
        });
  }

  @override
  void initState() {
    emailController.text = user.email!;
    sexController.text = "Male";
    if (user.displayName != null) {
      nameController.text = user.displayName!;
      name.addAll(['Full Name', '', false]);
    } else {
      name.addAll(['Full Name', '', true]);
    }
    for (var i = 0; i < 4; i++) {
      healthController[i].text = 'false';
    }

    super.initState();
  }

  Future getImage(int i) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporary = File(image.path);

    images[i] = imageTemporary;
    print(image.path);

    setState(() {});
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
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Health  Conditions',
                  style: TextStyle(
                    fontFamily: 'AsapCondensed',
                    fontSize: WIDTH * 5 / 100,
                  ),
                ),
                Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: [
                    MyCheckBox(controller: healthController[0], label: 'Heart'),
                    MyCheckBox(
                        controller: healthController[1], label: 'Breathing'),
                    MyCheckBox(
                        controller: healthController[2], label: 'Diabetics'),
                    MyCheckBox(
                        controller: healthController[3], label: 'Hormonal'),
                  ],
                ),
                Row(
                  children: [
                    MySquareTile(
                      image: images[0],
                      onTap: () => getImage(0),
                      width: WIDTH,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    MySquareTile(
                      image: images[1],
                      onTap: () => getImage(1),
                      width: WIDTH,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    MySquareTile(
                      image: images[2],
                      onTap: () => getImage(2),
                      width: WIDTH,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                          width: (WIDTH - 50 - 10) / 2,
                          height: 50,
                          child: MyTextFormField(
                            controller: sitUpsCount,
                            labelText: 'Sit ups Count',
                            hintText: '',
                            horPadding: 0,
                            enableCheck: true,
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: false, decimal: true),
                          )),
                    ),
                    GestureDetector(
                      onTap: () => submit(),
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: const Text(
                          'Submit Now',
                          style: TextStyle(
                            fontFamily: 'Anton',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () => FirebaseAuth.instance.signOut(),
                  // onTap: () {
                  //   for (var i = 0; i < 4; i++) {
                  //     print(healthController[i].text + i.toString());
                  //   }
                  // },
                  child: const Text("gfd"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
