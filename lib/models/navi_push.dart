// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void push_time(var context, var page, int seconds) {
  Timer(
    Duration(seconds: seconds),
    () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));
    },
  );
}

void push_time_replecement(var context, var page, int? seconds) {
  Timer(
    Duration(seconds: seconds ?? 0),
    () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => page));
    },
  );
}

Future animated_push(context, var page, int second) {
  return Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (c, a1, a2) => page,
      transitionsBuilder: (c, anim, a2, child) =>
          FadeTransition(opacity: anim, child: child),
      transitionDuration: Duration(seconds: second),
    ),
  );
}
