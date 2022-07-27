// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:horoscope_project/Pages/MainMenu.dart';
import 'package:horoscope_project/Pages/firebase-auth/loginPage.dart';
import 'package:horoscope_project/firebase_options.dart';

int isViewed = 0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Horoscope',
      home: isViewed == 0 ? LoginScreen() : const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
