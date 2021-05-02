import 'package:flutter/material.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 5,
          shadowColor: Colors.black,
        ),
        drawer: Drawer(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: b * 10),
            child: Column(
              children: [
                sh(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cont(Icons.info, 'Tourist Information'),
                    cont(Icons.restaurant, 'Where to Eat?'),
                  ],
                ),
                sh(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cont(Icons.bedtime, 'Where to Sleep?'),
                    cont(Icons.compass_calibration, 'Where to Visit?'),
                  ],
                ),
                sh(20),
                Text(
                  "EVENTS",
                  style: txtS(wc, 24, FontWeight.w800),
                ),
                sh(10),
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: 2,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Column(
                      children: [
                        event(),
                        sh(10),
                      ],
                    );
                  },
                ),
                Text(
                  "ACTIVITIES",
                  style: txtS(wc, 24, FontWeight.w800),
                ),
                sh(20),
                /*GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: b * 20,
                    mainAxisSpacing: h * 20,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: 6,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return activity();
                  },
                ),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    activity(),
                    activity(),
                  ],
                ),
                sh(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    activity(),
                    activity(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle txtS(Color col, double siz, FontWeight wg) {
    return TextStyle(
      color: col,
      fontWeight: wg,
      fontSize: SizeConfig.screenWidth * siz / 400,
    );
  }

  SizedBox sh(double h) {
    return SizedBox(height: SizeConfig.screenHeight * h / 800);
  }

  Widget activity() {
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;

    return InkWell(
      child: Container(
        width: SizeConfig.screenWidth * 0.45,
        height: h * 110,
        padding: EdgeInsets.only(top: h * 20),
        decoration: BoxDecoration(
          color: wc,
          image: DecorationImage(
            image: AssetImage('images/p1.jpg'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(b * 30),
        ),
        child: Column(
          children: [
            Spacer(),
            Container(
              alignment: Alignment.center,
              width: SizeConfig.screenWidth * 0.45,
              height: h * 30,
              decoration: BoxDecoration(
                color: qc,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(b * 30),
                  bottomRight: Radius.circular(b * 30),
                  topLeft: Radius.circular(b * 10),
                  topRight: Radius.circular(b * 10),
                ),
              ),
              child: Text(
                "None",
                style: txtS(Colors.white, 16, FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget event() {
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;

    return Container(
      width: SizeConfig.screenWidth * 0.9,
      height: h * 100,
      decoration: BoxDecoration(
        color: qc,
        borderRadius: BorderRadius.circular(b * 30),
      ),
      child: Row(
        children: [
          SizedBox(width: b * 15),
          Column(
            children: [
              Text(
                "19",
                style: txtS(Colors.white, 55, FontWeight.w800),
              ),
              Text(
                "WED",
                style: txtS(Colors.white, 16, FontWeight.w600),
              ),
            ],
          ),
          SizedBox(width: b * 10),
          Container(
            width: SizeConfig.screenWidth * 0.015,
            height: h * 85,
            decoration: BoxDecoration(
              color: wc,
              borderRadius: BorderRadius.circular(b * 30),
            ),
          ),
          SizedBox(width: b * 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name of the event",
                style: txtS(Colors.white, 18, FontWeight.w800),
              ),
              Text(
                "Location of the event",
                style: txtS(Colors.white, 18, FontWeight.w800),
              ),
              Text(
                "About it event",
                style: txtS(Colors.white, 18, FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget cont(ico, String txt) {
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;

    return InkWell(
      child: Container(
        width: SizeConfig.screenWidth * 0.45,
        height: h * 110,
        padding: EdgeInsets.only(top: h * 20),
        decoration: BoxDecoration(
          color: qc,
          borderRadius: BorderRadius.circular(b * 30),
        ),
        child: Column(
          children: [
            Icon(ico, color: Colors.white, size: b * 45),
            Spacer(),
            Container(
              alignment: Alignment.center,
              width: SizeConfig.screenWidth * 0.45,
              height: h * 30,
              decoration: BoxDecoration(
                color: wc,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(b * 30),
                  bottomRight: Radius.circular(b * 30),
                  topLeft: Radius.circular(b * 10),
                  topRight: Radius.circular(b * 10),
                ),
              ),
              child: Text(
                txt,
                style: txtS(Colors.white, 16, FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
