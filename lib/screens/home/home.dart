import 'package:flutter/material.dart';
import 'package:ecellapp/screens/home/tabs/contactusScreen/contactusScreen.dart';
import 'package:ecellapp/screens/home/tabs/menuScreen/menuScreen.dart';
import 'package:ecellapp/screens/home/tabs/profileScreen/profileScreen.dart';
import 'package:ecellapp/screens/home/widgets/selectedIconTheme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;
  final List<Widget> _children = [ProfileScreen(), MenuScreen(), ContactusScreen()];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _children[_currentIndex],
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildBottomNavBar(height),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(height) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
      child: Container(
          height: height / 10,
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: onTabTapped,
            selectedIconTheme: selectedIconTheme(), //TODO :Add Theme in the file under widgets
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

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
