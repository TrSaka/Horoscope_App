// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:horoscope_project/models/Firebase-store/getFireData.dart';

class MagicBall extends StatefulWidget {
  const MagicBall({Key? key}) : super(key: key);

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int value = 0;
  Timer? timer;
  Timer? timer1;
  Timer? timer2;
  Timer? timer3;
  double seconds = 0;
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.white60,
        elevation: 0,
        child: Icon(
          Icons.close,
          color: Colors.red,
          size: 38,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.pink,
              Color.fromARGB(218, 97, 11, 119),
              Color.fromARGB(234, 97, 11, 119),
              Color.fromARGB(255, 136, 14, 105),
            ],
            end: Alignment.centerRight,
            begin: Alignment.centerLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 75),
            InkWell(
              child: Container(
                height: 270,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade600,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      "Put your finger on circle for a 3 second",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "then magic ball will your answer...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 45),
                    GestureDetector(
                      child: Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.pink, width: 1.5),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            "$number",
                            style: TextStyle(color: Colors.pink, fontSize: 36),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onLongPress: () {
                        timer = Timer.periodic(
                          const Duration(milliseconds: 10),
                          (timer) {
                            setState(
                              () {
                                if (seconds == 1 || number == 3) {
                                  seconds = 30;
                                } else {
                                  seconds = seconds + 0.01;
                                }
                              },
                            );
                          },
                        );
                        timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
                          setState(() {
                            if (seconds == 1 || number == 3) {
                              number = 3;
                            } else {
                              number = number + 1;
                            }
                          });
                        });
                      },
                      onLongPressStart: (details) {
                        setState(() {
                          value = 0;
                        });
                      },
                      onLongPressEnd: (details) {
                        timer?.cancel();
                        timer1?.cancel();
                        setState(() {
                          value = 1;
                          seconds = 0;
                          number = 0;
                        });
                      },
                    ),
                    SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.purple,
                        color: Colors.pink,
                        value: seconds / 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 75),
            Visibility(
              visible: value == 1 ? true : false,
              child: getAnswer(
                number: number,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
