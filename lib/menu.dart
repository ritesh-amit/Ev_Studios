import 'package:ev/homePage.dart';
import 'package:flutter/material.dart';
import 'Utils/constants.dart';
import 'Utils/SizeConfig.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

int _currentIndex = 0;

List<Widget> _widgetOptions = <Widget>[
  MyHomePage(),
  MyHomePage(),
  MyHomePage(),
  MyHomePage(),
  MyHomePage(),
  MyHomePage(),
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 400;
    var h = SizeConfig.screenHeight / 800;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(top: h * 5, bottom: h * 5),
          child: BottomAppBar(
            elevation: 0,
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  child: Container(
                    height: h * 50,
                    width: b * 50,
                    decoration: BoxDecoration(
                      color: wc,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.car_rental,
                      color: Colors.white,
                    ),
                  ),
                  onTap: _currentIndex == 0
                      ? null
                      : () => setState(() => _currentIndex = 0),
                ),
                InkWell(
                  child: Container(
                    height: h * 50,
                    width: b * 50,
                    decoration: BoxDecoration(
                      color: wc,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.money,
                      color: Colors.white,
                    ),
                  ),
                  onTap: _currentIndex == 1
                      ? null
                      : () => setState(() => _currentIndex = 1),
                ),
                InkWell(
                  child: Container(
                    height: h * 50,
                    width: b * 50,
                    decoration: BoxDecoration(
                      color: wc,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  onTap: _currentIndex == 2
                      ? null
                      : () => setState(() => _currentIndex = 2),
                ),
                InkWell(
                  child: Container(
                    height: h * 50,
                    width: b * 50,
                    decoration: BoxDecoration(
                      color: wc,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                  ),
                  onTap: _currentIndex == 3
                      ? null
                      : () => setState(() => _currentIndex = 3),
                ),
                InkWell(
                  child: Container(
                    height: h * 50,
                    width: b * 50,
                    decoration: BoxDecoration(
                      color: wc,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.map,
                      color: Colors.white,
                    ),
                  ),
                  onTap: _currentIndex == 4
                      ? null
                      : () => setState(() => _currentIndex = 4),
                ),
              ],
            ),
          ),
        ),
        body: _widgetOptions.elementAt(_currentIndex),
      ),
    );
  }
}
