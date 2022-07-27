// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:horoscope_project/Pages/firebase-auth/loginPage.dart';
import 'package:horoscope_project/models/onboardModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late FirebaseAuth auth;
  int current_index = 0;
  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  late PageController _pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemCount: screens.length,
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  current_index = index;
                });
              },
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 3.2,
                        child: SvgPicture.asset(
                          screens[index].img,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            screens[index].text,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                              fontSize: 40,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 50),
                          Text(
                            screens[index].subtitle,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30),
                          InkWell(
                            onTap: () async {
                              if (index == screens.length - 1) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              }

                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.fastOutSlowIn,
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xFF4756DF), width: 1),
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    current_index == 2 ? "Start" : "Next",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0xFF4756DF),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_sharp,
                                    color: Color(0xFF4756DF),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
