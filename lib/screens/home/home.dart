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
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only({
        Radius topLeft = 60,
        Radius topRight = 60,
        Radius bottomLeft = Radius.zero,
        Radius bottomRight = Radius.zero,
      }),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
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
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
