import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/widgets/gradient_text.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';

class BQuiz extends StatelessWidget {
  const BQuiz({Key key}) : super(key: key);
  //#ffc158 - #dd19ad - #5f00ff - #145fff - #00c3ff
  //0%-25%-50%-75%-100%  => centers
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    double heightFactor = height / 1000;
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
        ScreenBackground(elementId: 2),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientText("BUSINESS",
                  gradient: LinearGradient(
                    colors: [
                      //TODO:
                      C.bQuizGradient1,
                      C.bQuizGradient2,
                      C.bQuizGradient3,
                      C.bQuizGradient4,
                      C.bQuizGradient5,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
              GradientText("QUIZ",
                  gradient: LinearGradient(
                    colors: [
                      //TODO:
                      C.bQuizGradient1,
                      C.bQuizGradient2,
                      C.bQuizGradient3,
                      C.bQuizGradient4,
                      C.bQuizGradient5,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
              Text(
                "Quicker Answers, More Points",
                style: TextStyle(color: C.secondaryColor, fontSize: 20),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(right: D.horizontalPadding),
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        //TODO:
                        C.bQuizGradient1,
                        C.bQuizGradient2,
                        C.bQuizGradient3,
                        C.bQuizGradient4,
                        C.bQuizGradient5,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: C.authButtonColor.withOpacity(0.2),
                    //     blurRadius: 10,
                    //     spreadRadius: 3,
                    //     offset: Offset(0, 12),
                    //   )
                    // ],
                  ),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    color: Colors.transparent,
                    onPressed: () => {
                      //TODO: remove brackets and add func
                    },
                    child: Container(
                      height: 30,
                      width: 120,
                      alignment: Alignment.center,
                      child: Text(
                        "START",
                        style: TextStyle(
                            letterSpacing: 0.75,
                            color: C.primaryUnHighlightedColor,
                            fontSize: 30 * heightFactor),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: heightFactor * 320, top: heightFactor * 20),
                child: Text(
                  "Leaderboard",
                  style: TextStyle(color: C.primaryUnHighlightedColor, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
