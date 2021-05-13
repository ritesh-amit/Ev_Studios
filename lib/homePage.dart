import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev/upload.dart';
import 'package:ev/videoModel.dart';
import 'package:flutter/material.dart';
import 'Utils/SizeConfig.dart';
import 'videoP.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<VideoModel> dataList = [];
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    getVideoData();
  }

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
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
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
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Film Space",
            style: txtS(Colors.white, 20, FontWeight.w700),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.black,
        ),
        body: PageView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            if (dataList.isEmpty)
              return Center(
                child: Text("No Video Available"),
              );
            else
              return InkWell(
                onTap: () {
                  showBottomSheet(dataList[index].title, dataList[index].des,
                      dataList[index].videoLink, dataList[index].thumbnail);
                },
                child: Container(
                  height: SizeConfig.screenHeight - (h * 10),
                  width: SizeConfig.screenWidth,
                  child: Stack(alignment: Alignment.center, children: [
                    VideoPlayerScreen(
                        dataList[index].videoLink, dataList[index].thumbnail),
                    Positioned(
                      bottom: SizeConfig.screenHeight * 0.015,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: SizeConfig.screenWidth,
                            padding: EdgeInsets.symmetric(horizontal: b * 15),
                            child: Text(
                              dataList[index].title,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: b * 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              );
          },
          itemCount: dataList.length, // Can be null
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

  showBottomSheet(
      String title, String des, String videoLink, String thumbLink) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Color(0xff313131),
      builder: (context) => Container(
        margin: EdgeInsets.only(top: h * 40),
        decoration: BoxDecoration(
          color: Color(0xff313131),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(b * 20),
            topRight: Radius.circular(b * 20),
          ),
        ),
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          color: Color(0xff313131),
          child: Stack(alignment: Alignment.center, children: [
            VideoPlayerScreen(videoLink, thumbLink),
            Positioned(
              bottom: SizeConfig.screenHeight * 0.02,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: SizeConfig.screenWidth,
                    padding: EdgeInsets.symmetric(horizontal: b * 15),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: txtS(Colors.white, 18, FontWeight.w500),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: SizeConfig.screenWidth,
                    padding: EdgeInsets.symmetric(horizontal: b * 15),
                    child: Text(
                      des,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: b * 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  getVideoData() async {
    FirebaseFirestore.instance.collection('videos').snapshots().listen((snap) {
      for (var i in snap.docs) {
        VideoModel tempModel = VideoModel(
            i.data()['title'],
            i.data()['des'],
            i.data()['videoLink'],
            i.data()['thumbLink'],
            i.data()['timestamp']);

        dataList.add(tempModel);
      }

      setState(() {});
    });
  }
}
