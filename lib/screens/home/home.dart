import 'package:ecellapp/core/utils/themes/selected_icon_theme.dart';
import 'package:ecellapp/screens/home/tabs/contact_us_screen/contactusScreen.dart';
import 'package:ecellapp/screens/home/tabs/menu_screen/menu_screen.dart';
import 'package:ecellapp/screens/home/tabs/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;
  final List<Widget> _children = [ProfileScreen(), MenuScreen(), ContactUsScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _children[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomNavBar(context),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(context) {
    double height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(height / 20)),
      child: Container(
          height: height / 10,
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onTabTapped,
            selectedIconTheme: selectedIconTheme(),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
              BottomNavigationBarItem(
                icon: new Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.phone_outlined),
                label: 'Contact Us',
              ),
            ],
          )),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
