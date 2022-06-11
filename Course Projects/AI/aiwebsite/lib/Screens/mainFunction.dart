// ignore_for_file: prefer_const_constructors

import 'dart:html';
import 'dart:io';
import 'dart:typed_data';

import 'package:aiwebsite/Screens/homescreen.dart';
import 'package:aiwebsite/constants.dart';
import 'package:aiwebsite/main.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';

class mainAiFunction extends StatefulWidget {
  static const String id = 'mainAiFunction';

  @override
  State<mainAiFunction> createState() => _mainAiFunctionState();
}

class _mainAiFunctionState extends State<mainAiFunction> {
  final Shader linerGradient = const LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(
    Rect.fromPoints(Offset(0, 500), Offset(1000, 500)),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        toolbarHeight: 50,
        title: Center(
          child: Text(
            "Image Colorization",
            style: GoogleFonts.cantataOne(
              textStyle: TextStyle(
                  color: kColor2, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: kColor3,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Opacity(
              opacity: 1,
              child: Center(
                child: Image.asset(
                  'images/backgroundimage3.webp',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Results",
                    style: GoogleFonts.cantataOne(
                      textStyle: TextStyle(
                        // color: kColor2,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = linerGradient,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Orginal Image",
                              style: GoogleFonts.cantataOne(
                                textStyle: TextStyle(
                                  // color: kColor2,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()..shader = linerGradient,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: ((MediaQuery.of(context).size.width)) / 3,
                            width: ((MediaQuery.of(context).size.width)) / 3,
                            decoration: BoxDecoration(
                              border: Border.all(color: kColor1),
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: kColor2,
                        size: 90,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Coloured Image",
                              style: GoogleFonts.cantataOne(
                                textStyle: TextStyle(
                                  // color: kColor2,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()..shader = linerGradient,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: ((MediaQuery.of(context).size.width)) / 3,
                            width: ((MediaQuery.of(context).size.width)) / 3,
                            decoration: BoxDecoration(
                              border: Border.all(color: kColor1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kColor1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Generated Caption : ",
                        style: GoogleFonts.cantataOne(
                          textStyle: TextStyle(
                            // color: kColor2,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = linerGradient,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pushNamed(context, homeScreen.id);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kColor2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Refresh',
                      style: GoogleFonts.cantataOne(
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
