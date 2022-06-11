import 'package:aiwebsite/Screens/homescreen.dart';
import 'package:aiwebsite/Screens/mainFunction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ImageColorization());
}

class ImageColorization extends StatefulWidget {
  @override
  State<ImageColorization> createState() => _ImageColorizationState();
}

class _ImageColorizationState extends State<ImageColorization> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: homeScreen.id,
      routes: {
        homeScreen.id: (context) => homeScreen(),
        mainAiFunction.id:(context) => mainAiFunction(),
      },
    );
  }
}
