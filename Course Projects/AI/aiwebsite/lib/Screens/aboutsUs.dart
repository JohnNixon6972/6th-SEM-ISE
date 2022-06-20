import 'package:aiwebsite/main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'dart:typed_data';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:aiwebsite/Screens/outputScreen.dart';
import 'package:aiwebsite/constants.dart';
import "package:hovering/hovering.dart";
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/appBar.dart';

class aboutUs extends StatefulWidget {
  static const String id = 'aboutUs';

  @override
  State<aboutUs> createState() => _aboutUsState();
}

class _aboutUsState extends State<aboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 220, 226),
      appBar: myAppBar(true),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Material(
                  elevation: 30,
                  shadowColor: kColor4,
                  borderRadius: BorderRadius.circular(100),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "images/aboutUs.gif",
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Material(
                  elevation: 30,
                  shadowColor: kColor4,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 500,
                    width: 625,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 70,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(70),
                                    child: Image.asset(
                                      "images/John Nixon.jpg",
                                      height: 140,
                                      width: 140,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const GlowText(
                                  "JOHN NIXON",
                                  style: const TextStyle(
                                      color: kColor4,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                ),
                                const GlowText(
                                  "Developer and Designer",
                                  style: TextStyle(
                                      color: kColor4,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.mail,
                                      size: 35,
                                      color: kColor4,
                                    ),
                                    const GlowText(
                                      " johnbrightnixon@gmail.com",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: kColor4,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.call,
                                      size: 35,
                                      color: kColor4,
                                    ),
                                    const GlowText(
                                      "+91 6363850983",
                                      style: TextStyle(
                                        color: kColor4,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const VerticalDivider(
                              thickness: 3,
                              color: Colors.grey,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 70,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(70),
                                    child: Image.asset(
                                      "images/Hrutuja Patnekar.jpg",
                                      height: 140,
                                      width: 140,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const GlowText(
                                  "HRUTUJA PATNEKAR",
                                  style: TextStyle(
                                      color: kColor4,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                ),
                                const GlowText(
                                  "Developer and Designer",
                                  style: TextStyle(
                                      color: kColor4,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.mail,
                                      size: 35,
                                      color: kColor4,
                                    ),
                                    const GlowText(
                                      " hrutujapatnekar22@gmail.com",
                                      style: TextStyle(
                                        color: kColor4,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.call,
                                      size: 35,
                                      color: kColor4,
                                    ),
                                    const GlowText(
                                      "+91 6361125470",
                                      style: TextStyle(
                                        color: kColor4,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Material(
                  elevation: 30,
                  shadowColor: kColor4,
                  borderRadius: BorderRadius.circular(100),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "images/aboutUs1.gif",
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
