import 'package:flutter/material.dart';
import 'package:horoscope_project/models/Firebase-store/getFireData.dart';
import 'package:horoscope_project/models/fortune_cookie_loader.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'dart:collection';

class FortuneCookiePage extends StatefulWidget {
  const FortuneCookiePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FortuneCookieState();
}

class FortuneCookieState extends State<FortuneCookiePage> {
  @override
  void initState() {
    super.initState();
  }

  bool check = false;
  final _loader = FortuneCookieLoader();

  final _controller = MyFlareControls();

  @override
  void dispose() {
    super.dispose();
    _loader.close();
  }

  @override
  Widget build(context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Fortune Cookie',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.red[200],
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: StreamBuilder(
            stream: _loader.stream,
            initialData: '',
            builder: (context, snapshot) => Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(height: 50),
                  // animated cookie
                  _buildCookie(),
                  // fortune card
                  const SizedBox(
                    height: 100,
                  ),
                  _buildFortune(getFortune()),
                ],
              ),
            ),
          ),
        ),
      );

  _buildCookie() => SizedBox(
        height: MediaQuery.of(context).size.height / 2.5,
        child: GestureDetector(
          onTap: (() {
            _loader.loadFortuneCookie();
            // play cookie animation
            _controller.enqueue('reset');
            _controller.enqueue('break_cookie');
            check = true;
          }),
          child: FlareActor('assets/fortune/fortune_cookie.flr',
              controller: _controller),
        ),
      );

  _buildFortune(data) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 2.5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red[100],
          ),
          child: Visibility(
            visible: check,
            child: Padding(padding: const EdgeInsets.all(16), child: data),
          ),
        ),
      );
}

class MyFlareControls extends FlareControls {
  final Queue<String> _queue = Queue();
  bool animPlaying = false;

  enqueue(anim) {
    if (animPlaying) {
      _queue.add(anim);
    } else {
      play(anim);
    }
  }

  @override
  void onCompleted(String name) {
    animPlaying = false;
    if (_queue.isNotEmpty) {
      play(_queue.removeFirst());
    }
  }

  @override
  void playWs(String name) {
    animPlaying = true;
    super.play(name);
  }
}
