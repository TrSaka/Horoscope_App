// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class Whellpage extends StatefulWidget {
  const Whellpage({Key? key}) : super(key: key);

  @override
  State<Whellpage> createState() => _WhellpageState();
}

class _WhellpageState extends State<Whellpage> {
  String text = "Click !";
  StreamController<int> selecteds = StreamController<int>();

  @override
  void dispose() {
    selecteds.close();
    super.dispose();
  }

  final List<String> items = [
    'Perfect',
    'Good',
    'Bad',
    'Lucky',
    'Normal',
    'Relax',
    'Stress',
    'Cool',
    'Unlucky',
    'Boring',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Fortune Whell",
        ),
        backgroundColor: Color.fromARGB(228, 233, 136, 10),
        elevation: 0,
      ),
      body: Container(
        // ignore: sort_child_properties_last
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              " How your day will go ?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.6,
                width: MediaQuery.of(context).size.width / 1.2,
                child: FortuneWheel(
                  animateFirst: false,
                  selected: selecteds.stream,
                  alignment: Alignment.center,
                  indicators: <FortuneIndicator>[
                    FortuneIndicator(
                      alignment: Alignment.bottomCenter,
                      child: TriangleIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ],
                  physics: CircularPanPhysics(
                    duration: Duration(
                      seconds: 5,
                    ),
                    curve: Curves.decelerate,
                  ),
                  items: <FortuneItem>[
                    for (var elements in items)
                      FortuneItem(
                        child: Text(
                          elements,
                          style: TextStyle(fontSize: 28),
                        ),
                        style: sliceStyle(),
                      ),
                  ],
                ),
              ),
              onTap: () {
                setState(
                  () {
                    selecteds.add(
                      Random().nextInt(items.length),
                    );
                    text = "Spinning";
                    Future.delayed(const Duration(seconds: 5), () {
                      setState(() {
                        text = "Your days be like";
                      });
                    });
                  },
                );
              },
            ),
            Icon(
              Icons.arrow_upward_rounded,
              color: Colors.white,
              size: 36,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromARGB(230, 233, 136, 10),
              Color.fromARGB(195, 255, 184, 77),
              Color.fromARGB(232, 233, 136, 10),
            ],
          ),
        ),
      ),
    );
  }

  FortuneItemStyle sliceStyle() {
    return FortuneItemStyle(
      color: Colors.orange.shade300,
    );
  }
}
