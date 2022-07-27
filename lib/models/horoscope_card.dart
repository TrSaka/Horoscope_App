// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:horoscope_project/models/color/colors.dart';
import 'package:horoscope_project/models/navi_push.dart';

InkWell horoscope_card(
  context,
  page,
  String image,
  String text,
  String subtitle,
  int no,
  Color Dcolor,
  double width,
) {
  return InkWell(
    splashFactory: NoSplash.splashFactory,
    onTap: () {
      push_time(context, page, 0);
    },
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            Container(
              color: Colors.transparent,
              height: 100,
              child: Container(
                width: width,
                child: Image(
                  image: AssetImage("assets/images/" + image),
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              children: [Text(text), Text(subtitle)],
            ),
          ],
        ),
        Divider(
          thickness: 0.3,
          color: Dcolor,
        ),
      ],
    ),
  );
}

InkWell blogCard(
  BuildContext context,
  var Page,
  String title,
  String subtitle,
  int no,
) {
  return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(16),
        ),
        width: MediaQuery.of(context).size.width - 40,
        height: 120,
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              subtitle,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
      onTap: () => Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => Page,
          )));
}

Container devLogo() {
  return Container(
    height: 60,
    width: 150,
    decoration: BoxDecoration(
      color: Csecond,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: Csecond, style: BorderStyle.solid),
    ),
    child: Center(
      child: Text(
        "SakaS Studio",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}

Container card_menu(BuildContext context, String text, String subtitle) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.3,
    height: 100,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.deepPurple),
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: ListTile(
      title: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 20.0),
        child: Text(
          text,
          style:
              TextStyle(fontWeight: FontWeight.w400, color: Colors.deepPurple),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    ),
  );
}
