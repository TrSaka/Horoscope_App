// ignore_for_file: prefer_const_constructors prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:horoscope_project/Pages/horoscope_read.dart';
import 'package:horoscope_project/models/horoscope_card.dart';

class HoroscopePage extends StatefulWidget {
  const HoroscopePage({Key? key}) : super(key: key);

  @override
  State<HoroscopePage> createState() => _HoroscopePageState();
}

class _HoroscopePageState extends State<HoroscopePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(" Daily Horoscopes ",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          color: Colors.deepPurple)),
                ], //alperbesyo98@gmail.com
              ),
              SizedBox(
                height: 40,
              ),
              horoscope_card(context, HoroscopeComment(number: 0), "aries.png",
                  "Aries", "(21 March- 20 April)", 1, Colors.deepPurple, 100),
              horoscope_card(context, HoroscopeComment(number: 1), "taurus.png",
                  "Taurus", "(April 21 - May 20)", 2, Colors.deepPurple, 100),
              horoscope_card(context, HoroscopeComment(number: 2), "gemini.png",
                  "Gemini", "(May 21-June 21)", 3, Colors.deepPurple, 110),
              horoscope_card(context, HoroscopeComment(number: 3), "cancer.png",
                  "Cancer ", "(June 22 - July 22)", 4, Colors.deepPurple, 110),
              horoscope_card(context, HoroscopeComment(number: 4), "leo.png",
                  "Leo", "(July 23-August 22)", 5, Colors.deepPurple, 110),
              horoscope_card(
                  context,
                  HoroscopeComment(number: 5),
                  "virgo.png",
                  "Virgo",
                  "(23 August- 22 September)",
                  6,
                  Colors.deepPurple,
                  110),
              horoscope_card(
                  context,
                  HoroscopeComment(number: 6),
                  "libra.png",
                  "Libra",
                  "(September 23- October 23)",
                  7,
                  Colors.deepPurple,
                  110),
              horoscope_card(
                  context,
                  HoroscopeComment(number: 7),
                  "scorpio.png",
                  "Scorpio ",
                  "(October 24 - November 22)",
                  8,
                  Colors.deepPurple,
                  110),
              horoscope_card(
                  context,
                  HoroscopeComment(number: 8),
                  "sagittarius.png",
                  "Sagittarius ",
                  "(November 23- December 21)",
                  9,
                  Colors.deepPurple,
                  110),
              horoscope_card(
                  context,
                  HoroscopeComment(number: 9),
                  "capricorn.png",
                  "Capricorn ",
                  "(December 22 - January 20)",
                  10,
                  Colors.deepPurple,
                  110),
              horoscope_card(
                  context,
                  HoroscopeComment(number: 10),
                  "aquarius.png",
                  "Aquarius  ",
                  "(21 January - 18 February)",
                  11,
                  Colors.deepPurple,
                  120),
              horoscope_card(
                  context,
                  HoroscopeComment(number: 11),
                  "pisces.png",
                  "Pisces",
                  "(February 20 - March 20)",
                  12,
                  Colors.deepPurple,
                  120),
            ],
          ),
        ),
      ),
    );
  }
}
