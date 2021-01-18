import 'package:ecellapp/screens/login/cubit/login_cubit.dart';
import 'package:ecellapp/screens/login/login.dart';
import 'package:ecellapp/screens/login/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/res/strings.dart';

void main() {
  runApp(ECellApp());
  init();
}

void init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var stored = (sharedPreferences.get(S.auth));
  print("FakeAPIToke ${stored ?? 'NEW Session'}");
}

class ECellApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ECellApp",
      home: BlocProvider(
        create: (context) => LoginCubit(FakeLoginRepository()),
        child: LoginScreen(),
      ),
    );
  }
}
