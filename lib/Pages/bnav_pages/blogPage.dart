// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:horoscope_project/Pages/blog_read.dart';
import 'package:horoscope_project/models/horoscope_card.dart';
import 'package:horoscope_project/models/horoscope_list.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.deepPurple,
          labelColor: Colors.deepPurple,
          indicatorColor: Colors.deepPurple,
          isScrollable: true,
          tabs: <Tab>[
            Tab(text: 'Health'),
            Tab(text: 'Love'),
            Tab(text: 'Loyality'),
            Tab(text: 'Lucky'),
            Tab(text: 'Money'),
          ],
          physics: BouncingScrollPhysics(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: BouncingScrollPhysics(),
        children: [
          tabBody("Click for learn", "zodiac traites related health."),
          tabBody("Click for learn", "zodiac traits related Love."),
          tabBody("Click for learn", "zodiac traits related Loyality."),
          tabBody("Click for learn", "zodiac traits related Lucky."),
          tabBody("Click for learn", "zodiac traites related Money."),
        ],
      ),
    );
  }

  Column tabBody(
    String subtitle1,
    String subtitle2,
  ) {
    return Column(
      children: [
        SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 12,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  SizedBox(height: 5),
                  blogCard(
                    context,
                    BlogReadPage(
                      zodiacNumber: index,
                      categoryNumber: _tabController.index + 1,
                    ),
                    horoscope_names[index],
                    '$subtitle1 ${horoscope_names[index]} $subtitle2',
                    index,
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
