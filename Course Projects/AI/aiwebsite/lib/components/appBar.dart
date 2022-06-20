import 'dart:typed_data';
import 'dart:io';
import 'package:aiwebsite/Screens/aboutsUs.dart';
import 'package:aiwebsite/components/function.dart';
import 'package:image_picker/image_picker.dart';
import 'package:aiwebsite/Screens/outputScreen.dart';
import 'package:aiwebsite/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import "package:hovering/hovering.dart";
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_glow/flutter_glow.dart';

AppBar myAppBar(bool isArrowVisible) {
  // final bool isArrowVisible;
  return AppBar(
    automaticallyImplyLeading: isArrowVisible,
    elevation: 15,
    toolbarHeight: 60,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: <Color>[kColor1, kColor4]),
      ),
    ),
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(width: 20.0, height: 100.0),
        const GlowText(
          'Image',
          style: TextStyle(fontSize: 43.0),
        ),
        const SizedBox(width: 20.0, height: 100.0),
        DefaultTextStyle(
          style: const TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'Horizon',
              color: Colors.pinkAccent),
          child: AnimatedTextKit(
            animatedTexts: [
              RotateAnimatedText('CAPTIONING'),
              RotateAnimatedText('COLOURIZER'),
            ],
            totalRepeatCount: 9999,
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      ],
    ),
  );
}
