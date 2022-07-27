// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_const

import 'package:flutter/material.dart';
import 'package:horoscope_project/Pages/games/fortune_cookie.dart';
import 'package:horoscope_project/Pages/games/fortune_whell.dart';
import 'package:horoscope_project/Pages/games/magic_ball.dart';
import 'package:horoscope_project/models/navi_push.dart';

class MorePage extends StatefulWidget {
  const MorePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.width / 10),
                InkWell(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: colText("F", "O", "R", "T", "U", "N", "E",
                              true, true, true),
                        ),
                        Image(
                          image: AssetImage("assets/images/whell.png"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 0,
                          ),
                          child: colText("W", "H", "E", "L", "L", "null",
                              "null", true, false, false),
                        ),
                      ],
                    ),
                    height: 175,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Color.fromARGB(230, 233, 136, 10),
                          Colors.orange.shade300,
                          Color.fromARGB(218, 233, 136, 10),
                        ],
                        tileMode: TileMode.mirror,
                      ),
                      border: Border.all(width: 0.5, color: Colors.orange),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onTap: () {
                    animated_push(context, Whellpage(), 1);
                  },
                ),
                SizedBox(height: 15),
                InkWell(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: colText("F", "O", "R", "T", "U", "N", "E",
                              true, true, true),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Image(
                            image:
                                AssetImage("assets/images/fortune_cookie.png"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25,
                            top: 0,
                          ),
                          child: colText("C", "O", "O", "K", "I", "E", "null",
                              true, true, false),
                        ),
                      ],
                    ),
                    height: 175,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Colors.red.shade300,
                          Colors.red.shade200,
                          Colors.red.shade300,
                        ],
                        tileMode: TileMode.mirror,
                      ),
                      border: Border.all(width: 0.5, color: Colors.orange),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onTap: () {
                    animated_push(context, FortuneCookiePage(), 1);
                  },
                ),
                SizedBox(height: 15),
                InkWell(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: colText("M", "A", "G", "I", "C", "null",
                              "null", true, false, false),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: SizedBox(
                            height: 150,
                            child: Image(
                              image: AssetImage("assets/images/magic_ball.png"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25,
                            top: 0,
                          ),
                          child: colText("B", "A", "L", "L", "null", "null",
                              "null", false, false, false),
                        ),
                      ],
                    ),
                    height: 175,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Colors.deepPurple,
                          Colors.deepPurple.shade300,
                          Colors.deepPurple,
                        ],
                        tileMode: TileMode.mirror,
                      ),
                      border: Border.all(width: 0.5, color: Colors.orange),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onTap: () {
                    animated_push(context, MagicBall(), 1);
                  },
                ),
                SizedBox(height: 15),
                Text("by SakaS Studio"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column colText(
    String name1,
    String name2,
    String name3,
    String name4,
    String name5,
    String name6,
    String name7,
    bool vis1,
    bool vis2,
    bool vis3,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name1 == "null" ? "" : name1,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          name2 == "null" ? "" : name2,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          name3 == "null" ? "" : name3,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          name4 == "null" ? "" : name4,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Visibility(
          visible: vis1,
          child: Text(
            name5 == "null" ? "" : name5,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Visibility(
          visible: vis2,
          child: Text(
            name6 == "null" ? "" : name6,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Visibility(
          visible: vis3,
          child: Text(
            name7 == "null" ? "" : name7,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
