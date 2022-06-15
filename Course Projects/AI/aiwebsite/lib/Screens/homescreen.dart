import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'dart:typed_data';

import 'package:aiwebsite/Screens/outputScreen.dart';
import 'package:aiwebsite/constants.dart';
import 'package:aiwebsite/main.dart';

// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';

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
    FileUploadInputElement uploadInput = FileUploadInputElement();
    uploadInput.click();
    uploadInput.onChange.listen((e) {
      // read file content as dataURL
      final files = uploadInput.files;
      if (files!.length == 1) {
        final file = files[0];
        FileReader reader = FileReader();
        reader.onLoadEnd.listen((e) {
          setState(() {
            uploadedImage = reader.result as Uint8List;
            img = uploadedImage as Image;
          });
        });
        reader.onError.listen((fileEvent) {
          setState(() {
            var option1Text = "Some Error occured while reading the file";
            img = uploadedImage as Image;
          });
        });

        setState(() {
          var _base64 = "/9j/4AAQSkZJRg...";
          uploadedImage = base64Decode(_base64);
          img = Image.memory(uploadedImage);
        });
      }
    });
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
                            style: GoogleFonts.cantataOne(
                              textStyle: TextStyle(
                                // color: kColor2,
                                fontFamily: 'Roboto-Thin',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = linerGradient,
                              ),
                            ),
                          ),
                          Text(
                            "Image caption generator is a process of \nrecognizing the context of an image and \nannotating it with relevant captions using \ndeep learning, and computer vision.",
                            style: GoogleFonts.cantataOne(
                              textStyle: TextStyle(
                                // color: kColor2,

                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = linerGradient,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Image Colorization:",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                // color: kColor2,

                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = linerGradient,
                              ),
                            ),
                          ),
                          Text(
                            "Image colorization is one technique to add\nstyle to a photograph or apply a\ncombination of styles. Additionally, image\ncolorization can add color to photographs\nthat were originally taken in black and\nwhite.",
                            style: GoogleFonts.cantataOne(
                              textStyle: TextStyle(
                                // color: kColor2,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = linerGradient,
                              ),
                            ),
                          ),
                        ],
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
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Opacity(
                                      opacity: 0.3,
                                      child: Image.asset(
                                        'images/uploadImage.png',
                                      )),
                                  height: 3 *
                                      ((MediaQuery.of(context).size.width) /
                                          4) /
                                      4,
                                  width: 3 *
                                      ((MediaQuery.of(context).size.width) /
                                          4) /
                                      4,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: kColor1),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    Navigator.pushNamed(
                                        context, outputScreen.id);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: kColor2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    'Next',
                                    style: GoogleFonts.cantataOne(
                                      textStyle: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ]),
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
