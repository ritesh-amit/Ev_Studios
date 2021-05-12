import 'package:ev/upload.dart';
import 'package:flutter/material.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'videoP.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_a_photo, color: Colors.white),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return Upload();
                },
              ),
            );
          },
        ),
        /* appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Enjoy Videos",
            style: txtS(Colors.blue, 20, FontWeight.w700),
          ),
          backgroundColor: Colors.white,
          elevation: 3,
          shadowColor: Colors.black,
        ),*/
        body:
            /*SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            sh(10),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 25,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
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
                                height: h * 350,
                                width: SizeConfig.screenWidth,
                                child: VideoPlayerScreen(),
                              ),
                              sh(30),
                              Text(
                                'Title Title Title Title Title Title Title Title Title ',
                                textAlign: TextAlign.center,
                                style: txtS(Colors.black, 18, FontWeight.w500),
                              ),
                              sh(30),
                              Text(
                                'Title Title Title Title Title Title Title Title Title ',
                                textAlign: TextAlign.center,
                                style: txtS(Colors.black, 16, FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: SizeConfig.screenHeight - (h * 10),
                      width: SizeConfig.screenWidth,
                      child: Stack(alignment: Alignment.topCenter, children: [
                        VideoPlayerScreen(),
                        Positioned(
                          bottom: SizeConfig.screenHeight * 0.04,
                          child: Column(
                            children: [
                              Container(
                                width: SizeConfig.screenWidth,
                                padding:
                                    EdgeInsets.symmetric(horizontal: b * 10),
                                child: Text(
                                  'Title Title Title Title Title Title Title Title Title ',
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      txtS(Colors.black, 18, FontWeight.w500),
                                ),
                              ),
                              sh(10),
                              Container(
                                width: SizeConfig.screenWidth,
                                padding:
                                    EdgeInsets.symmetric(horizontal: b * 10),
                                child: Text(
                                  'Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title ',
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      txtS(Colors.black, 16, FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  );
                }),
          ]),
        ),*/
            PageView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
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
                          height: h * 350,
                          width: SizeConfig.screenWidth,
                          child: VideoPlayerScreen(),
                        ),
                        sh(30),
                        Text(
                          'Title Title Title Title Title Title Title Title Title ',
                          textAlign: TextAlign.center,
                          style: txtS(Colors.black, 18, FontWeight.w500),
                        ),
                        sh(30),
                        Text(
                          'Title Title Title Title Title Title Title Title Title ',
                          textAlign: TextAlign.center,
                          style: txtS(Colors.black, 16, FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                height: SizeConfig.screenHeight - (h * 10),
                width: SizeConfig.screenWidth,
                child: Stack(alignment: Alignment.topCenter, children: [
                  VideoPlayerScreen(),
                  Positioned(
                    bottom: SizeConfig.screenHeight * 0.04,
                    child: Column(
                      children: [
                        Container(
                          width: SizeConfig.screenWidth,
                          padding: EdgeInsets.symmetric(horizontal: b * 10),
                          child: Text(
                            'Title Title Title Title Title Title Title Title Title ',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: txtS(Colors.black, 18, FontWeight.w500),
                          ),
                        ),
                        sh(10),
                        Container(
                          width: SizeConfig.screenWidth,
                          padding: EdgeInsets.symmetric(horizontal: b * 10),
                          child: Text(
                            'Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title ',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: txtS(Colors.black, 16, FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            );
          },
          itemCount: 25, // Can be null
        ),
      ),
    );
  }

  SizedBox sh(double h) {
    return SizedBox(height: SizeConfig.screenHeight * h / 800);
  }

  TextStyle txtS(Color col, double siz, FontWeight wg) {
    return TextStyle(
      color: col,
      fontWeight: wg,
      fontSize: SizeConfig.screenWidth * siz / 400,
    );
  }
}
