import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Upload extends StatefulWidget {
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  VideoPlayerController _videoPlayerController;
  bool isUploadPressed = false;

  @override
  void initState() {
    super.initState();
  }

  File image1;
  bool getImage1 = false;
  File video1;
  bool getVideo = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));
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
                    controller: titleController,
                    keyboardType: TextInputType.name,
                    style: txtS(Colors.black, 16, FontWeight.w400),
                    decoration: dec('Video Title'),
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
                    controller: descriptionController,
                    keyboardType: TextInputType.name,
                    style: txtS(Colors.black, 16, FontWeight.w400),
                    decoration: dec('Video Description'),
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
                          child: Image.file(
                            image1,
                            fit: BoxFit.cover,
                          ),
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
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    height: h * 200,
                    width: getVideo
                        ? _videoPlayerController.value.aspectRatio * (h * 200)
                        : b * 400,
                    decoration: BoxDecoration(
                      border: Border.all(color: bc),
                      borderRadius: BorderRadius.circular(b * 5),
                    ),
                    child: getVideo
                        ? VideoPlayer(_videoPlayerController)
                        : Text(
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
                        if (checkFields())
                          uploadToStorage(titleController.text,
                              descriptionController.text, video1, image1);
                      },
                      color: bc,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(b * 5),
                      ),
                      elevation: 0,
                      minWidth: b * 260,
                      padding: EdgeInsets.symmetric(vertical: h * 12),
                      child: isUploadPressed
                          ? CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            )
                          : Text(
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
      getVideoThumbnail();
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

  getVideoThumbnail() {
    _videoPlayerController = VideoPlayerController.file(video1)
      ..initialize().then((_) {
        setState(() {}); //when your thumbnail will show.
      });
  }

  uploadToDB(
      String title, String des, String videoLink, String thumbLink) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("videos").doc().set({
      'title': title,
      'des': des,
      'timestamp': FieldValue.serverTimestamp(),
      'videoLink': videoLink,
      'thumbLink': thumbLink
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Video Uploaded Successfully"),
      backgroundColor: Colors.green,
    ));

    setState(() {
      getImage1 = false;
      getVideo = false;
      titleController.text = "";
      descriptionController.text = "";
      isUploadPressed = false;
      _videoPlayerController.dispose();
    });
  }

  uploadToStorage(
      String title, String des, File videoFile, File thumbnailFile) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    String link = '';
    String thumbLink = "";

    setState(() {
      isUploadPressed = true;
    });

    String dateTime = DateTime.now().microsecondsSinceEpoch.toString();

    await storage
        .ref('videos')
        .child(dateTime)
        .putFile(videoFile)
        .then((task) async {
      link = await storage.ref('videos').child(dateTime).getDownloadURL();
    });

    await storage
        .ref('thumbnails')
        .child(dateTime)
        .putFile(thumbnailFile)
        .then((task) async {
      thumbLink =
          await storage.ref('thumbnails').child(dateTime).getDownloadURL();
    });

    uploadToDB(title, des, link, thumbLink);
  }

  bool checkFields() {
    if (titleController.text == '') {
      showSnackBar("Enter Video Title");
      return false;
    } else if (descriptionController.text == '') {
      showSnackBar("Enter Description");
      return false;
    } else if (!getImage1) {
      showSnackBar("Provide Thumbnail");
      return false;
    } else if (!getVideo) {
      showSnackBar("Provide Video");
      return false;
    }

    return true;
  }

  showSnackBar(String snackMsg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(snackMsg),
      backgroundColor: Colors.red,
    ));
  }
}
