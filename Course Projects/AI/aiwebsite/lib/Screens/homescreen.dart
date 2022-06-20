// ignore_for_file: prefer_const_constructors

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

import '../components/appBar.dart';

late Uint8List uploadedImage;
// late Image? inputedImage = null;
late XFile? inputedImage = null;

class homeScreen extends StatefulWidget {
  static const String id = 'homeScreen';

  @override
  State<homeScreen> createState() => _homeScreenState();
}

// List<XFile>? imageFileList = [];

Image img = Image.asset('uploadImage.png');

class _homeScreenState extends State<homeScreen> {
  String url = 'http://127.0.0.1:5000';
  var data;

  startFilePicker() async {
    final ImagePicker _picker = ImagePicker();
    // inputedImage = await ImagePickerWeb.getImageAsWidget();
    inputedImage = await _picker.pickImage(source: ImageSource.gallery);
    // print(ImagePickerWeb.getImageInfo);
    // inputedImage!.image
    print(inputedImage?.path);
    setState(() {});
  }

  final Shader linerGradient = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.topLeft,
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(
    Rect.fromPoints(const Offset(0, 500), const Offset(1000, 500)),
  );

  @override
  Widget build(BuildContext context) {
    PageController page = PageController();
    List<SideMenuItem> items = [
      SideMenuItem(
        priority: 1,
        title: 'Abouts Us',
        onTap: () {
          Navigator.pushNamed(context, aboutUs.id);
        },
        icon: const Icon(Icons.people),
      ),
      SideMenuItem(
        priority: 0,
        title: 'Home',
        onTap: () => {Navigator.pushNamed(context, outputScreen.id)},
        icon: const Icon(Icons.home),
      ),
      SideMenuItem(
        priority: 2,
        title: 'Exit',
        onTap: () {
          Navigator.pushNamed(context, outputScreen.id);
        },
        icon: const Icon(Icons.exit_to_app),
      ),
    ];
    return Scaffold(
      appBar: myAppBar(false),
      body: Center(
        child: SafeArea(
          child: Stack(
            children: [
              Opacity(
                opacity: 1,
                child: Center(
                  child: Image.asset(
                    'images/backgroundImage.jpg',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purpleAccent),
                    ),
                    height: MediaQuery.of(context).size.height - 60,
                    width: (MediaQuery.of(context).size.width) / 5,
                    child: SideMenu(
                      title: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GlowText(
                          "Menu",
                          glowColor: Colors.black,
                          style: GoogleFonts.cantataOne(
                            textStyle: const TextStyle(
                                // color: kColor2,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                // foreground: Paint()..shader = linerGradient,
                                color: Colors.pinkAccent),
                          ),
                        ),
                      ),
                      controller: page,
                      onDisplayModeChanged: (mode) {
                        print(mode);
                      },
                      items: items,
                      style: SideMenuStyle(
                        displayMode: SideMenuDisplayMode.auto,
                        openSideMenuWidth: 200,
                        compactSideMenuWidth: 40,
                        hoverColor: kColor2,
                        selectedColor: kColor1,
                        selectedIconColor: Colors.white,
                        unselectedIconColor: Colors.black54,
                        // backgroundColor: kColor1,
                        selectedTitleTextStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        unselectedTitleTextStyle: const TextStyle(
                            color: kColor4,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        iconSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purpleAccent),
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: (3 * MediaQuery.of(context).size.width) / 5,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: GlowText(
                              "Let's get started !",
                              // glowColor: Colors.black,
                              style: GoogleFonts.cantataOne(
                                textStyle: const TextStyle(
                                  // color: kColor2,
                                  color: Colors.deepPurple,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  // foreground: Paint()..shader = linerGradient,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomPaint(
                                painter: Chevron(),
                                child: Container(
                                  height: 380,
                                  width:
                                      ((3 * MediaQuery.of(context).size.width) /
                                              5) /
                                          2.5,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 30),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GlowText(
                                              "Image Colorization:",
                                              style: TextStyle(
                                                  // decoration:
                                                  // TextDecoration.underline,
                                                  // decorationColor: kColor2,
                                                  fontSize: 28,
                                                  fontFamily:
                                                      "Fascinate-Regular",
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.pinkAccent),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Image colorization is one technique to add style to a photograph or apply a combination of styles. Additionally, image colorization can add color to photographs that were originally taken in black and white.",
                                              style: GoogleFonts.cantataOne(
                                                textStyle: const TextStyle(
                                                  // color: kColor2,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      Colors.deepPurpleAccent,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              CustomPaint(
                                painter: Chevron(),
                                child: Container(
                                  height: 380,
                                  width:
                                      ((3 * MediaQuery.of(context).size.width) /
                                              5) /
                                          2.5,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 30),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GlowText(
                                              "Image Caption Generation:",
                                              style: TextStyle(
                                                  // decoration:
                                                  //     TextDecoration.underline,
                                                  // decorationColor: kColor2,
                                                  fontFamily: 'Roboto-Thin',
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.pinkAccent),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Image caption generator is a process of recognizing the context of an image and annotating it with relevant captions using deep learning, and computer vision.",
                                              style: GoogleFonts.cantataOne(
                                                textStyle: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors
                                                        .deepPurpleAccent),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              animatedImages(
                                imgUrl: "images/backgroundimage2.jpg",
                                context: context,
                              ),
                              animatedImages(
                                imgUrl: "images/john1.jpg",
                                context: context,
                              ),
                              animatedImages(
                                imgUrl: "images/john2.jpg",
                                context: context,
                              ),
                              animatedImages(
                                imgUrl: "images/backgroundimage10.webp",
                                context: context,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 80,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height - 60,
                        width: (MediaQuery.of(context).size.width) / 5,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purpleAccent),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 250,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    startFilePicker();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.center,
                                    primary: kColor4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GlowText(
                                        'Upload an Image',
                                        style: GoogleFonts.cantataOne(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Opacity(
                                  opacity: inputedImage == null ? 0.3 : 1.0,
                                  child: inputedImage == null
                                      ? Image.asset(
                                          'images/uploadImage.png',
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          inputedImage!.path,
                                          fit: BoxFit.cover,
                                        )),
                              height: 3 *
                                  ((MediaQuery.of(context).size.width) / 4) /
                                  4,
                              width: 3 *
                                  ((MediaQuery.of(context).size.width) / 4) /
                                  4,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.purpleAccent),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    sendImage(inputedImage!.path, url);

                                    Navigator.pushNamed(
                                        context, outputScreen.id);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.center,
                                    primary: kColor4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GlowText(
                                        'View Results',
                                        style: GoogleFonts.cantataOne(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}

class animatedImages extends StatelessWidget {
  late final String imgUrl;
  late final BuildContext context;
  animatedImages({required this.imgUrl, required this.context});
//  double imageHeight =  3 *((MediaQuery.of(context).size.width) / 4) /  4,
//   double imageWidth = 3 *((MediaQuery.of(context).size.width) / 4) /  4,

  @override
  Widget build(BuildContext context) {
    double imageSize = (3 * ((MediaQuery.of(context).size.width) / 5)) / 5;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: HoverWidget(
        hoverChild: Material(
          elevation: 10,
          shadowColor: Colors.purpleAccent,
          borderRadius: BorderRadius.circular(15),
          child: GlowContainer(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imgUrl,
                height: imageSize + 10,
                width: imageSize + 10,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        onHover: (event) {},
        child: Material(
          elevation: 15,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pinkAccent, width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imgUrl,
                height: imageSize,
                width: imageSize,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Chevron extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [kColor1, kColor4],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = new Paint()
      ..shader = gradient.createShader(colorBounds);

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2, size.height - size.height / 3);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
