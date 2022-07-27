// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:horoscope_project/models/Firebase-store/getFireData.dart';

class HoroscopeComment extends StatefulWidget {
  final int number;
  const HoroscopeComment({Key? key, required this.number}) : super(key: key);

  @override
  State<HoroscopeComment> createState() => _HoroscopeCommentState();
}

class _HoroscopeCommentState extends State<HoroscopeComment> {
  List<String> horoscopeIds = [];

  Future getDocs() async {
    await FirebaseFirestore.instance.collection('horoscopes').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              horoscopeIds.add(document.reference.id);
            },
          ),
        );
  }

  @override
  void initState() {
    getDocs();
    super.initState();
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
        title: Text("Daily Horoscope"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  width: 150,
                  color: Colors.white,
                  child: FutureBuilder(
                    future: getDocs(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: horoscopeIds.length,
                        itemBuilder: ((context, index) {
                          return Center(
                            child: ListTile(
                              title: Center(
                                child: getHoroscope_name(
                                    documentId: horoscopeIds[widget.number]),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: FutureBuilder(
                  future: getDocs(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: horoscopeIds.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          title: getHoroscope(
                              documentId: horoscopeIds[widget.number]),
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
