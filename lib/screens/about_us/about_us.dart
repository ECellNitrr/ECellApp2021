import 'package:ecellapp/screens/about_us/tabs/aim.dart';
import 'package:ecellapp/screens/about_us/tabs/our_team.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/themes/selected_icon_theme.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  int _currentIndex = 0;
  final tabs = [Aim(), OurTeam()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(context) {
    double height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(height / 20)),
      child: Container(
          height: height / 10,
          child: BottomNavigationBar(
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
                icon: Icon(Icons.adjust_rounded),
                label: "Aim",
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.people),
                label: 'Our Team',
              ),
            ],
          )),
    );
  }
}
