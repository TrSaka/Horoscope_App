// ignore_for_file: file_names

import 'package:flutter/material.dart';

class onBoardPages {
  String img;
  String text;
  String subtitle;

  onBoardPages({
    required this.img,
    required this.text,
    required this.subtitle,
  });
}

List<onBoardPages> screens = [
  onBoardPages(
    img: "assets/svg/blog.svg",
    text: "Personal Horoscope Interpretation",
    subtitle:
        "Senna offers you daily special comments based on your natal chart. With Senna, you get comments that fit the flow of your life.",
  ),
  onBoardPages(
    img: "assets/svg/test.svg",
    text: "Questions You Curious",
    subtitle:
        "With Senna, you can learn the answers to the questions you wonder about your loved ones. You can see the love compatibility with your partner. You can discover whether the relationship will be long-term or not.",
  ),
  onBoardPages(
    img: "assets/svg/team.svg",
    text: "Astrology Themed Content",
    subtitle:
        "Astrology-themed content awaits you, from tests to relationships, from sky movements to fashion.",
  )
];
