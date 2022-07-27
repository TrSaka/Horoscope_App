import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "dart:math";

Random random = Random();
void randomNumber() {
  int rand = random.nextInt(19);
}

class getBlogRead extends StatelessWidget {
  final String zodiacNumber;
  final int categoryNumber;
  getBlogRead(
      {Key? key, required this.zodiacNumber, required this.categoryNumber})
      : super(key: key);

  Map<int, String> values = {
    1: 'health',
    2: 'love',
    3: 'loyality',
    4: 'lucky',
    5: 'money',
  };
  @override
  Widget build(BuildContext context) {
    CollectionReference horoscopes =
        FirebaseFirestore.instance.collection('horoscopes_blog');

    return FutureBuilder<DocumentSnapshot>(
      future: horoscopes.doc(zodiacNumber).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            " ${data[values[categoryNumber]]}",
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 32),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            color: Colors.deepPurple,
            backgroundColor: Colors.white,
          );
        }
        return const CircularProgressIndicator();
      }),
    );
  }
}

class getAnswer extends StatelessWidget {
  final int number;
  getAnswer({
    Key? key,
    required this.number,
  }) : super(key: key);

  Map<int, String> values = {
    0: 'zero',
    1: 'Eleventh',
    2: 'Fifth',
    3: 'First',
    4: 'Fourth',
    5: 'Nineth',
    6: 'Second',
    7: 'Seventh',
    8: 'Sixth',
    9: 'Tenth',
    10: 'Third',
    11: 'Thirteenth',
    12: 'Twelfth',
    13: 'eighteenth',
    14: 'fifteenth',
    15: 'fourteenth',
    16: 'nineteenth',
    17: 'seventeenth',
    18: 'sixteenth',
    19: 'twelfth',
  };
  @override
  Widget build(BuildContext context) {
    CollectionReference horoscopes =
        FirebaseFirestore.instance.collection('magic_list');

    return FutureBuilder<DocumentSnapshot>(
      future: horoscopes.doc('answers').get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            " ${data[values[random.nextInt(19)]]}",
            style: const TextStyle(
                fontWeight: FontWeight.w300, fontSize: 32, color: Colors.white),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            color: Colors.deepPurple,
            backgroundColor: Colors.white,
          );
        }
        return const CircularProgressIndicator();
      }),
    );
  }
}

class getFortune extends StatelessWidget {
  getFortune({
    Key? key,
  }) : super(key: key);

  Map<int, String> values = {
    0: 'zero',
    1: 'one',
    2: 'two',
    3: 'theree',
    4: 'four',
    5: 'five',
    6: 'six',
    7: 'seven',
    8: 'eight',
    9: 'nine',
    10: 'ten',
    11: 'eleven',
    12: 'twelve',
    13: 'thirteen',
    14: 'fourteen',
    15: 'fiveteen',
    16: 'sixteen',
    17: 'seventeen',
    18: 'eighteen',
    19: 'nineteen',
    20: 'twenty',
    21: 'twenty one',
    22: 'twenty two',
    23: 'twenty theree',
    24: 'twenty four',
    25: 'twenty five',
    26: 'twenty six',
    27: 'twenty seven',
    28: 'twenty eight',
    29: 'twenty nine',
    30: 'thirty',
    31: 'thirty one',
    32: 'thirty two',
    33: 'thirty theree',
    34: 'thirty four',
    35: 'thirty five',
    36: 'thirty six',
    37: 'thirty seven',
    38: 'thirty eight',
    39: 'thirty nine',
    40: 'thirty',
  };
  @override
  Widget build(BuildContext context) {
    CollectionReference horoscopes =
        FirebaseFirestore.instance.collection('fortune_cookie');

    return FutureBuilder<DocumentSnapshot>(
      future: horoscopes.doc('word_data').get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            " ${data[values[random.nextInt(40)]]}",
            style: const TextStyle(
                fontWeight: FontWeight.w300, fontSize: 16, color: Colors.black),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Visibility(
            visible: false,
            child: Text("a"),
          );
        } else if (snapshot.connectionState == ConnectionState.none) {
          return const Visibility(
            visible: false,
            child: Text(""),
          );
        }
        return const Visibility(
          visible: true,
          child: Text(""),
        );
      }),
    );
  }
}

class getHoroscope extends StatelessWidget {
  final String documentId;
  const getHoroscope({Key? key, required this.documentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference horoscopes =
        FirebaseFirestore.instance.collection('horoscopes');

    return FutureBuilder<DocumentSnapshot>(
      future: horoscopes.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            " ${data['comment']}",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 32),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            color: Colors.deepPurple,
            backgroundColor: Colors.white,
          );
        }
        return CircularProgressIndicator();
      }),
    );
  }
}

class getHoroscope_name extends StatelessWidget {
  const getHoroscope_name({Key? key, required this.documentId})
      : super(key: key);
  final String documentId;
  @override
  Widget build(BuildContext context) {
    CollectionReference horoscopes =
        FirebaseFirestore.instance.collection('horoscopes');

    return FutureBuilder<DocumentSnapshot>(
      future: horoscopes.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            "${data['horoscope_name']}",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 24),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            color: Colors.deepPurple,
            backgroundColor: Colors.white,
          );
        }
        return CircularProgressIndicator();
      }),
    );
  }
}
