import 'package:ecellapp/screens/about_us/tabs/aim.dart';
import 'package:ecellapp/screens/about_us/tabs/our_team.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../core/themes/selected_icon_theme.dart';
import 'package:ecellapp/widgets/screen_background.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  int _currentIndex = 0;
  final tabs = [AimScreen(), OurTeam()];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    double heightFactor = height / 1000;
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(elementId: 0),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(width / 16, heightFactor * 50, 0, 0),
                  child: backButton(width, height, bottom, heightFactor),
                ),
                tabs[_currentIndex],
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomNavBar(context),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(context) {
    double height1 = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(height1 / 20)),
      child: Container(
          height: height1 / 10,
          child: BottomNavigationBar(
            selectedItemColor: Colors.orange[900],
            unselectedFontSize: 50,
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            selectedIconTheme: selectedIconTheme(),
            showSelectedLabels: false,
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
                icon: new Icon(
                  Icons.people,
                  size: 35,
                ),
                label: 'Our Team',
              ),
            ],
          )),
    );
  }

  Widget backButton(double width, double height, double bottom, double heightFactor) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
      onPressed: () {
        // to be implemented during screen integration.
      },
    );
  }
}
