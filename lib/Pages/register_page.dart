// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourworkoutroutine/Components/my_button.dart';
import 'package:yourworkoutroutine/Components/my_squaretile.dart';
import 'package:yourworkoutroutine/Components/my_textfield.dart';
import 'package:yourworkoutroutine/Services/auth.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final confirmPwdController = TextEditingController();

  void signUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      if (confirmPwdController.text == pwdController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: pwdController.text);
      } else {
        wrongMessage('Passwords Dont Match');
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      wrongMessage(e.code);
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Icon(Icons.lock, size: 100),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Let\'s create an account!',
                  style: GoogleFonts.ubuntu(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email ID',
                  obscureText: false,
                  horPadding: 25.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: pwdController,
                  hintText: 'Password',
                  obscureText: true,
                  horPadding: 25.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: confirmPwdController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                  horPadding: 25.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                // const SizedBox(height: 10)
                MyButton(onTap: signUp, txt: 'Sign Up'),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                MyCircleTile(
                  imagePath: 'assets/images/google.png',
                  onTap: AuthService().signInWithGoogle,
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an Account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//                 onPressed: () => AuthService().signInWithGoogle(),
//                 child: Text('Login')),
//           ],
//         ),
//       ),
//     );
