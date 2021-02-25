import 'dart:async';

import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/core/utils/injection.dart';
import 'package:ecellapp/screens/home/home.dart';
import 'package:ecellapp/screens/login/cubit/login_cubit.dart';
import 'package:ecellapp/screens/login/login.dart';
import 'package:ecellapp/screens/login/login_repository.dart';
import 'package:ecellapp/screens/speaker/cubit/speaker_cubit.dart';
import 'package:ecellapp/screens/speaker/speaker.dart';
import 'package:ecellapp/screens/speaker/speaker_repository.dart';
import 'package:ecellapp/widgets/ecell_animation.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    await init();
    Timer(Duration(seconds: D.splashDelay), navigationPage);
  }

  void navigationPage() {
    String token = sl.get<SharedPreferences>().getString(S.tokenKey);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => (token == null)
            ? BlocProvider(
                create: (_) => SpeakerCubit(FakeSpeakerRepository()),
                child: SpeakerScreen(),
              )
            : HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(elementId: 0),
          Center(
              child: ECellLogoAnimation(
            size: width / 2,
          )),
        ],
      ),
    );
  }
}
