import 'dart:async';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/core/utils/injection.dart';
import 'package:ecellapp/screens/home/home.dart';
import 'package:ecellapp/screens/login/cubit/login_cubit.dart';
import 'package:ecellapp/screens/login/login.dart';
import 'package:ecellapp/screens/login/login_repository.dart';
import 'package:ecellapp/widgets/eCellAnimation.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 3;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    final SharedPreferences sharedPreferences = sl.get<SharedPreferences>();
    String token = sharedPreferences.getString(S.tokenKey);

    if (token == null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => BlocProvider(
                    create: (_) => LoginCubit(APILoginRepository()),
                    child: LoginScreen(),
                  )));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ScreenBackground(elementId: 0),
        Center(
          child: ECellLogoAnimation(),
        )
      ],
    ));
  }
}
