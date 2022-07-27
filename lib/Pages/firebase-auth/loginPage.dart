// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_const, unnecessary_new, use_build_context_synchronously, empty_catches, unused_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:horoscope_project/Pages/splashScreen/splashScreen.dart';

import 'package:horoscope_project/Pages/firebase-auth/registerPage.dart';
import 'package:horoscope_project/models/navi_push.dart';
import 'package:horoscope_project/models/showToast.dart';
import 'package:horoscope_project/models/color/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FirebaseAuth auth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = FirebaseAuth.instance;
  }

  TextEditingController _login_email = TextEditingController();
  TextEditingController _login_password = TextEditingController();

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
                    "Login",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 3,
                ),
                tfield("Email Address", _login_email, false),
                SizedBox(height: 30),
                tfield("Password", _login_password, true),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Cthird,
                  ),
                  child: FlatButton(
                    onPressed: () {
                      loginUser();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 2.5,
                ),
                Text(
                  "Don't have an account ?",
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
                            RegisterScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Create Account",
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
      controller: controller,
      decoration: InputDecoration(
        labelText: ltext,
        labelStyle: TextStyle(color: Colors.black),
        focusColor: Cinput,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Cinput),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Cinput,
          ),
        ),
      ),
      showCursor: shadow,
    );
  }

  void loginUser() async {
    try {
      var userCredit = await auth.signInWithEmailAndPassword(
          email: _login_email.text, password: _login_password.text);
      showToast("You succesfully login", null);
      push_time_replecement(context, SplashScreen(), 3);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak password') {
        showToast("Your password is too weak", null);
      } else if (e.code == 'wrong-password') {
        showToast("Your password is wrong", null);
      } else if (e.code == 'user-not-found') {
        showToast("Your email is wrong", null);
      } else if (e.code == 'invalid-email') {
        showToast("Your email is invalid", null);
      } else if (e.code == 'invalid-credential') {
        showToast("Your email is invalid", null);
      } else {
        showToast("Check your internet connection or try again", null);
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
