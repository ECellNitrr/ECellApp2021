import 'package:ecellapp/widgets/ecell_animation.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(elementId: 0),
          Center(child: ECellLogoAnimation(size: width / 2)),
        ],
      ),
    );
  }
}
