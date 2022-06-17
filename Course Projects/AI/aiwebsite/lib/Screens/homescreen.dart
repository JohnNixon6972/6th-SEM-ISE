import 'dart:typed_data';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:aiwebsite/Screens/outputScreen.dart';
import 'package:aiwebsite/constants.dart';
import 'package:aiwebsite/main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import "package:hovering/hovering.dart";
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_glow/flutter_glow.dart';

late Image? inputedImage = null;

class homeScreen extends StatefulWidget {
  static const String id = 'homeScreen';

  @override
  State<homeScreen> createState() => _homeScreenState();
}

// List<XFile>? imageFileList = [];

Image img = Image.asset('uploadImage.png');

class _homeScreenState extends State<homeScreen> {
  late Uint8List uploadedImage;
  startFilePicker() async {
    inputedImage = await ImagePickerWeb.getImageAsWidget();
    setState(() {});
  }

  final Shader linerGradient = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.topLeft,
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(
    Rect.fromPoints(Offset(0, 500), Offset(1000, 500)),
  );

  @override
  Widget build(BuildContext context) {
    PageController page = PageController();
    List<SideMenuItem> items = [
      SideMenuItem(
        priority: 0,
        title: 'Abouts Us',
        onTap: () {
          Navigator.pushNamed(context, outputScreen.id);
        },
        icon: Icon(Icons.people),
      ),
      SideMenuItem(
        priority: 1,
        title: 'Home',
        onTap: () => {Navigator.pushNamed(context, outputScreen.id)},
        icon: Icon(Icons.home),
      ),
      SideMenuItem(
        priority: 2,
        title: 'Exit',
        onTap: () {
          Navigator.pushNamed(context, outputScreen.id);
        },
        icon: Icon(Icons.exit_to_app),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Center(
        child: SafeArea(
          child: Stack(
            children: [
              Opacity(
                opacity: 1,
                child: Center(
                  child: Image.asset(
                    'images/5238994.jpg',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kColor4),
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
                              textStyle: TextStyle(
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
                          hoverColor: kColor3,
                          selectedColor: kColor1,
                          selectedIconColor: Colors.white,
                          unselectedIconColor: Colors.black54,
                          // backgroundColor: kColor1,
                          selectedTitleTextStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          unselectedTitleTextStyle:
                              TextStyle(color: Colors.purpleAccent),
                          iconSize: 25,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kColor4),
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
                                  textStyle: TextStyle(
                                    // color: kColor2,
                                    color: Colors.indigoAccent,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    // foreground: Paint()..shader = linerGradient,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 100.0),
                              child: Text(
                                "Image Caption Generation:",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: kColor2,
                                    fontFamily: 'Roboto-Thin',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purpleAccent),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 5),
                              child: Text(
                                "Image caption generator is a process of recognizing the context of an image and annotating it with relevant captions using deep learning, and computer vision.",
                                style: GoogleFonts.cantataOne(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurpleAccent),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 100.0),
                              child: Text(
                                "Image Colorization:",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: kColor2,
                                    fontSize: 25,
                                    fontFamily: "Fascinate-Regular",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purpleAccent),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 5),
                              child: Text(
                                "Image colorization is one technique to add style to a photograph or apply a combination of styles. Additionally, image colorization can add color to photographs that were originally taken in black and white.",
                                style: GoogleFonts.cantataOne(
                                  textStyle: TextStyle(
                                    // color: kColor2,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                              ),
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
                                  imgUrl: "images/backgroundimage1.jpg",
                                  context: context,
                                ),
                              ],
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
                            border: Border.all(color: kColor4),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 250,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      startFilePicker();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      alignment: Alignment.center,
                                      primary: Colors.deepPurpleAccent,
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
                                          )
                                        : Image(
                                            image: inputedImage!.image,
                                            fit: BoxFit.cover,
                                          )),
                                height: 3 *
                                    ((MediaQuery.of(context).size.width) / 4) /
                                    4,
                                width: 3 *
                                    ((MediaQuery.of(context).size.width) / 4) /
                                    4,
                                decoration: BoxDecoration(
                                  border: Border.all(color: kColor1),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 150,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      Navigator.pushNamed(
                                          context, outputScreen.id);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      alignment: Alignment.center,
                                      primary: Colors.deepPurpleAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
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
          child: GlowContainer(
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
