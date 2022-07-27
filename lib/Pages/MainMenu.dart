// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:horoscope_project/Pages/bnav_pages/blogPage.dart';
import 'package:horoscope_project/Pages/bnav_pages/horoscopePage.dart';
import 'package:horoscope_project/Pages/bnav_pages/menuPage.dart';
import 'package:horoscope_project/Pages/bnav_pages/morePage.dart';
import 'package:horoscope_project/Pages/firebase-auth/loginPage.dart';
import 'package:horoscope_project/models/color/colors.dart';
import 'package:horoscope_project/models/navi_push.dart';
import 'package:horoscope_project/models/showToast.dart';

class MainMenu extends StatefulWidget {
  final int value;
  const MainMenu({Key? key, required this.value}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late int selected_index = widget.value;

  late FirebaseAuth auth;
  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  void onTap(int index) {
    setState(() {
      selected_index = index;
    });
  }

  //alperbesyo98@gmail.com
  List pages = [
    MenuPage(),
    BlogPage(),
    HoroscopePage(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Senna",
          style: TextStyle(
            color: Cthird,
            fontWeight: FontWeight.w300,
            fontSize: 24,
          ),
        ),
        backgroundColor: selected_index == 0
            ? Color.fromARGB(255, 226, 177, 235)
            : Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              LogOut();
            },
            icon: Icon(Icons.exit_to_app_rounded),
            color: Cthird,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 24,
            ),
            label: 'Menu',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_rounded,
              size: 24,
            ),
            backgroundColor: Colors.white,
            label: 'Blogs',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bedtime_outlined,
              size: 24,
            ),
            backgroundColor: Colors.white,
            label: 'Horoscopes',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz_rounded,
              size: 24,
            ),
            backgroundColor: Colors.white,
            label: 'More',
          ),
        ],
        elevation: 0,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white60,
        currentIndex: selected_index,
        onTap: (index) => setState(() => selected_index = index),
      ),
      backgroundColor: Colors.white,
      body: pages[selected_index],
    );
  }

  void LogOut() async {
    await auth.signOut();
    showToast("Succesfully sign out", null);
    push_time_replecement(context, LoginScreen(), 3);
  }
}
