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
          height: height / 8,
          child: BottomNavigationBar(
            selectedItemColor: Colors.orange[900],
            unselectedFontSize: 40,
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
                activeIcon: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: <Color>[
                        Colors.orange[600],
                        Colors.red[800],
                        Colors.pink[300],
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Image.asset(
                      S.assetAIMIcon,
                      color: Colors.white,
                    ),
                  ),
                ),
                icon: Image.asset(
                  S.assetAIMIcon,
                  height: 25,
                ),
                label: "Aim",
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: <Color>[
                        Colors.orange[600],
                        Colors.red[800],
                        Colors.pink[300],
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Image.asset(
                    S.assetTeamIcon,
                    height: 25,
                    color: Colors.white,
                  ),
                ),
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
