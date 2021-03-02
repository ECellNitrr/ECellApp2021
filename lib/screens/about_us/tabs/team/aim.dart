import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';

class AimScreen extends StatelessWidget {
  const AimScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            ScreenBackground(elementId: 0),
            Container(),
          ],
        ),
      ),
    );
  }
}
