import 'package:ecellapp/screens/home/cubit/feedback_cubit.dart';
import 'package:ecellapp/screens/home/cubit/profile_cubit.dart';
import 'package:ecellapp/screens/home/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/themes/selected_icon_theme.dart';
import 'tabs/contact_us.dart';
import 'tabs/menu.dart';
import 'tabs/profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    BlocProvider(
      create: (_) => ProfileCubit(APIHomeRepository()),
      child: ProfileScreen(),
    ),
    MenuScreen(),
    BlocProvider(
      create: (_) => FeedbackCubit(APIHomeRepository()),
      child: ContactUsScreen(),
    )
  ];
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
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
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
}
