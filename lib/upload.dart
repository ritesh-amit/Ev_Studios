import 'package:ev/videoP.dart';
import 'package:flutter/material.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Upload extends StatefulWidget {
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  TextEditingController description = TextEditingController();
  TextEditingController title = TextEditingController();
  File image1;
  bool getImage1 = false;
  File video1;
  bool getVideo = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Upload Video",
            style: txtS(Colors.black, 20, FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.black,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: b * 15),
            child: Column(
              children: [
                sh(20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: b * 20),
                  width: 400 * b,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(b * 10),
                  ),
                  child: TextField(
                    controller: title,
                    style: txtS(Colors.black, 16, FontWeight.w400),
                    decoration: dec('Enter Video Title'),
                  ),
                ),
                sh(20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: b * 20),
                  width: 400 * b,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(b * 10),
                  ),
                  child: TextField(
                    controller: description,
                    style: txtS(Colors.black, 16, FontWeight.w400),
                    decoration: dec('Enter Video Description'),
                  ),
                ),
                sh(20),
                InkWell(
                  splashColor: Colors.blue,
                  onTap: () {
                    pickImage();
                  },
                  child: getImage1
                      ? Container(
                          height: h * 150,
                          width: b * 400,
                          decoration: BoxDecoration(
                            border: Border.all(color: bc),
                            borderRadius: BorderRadius.circular(b * 5),
                          ),
                          child: Image.file(image1),
                        )
                      : Container(
                          alignment: Alignment.center,
                          height: h * 150,
                          width: b * 400,
                          decoration: BoxDecoration(
                            border: Border.all(color: bc),
                            borderRadius: BorderRadius.circular(b * 5),
                          ),
                          child: Text(
                            "+ Upload Thumbnail",
                            style: txtS(Colors.black, 16, FontWeight.w400),
                          ),
                        ),
                ),
                sh(20),
                InkWell(
                  splashColor: Colors.blue,
                  onTap: () {
                    pickVideo();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: h * 200,
                    width: b * 400,
                    decoration: BoxDecoration(
                      border: Border.all(color: bc),
                      borderRadius: BorderRadius.circular(b * 5),
                    ),
                    child: Text(
                      "+ Upload Video",
                      style: txtS(Colors.black, 16, FontWeight.w400),
                    ),
                  ),
                ),
                sh(80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      splashColor: Colors.white,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => Container(
                            padding: EdgeInsets.symmetric(horizontal: b * 10),
                            margin: EdgeInsets.only(top: h * 25),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(b * 20),
                                topRight: Radius.circular(b * 20),
                              ),
                            ),
                            child: Column(
                              children: [
                                sh(50),
                                Container(
                                  child: VideoPlayerScreen(),
                                ),
                                sh(30),
                                Text(
                                  'Title Title Title Title Title Title Title Title Title ',
                                  textAlign: TextAlign.center,
                                  style:
                                      txtS(Colors.black, 18, FontWeight.w500),
                                ),
                                sh(30),
                                Text(
                                  'Title Title Title Title Title Title Title Title Title ',
                                  textAlign: TextAlign.center,
                                  style:
                                      txtS(Colors.black, 16, FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      color: bc,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(b * 5),
                      ),
                      elevation: 0,
                      minWidth: b * 260,
                      padding: EdgeInsets.symmetric(vertical: h * 12),
                      child: Text(
                        'Upload',
                        style: txtS(Colors.white, 20, FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  pickImage() async {
    var picker = await ImagePicker().getImage(source: ImageSource.gallery);
    File selectedImage = File(picker.path);
    setState(() {
      image1 = selectedImage;
      getImage1 = true;
    });
  }

  pickVideo() async {
    var picker = await ImagePicker().getVideo(source: ImageSource.gallery);
    File selectedVideo = File(picker.path);
    setState(() {
      video1 = selectedVideo;
      getVideo = true;
    });
  }

  SizedBox sh(double h) {
    return SizedBox(height: SizeConfig.screenHeight * h / 800);
  }

  InputDecoration dec(String txt) {
    return InputDecoration(
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      hintText: txt,
      hintStyle: TextStyle(
        color: wc,
        fontSize: SizeConfig.screenWidth * 16 / 400,
        fontWeight: FontWeight.w300,
      ),
      isDense: true,
      contentPadding:
          EdgeInsets.symmetric(vertical: SizeConfig.screenHeight * 15 / 800),
    );
  }

  TextStyle txtS(Color col, double siz, FontWeight wg) {
    return TextStyle(
      color: col,
      fontWeight: wg,
      fontSize: SizeConfig.screenWidth * siz / 400,
    );
  }
}
