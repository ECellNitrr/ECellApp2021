import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/widgets/eCellAnimation.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double top = MediaQuery.of(context).viewPadding.top;
    double heightFactor = height / 1000;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          padding: EdgeInsets.only(left: D.horizontalPadding - 10, top: 10),
          child: IconButton(
            icon: Icon(Icons.menu_rounded, color: Colors.white, size: 40),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Stack(
        children: [
          ScreenBackground(elementId: 0),
          Center(
            child: Container(
              padding: EdgeInsets.only(bottom: heightFactor * 300),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: RaisedButton(
                      onPressed: () {},
                      shape: CircleBorder(),
                      child: Image.asset(
                        S.assetEsummitLogoWhite,
                        width: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "E-Summit",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: C.primaryUnHighlightedColor),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(bottom: heightFactor * 75, right: width / 1.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: RaisedButton(
                      onPressed: () {},
                      shape: CircleBorder(),
                      child:
                          Icon(Icons.search_rounded, size: 30, color: C.primaryUnHighlightedColor),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "BQuiz",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: C.primaryUnHighlightedColor),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(bottom: heightFactor * 75, left: width / 1.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: RaisedButton(
                      onPressed: () {},
                      shape: CircleBorder(),
                      child: Icon(Icons.search_rounded), //TODO
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Events",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: C.primaryUnHighlightedColor),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: heightFactor * 250, left: width / 2.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: RaisedButton(
                      onPressed: () {},
                      shape: CircleBorder(),
                      child: Icon(Icons.search_rounded), // TODO
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Sponsors",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: C.primaryUnHighlightedColor),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: heightFactor * 250, right: width / 2.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: RaisedButton(
                      onPressed: () {},
                      shape: CircleBorder(),
                      child: Icon(Icons.group, size: 30, color: C.primaryUnHighlightedColor),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "About Us",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: C.primaryUnHighlightedColor),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: ECellLogoAnimation(),
          ),
        ],
      ),
    );
  }
}
