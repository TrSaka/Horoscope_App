import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message, ToastGravity? gravity) => Fluttertoast.showToast(
      msg: message,
      fontSize: 20,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: Colors.transparent,
      textColor: const Color.fromARGB(255, 171, 70, 189),
    );

void cancelToast() => Fluttertoast.cancel();

//alperbesyo98@gmail.com