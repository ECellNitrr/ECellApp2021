import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/widgets/gradient_text.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';

class BQuiz extends StatelessWidget {
  const BQuiz({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          padding: EdgeInsets.only(left: D.horizontalPadding - 10, top: 10),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Stack(children: [
        ScreenBackground(elementId: 0),
        Column(
          children: [
            GradientText("BUSINESS",
                gradient: LinearGradient(
                  colors: [
                    //TODO:
                  ],
                )),
            GradientText("QUIZ",
                gradient: LinearGradient(
                  colors: [
                    //TODO:
                  ],
                )),
            Text("Quicker Answers,More Points"),
            //TODO: START BUTTON
            Text("Leaderboard")
          ],
        ),
      ]),
    );
  }
}
