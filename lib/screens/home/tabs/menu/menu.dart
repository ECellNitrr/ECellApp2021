import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/core/utils/injection.dart';
import 'package:ecellapp/screens/esummit/esummit.dart';
import 'package:ecellapp/screens/login/cubit/login_cubit.dart';
import 'package:ecellapp/screens/login/login.dart';
import 'package:ecellapp/screens/login/login_repository.dart';
import 'package:ecellapp/widgets/eCellAnimation.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double heightFactor = height / 1000;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          padding: EdgeInsets.only(left: D.horizontalPadding - 10, top: 10),
          child: IconButton(
            icon: Icon(Icons.power_settings_new_rounded, color: Colors.white, size: 40),
            onPressed: () => _logout(context),
          ),
        ),
      ),
      body: Stack(
        children: [
          ScreenBackground(elementId: 0),
          Center(
            child: Container(
              padding: EdgeInsets.only(bottom: heightFactor * 350),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [C.eSummitButton1, C.eSummitButton2],
                      ),
                    ),
                    constraints: BoxConstraints.tightFor(width: 60, height: 60),
                    child: GestureDetector(
                      child: Image.asset(
                        S.assetEsummitLogoWhiteFilled,
                        width: 30,
                        height: 30,
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ESummitScreen(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "E-Summit",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: C.primaryUnHighlightedColor),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(bottom: heightFactor * 75, right: width / 1.4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [C.bQuizButton1, C.bQuizButton2],
                      ),
                    ),
                    constraints: BoxConstraints.tightFor(width: 60, height: 60),
                    child: GestureDetector(
                      child:
                          Icon(Icons.search_rounded, size: 30, color: C.primaryUnHighlightedColor),
                      onTap: () {}, //TODO
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "BQuiz",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: C.primaryUnHighlightedColor),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(bottom: heightFactor * 75, left: width / 1.4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [C.eventsButton1, C.eventsButton2],
                      ),
                    ),
                    constraints: BoxConstraints.tightFor(width: 60, height: 60),
                    child: GestureDetector(
                      child: Image.asset(
                        S.assetEventsLogoWhite,
                        width: 30,
                        height: 30,
                      ),
                      onTap: () {}, //TODO
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Events",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: C.primaryUnHighlightedColor),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: heightFactor * 300, left: width / 2.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [C.sponsorsButton1, C.sponsorsButton2],
                      ),
                    ),
                    constraints: BoxConstraints.tightFor(width: 60, height: 60),
                    child: GestureDetector(
                      child: Image.asset(
                        S.assetSponsorsLogoWhite,
                        width: 30,
                        height: 30,
                      ),
                      onTap: () {}, //TODO
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Sponsors",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: C.primaryUnHighlightedColor),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: heightFactor * 300, right: width / 2.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [C.aboutUsButton1, C.aboutUsButton2],
                      ),
                    ),
                    constraints: BoxConstraints.tightFor(width: 60, height: 60),
                    child: GestureDetector(
                      child: Icon(Icons.group, size: 30, color: C.primaryUnHighlightedColor),
                      onTap: () {}, //TODO
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "About Us",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: C.primaryUnHighlightedColor),
                  )
                ],
              ),
            ),
          ),
          Center(
              child: Container(
            child: ECellLogoAnimation(),
          )),
        ],
      ),
    );
  }
}

Future<void> _logout(BuildContext context) async {
  await sl.get<SharedPreferences>().remove(S.tokenKeySharedPreferences);
  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Logged Out Successfuly")));
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) => LoginCubit(APILoginRepository()),
        child: LoginScreen(),
      ),
    ),
  );
}
