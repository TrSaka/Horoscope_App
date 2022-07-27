// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horoscope_project/Pages/MainMenu.dart';
import 'package:horoscope_project/Pages/games/fortune_cookie.dart';
import 'package:horoscope_project/Pages/games/fortune_whell.dart';
import 'package:horoscope_project/Pages/games/magic_ball.dart';
import 'package:horoscope_project/Pages/horoscope_read.dart';
import 'package:horoscope_project/models/navi_push.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Column(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    child: SvgPicture.asset("assets/svg/mainmenu.svg"),
                    height: 220,
                    color: Color.fromARGB(255, 226, 177, 235),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Contents',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                      TextButton(
                        onPressed: () {
                          animated_push(context, MainMenu(value: 3), 1);
                        },
                        child: Text(
                          "More",
                          style: TextStyle(
                              color: Colors.orange.shade300,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 20),
                      contentCard(
                          "assets/images/aries.png",
                          125,
                          "Aries",
                          "Daily Horoscope Comment",
                          HoroscopeComment(number: 1)),
                      SizedBox(width: 10),
                      contentCard("assets/images/fortune_cookie.png", 125,
                          "Cookie", "Fortune Cookie", FortuneCookiePage()),
                      SizedBox(width: 10),
                      contentCard("assets/images/magic_ball.png", 125,
                          "Magic Ball", "Fortune Telling", MagicBall()),
                      SizedBox(width: 10),
                      contentCard("assets/images/whell.png", 150,
                          "Fortune Whell", "Fortune Whell !", Whellpage()),
                      SizedBox(width: 20),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  InkWell contentCard(
    String image_path,
    double width,
    String title,
    String subtitle,
    var page,
  ) {
    return InkWell(
      child: Container(
        height: 300,
        width: 150,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.pink.shade100.withOpacity(0.5),

            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(20), color: Colors.white24),
        child: Column(
          children: [
            SizedBox(height: 30),
            SizedBox(
              width: width,
              child: Image(
                image: AssetImage(image_path),
              ),
            ),
            Text(title),
            Spacer(),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      onTap: () {
        animated_push(context, page, 1);
      },
    );
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
