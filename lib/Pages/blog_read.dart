// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:horoscope_project/models/Firebase-store/getFireData.dart';

class BlogReadPage extends StatefulWidget {
  final int zodiacNumber;
  final int categoryNumber;
  const BlogReadPage(
      {Key? key, required this.zodiacNumber, required this.categoryNumber})
      : super(key: key);

  @override
  State<BlogReadPage> createState() => _BlogReadPageState();
}

class _BlogReadPageState extends State<BlogReadPage> {
  @override
  void initState() {
    getDocs();
    super.initState();
  }

  List horoscopeIds = [];

  Future getDocs() async {
    await FirebaseFirestore.instance.collection('horoscopes_blog').get().then(
          (snapshot) => snapshot.docs
              .forEach((document) => horoscopeIds.add(document.reference.id)),
        );
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
        title: const Text("Horoscope Blog"),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: FutureBuilder(
            future: getDocs(),
            builder: (context, snapshot) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: horoscopeIds.length,
                itemBuilder: ((context, index) {
                  return Center(
                    child: ListTile(
                      title: Center(
                        child: getBlogRead(
                            categoryNumber: widget.categoryNumber,
                            zodiacNumber: horoscopeIds[widget.zodiacNumber]),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
