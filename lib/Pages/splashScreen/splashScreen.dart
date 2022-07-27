// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:horoscope_project/Pages/MainMenu.dart';
import 'package:horoscope_project/models/horoscope_card.dart';
import 'package:lottie/lottie.dart';
import '../../models/color/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FutureBuilder(
      future: Future.delayed(
        const Duration(seconds: 2),
        () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (c, a1, a2) => MainMenu(
                value: 0,
              ),
              transitionsBuilder: (c, anim, a2, child) =>
                  FadeTransition(opacity: anim, child: child),
              transitionDuration: Duration(milliseconds: 1000),
            ),
          );
        },
      ),
      builder: (BuildContext context, AsyncSnapshot<Null> snapshot) {
        return Container();
      },
    );
  }

  final pages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Csecond,
                ),
                borderRadius: BorderRadius.circular(250),
              ),
              width: 150,
              child: LottieBuilder.asset(
                "assets/jsons/horoscope_splash.json",
                animate: true,
                reverse: true,
                alignment: Alignment.center,
                height: 150,
                width: 150,
              ),
            ),
          ),
          Text(
            "Welcome to Senna Horoscope",
            style: TextStyle(
                fontFamily: 'Macondo-Regular.ttf',
                color: Csecond,
                fontSize: 22,
                fontWeight: FontWeight.w300),
          ),
          devLogo(),
        ],
      ),
    );
  }
}
