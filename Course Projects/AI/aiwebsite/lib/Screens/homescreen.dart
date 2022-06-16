import 'dart:typed_data';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:aiwebsite/Screens/outputScreen.dart';
import 'package:aiwebsite/constants.dart';
import 'package:aiwebsite/main.dart';
import "package:hovering/hovering.dart";

// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';

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
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        toolbarHeight: 50,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: <Color>[kColor1, kColor4]),
          ),
        ),
        title: Center(
          child: Text(
            "Image Colorization",
            style: GoogleFonts.cantataOne(
              textStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
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
                    'images/backgroundimage3.webp',
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
                      height: MediaQuery.of(context).size.height,
                      width: (3 * MediaQuery.of(context).size.width) / 4,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              "Let's get started !",
                              style: GoogleFonts.cantataOne(
                                textStyle: TextStyle(
                                  // color: kColor2,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()..shader = linerGradient,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Image Caption Generation:",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: kColor2,
                                fontFamily: 'Roboto-Thin',
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = linerGradient,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 5),
                              child: Text(
                                "Image caption generator is a process of recognizing the context of an image and annotating it with relevant captions using deep learning, and computer vision.",
                                style: GoogleFonts.cantataOne(
                                  textStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()..shader = linerGradient,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Image Colorization:",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: kColor2,
                                fontSize: 22,
                                fontFamily: "Fascinate-Regular",
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = linerGradient,
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
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()..shader = linerGradient,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    animatedImages(
                                      imgUrl: "images/john.jpg",
                                    ),
                                    animatedImages(
                                      imgUrl: "images/john1.jpg",
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    animatedImages(
                                      imgUrl: "images/john2.jpg",
                                    ),
                                    animatedImages(
                                      imgUrl: "images/john3.jpg",
                                    ),
                                  ],
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
                          height: MediaQuery.of(context).size.height - 50,
                          width: (MediaQuery.of(context).size.width) / 4,
                          decoration: BoxDecoration(
                            border: Border.all(color: kColor4),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      startFilePicker();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      alignment: Alignment.center,
                                      primary: kColor2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Upload an Image',
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
                                child: ElevatedButton(
                                  onPressed: () async {
                                    Navigator.pushNamed(
                                        context, outputScreen.id);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.center,
                                    primary: kColor2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Next',
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
  final String imgUrl;
  animatedImages({required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: HoverWidget(
        hoverChild: Material(
          elevation: 5,
          shadowColor: kColor1,
          borderRadius: BorderRadius.circular(15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imgUrl,
              height: 110,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
        ),
        onHover: (event) {},
        child: Material(
          elevation: 15,
          shadowColor: kColor1,
          borderRadius: BorderRadius.circular(15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imgUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
