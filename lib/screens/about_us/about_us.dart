import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/screens/about_us/tabs/team/aim.dart';
import 'package:ecellapp/screens/about_us/tabs/team/team.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ecellapp/widgets/screen_background.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  int _currentIndex = 0;
  final tabs = [AimScreen(), TeamScreen()];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScreenBackground(elementId: 0),
        SafeArea(child: tabs[_currentIndex]),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildBottomNavBar(context),
        ),
      ],
    );
  }

  Widget _buildBottomNavBar(context) {
    double height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      child: Container(
          height: height / 10,
          child: BottomNavigationBar(
            selectedItemColor: Colors.orange[900],
            unselectedFontSize: 50,
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            showSelectedLabels: true,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.adjust_rounded,
                  size: 35,
                ),
                label: "Aim",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  S.assetTeamIcon,
                  height: 25,
                ),
                label: 'Team',
              ),
            ],
          )),
    );
  }
}
