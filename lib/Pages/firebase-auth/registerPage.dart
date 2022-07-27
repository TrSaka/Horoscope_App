// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_const, unnecessary_new, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:horoscope_project/Pages/firebase-auth/loginPage.dart';
import 'package:horoscope_project/models/color/colors.dart';
import 'package:horoscope_project/models/navi_push.dart';

import '../../models/showToast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late FirebaseAuth auth;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  @override
  void dispose() {
    super.dispose();
    cancelToast();
  }

  TextEditingController _register_name = TextEditingController();
  TextEditingController _register_email = TextEditingController();
  TextEditingController _register_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              color: Color.fromARGB(255, 226, 177, 235),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width / 5,
                      right: MediaQuery.of(context).size.width / 2),
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 3,
                ),
                tfield("Name", _register_name, false),
                SizedBox(height: MediaQuery.of(context).size.width / 15),
                tfield("Email Address", _register_email, false),
                SizedBox(height: MediaQuery.of(context).size.width / 15),
                tfield("Password", _register_password, true),
                SizedBox(height: MediaQuery.of(context).size.width / 15),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Cthird,
                  ),
                  child: FlatButton(
                    onPressed: () {
                      createUser();
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 3,
                ),
                Text(
                  "Already have an account ?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Cthird,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextField tfield(String ltext, dynamic controller, bool shadow) {
    return TextField(
      obscureText: shadow,
      controller: controller,
      decoration: InputDecoration(
        labelText: ltext,
        labelStyle: TextStyle(color: Colors.black),
        focusColor: Cinput,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 171, 70, 189)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Cinput,
          ),
        ),
      ),
      showCursor: false,
    );
  }

  void createUser() async {
    debugPrint(_register_name.text.toString());
    try {
      var userCredit = await auth.createUserWithEmailAndPassword(
          email: _register_email.text, password: _register_password.text);
      showToast("You succesfully registered.", null);
      if (auth.currentUser != null) {
        push_time(context, LoginScreen(), 3);
      } else {
        debugPrint("User didn't sign In");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak password') {
        showToast("Your password is too weak", null);
      } else if (e.code == 'email-already-in-use') {
        showToast("Your email already in use on different account", null);
      } else {
        showToast("Please try again", null);
      }
    }
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 220);
    path.quadraticBezierTo(size.width / 4, 160 /*180*/, size.width / 2, 175);
    path.quadraticBezierTo(3 / 4 * size.width, 190, size.width, 130);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
