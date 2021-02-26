import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecellapp/core/res/colors.dart';
import 'cubit/feedback_cubit.dart';
import 'cubit/profile_cubit.dart';
import 'home_repository.dart';
import 'tabs/contact_us/contact_us.dart';
import 'tabs/menu/menu.dart';
import 'tabs/profile/profile.dart';
=======

import '../../core/themes/selected_icon_theme.dart';
import 'tabs/contact_us.dart';
import 'tabs/menu.dart';
import 'tabs/profile.dart';
>>>>>>> b768d67d02091965b12f700783228f641611e265

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
      resizeToAvoidBottomInset: false,
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
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  activeIcon: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          C.selectedIconThemeGrad1,
                          C.selectedIconThemeGrad2,
                          C.selectedIconThemeGrad3,
                        ],
                      ),
                    ),
                    constraints: BoxConstraints.tightFor(width: 50, height: 50),
                    child: Icon(
                      Icons.person_outline,
                      color: C.primaryUnHighlightedColor,
                    ),
                  ),
                  icon: Icon(Icons.person_outline),
                  label: 'Profile'),
              BottomNavigationBarItem(
                activeIcon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        C.selectedIconThemeGrad1,
                        C.selectedIconThemeGrad2,
                        C.selectedIconThemeGrad3,
                      ],
                    ),
                  ),
                  constraints: BoxConstraints.tightFor(width: 50, height: 50),
                  child: Icon(
                    Icons.home_outlined,
                    color: C.primaryUnHighlightedColor,
                  ),
                ),
                icon: new Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        C.selectedIconThemeGrad1,
                        C.selectedIconThemeGrad2,
                        C.selectedIconThemeGrad3,
                      ],
                    ),
                  ),
                  constraints: BoxConstraints.tightFor(width: 50, height: 50),
                  child: Icon(
                    Icons.phone_outlined,
                    color: C.primaryUnHighlightedColor,
                  ),
                ),
                icon: new Icon(Icons.phone_outlined),
                label: 'Contact Us',
              ),
            ],
          )),
    );
  }
}
