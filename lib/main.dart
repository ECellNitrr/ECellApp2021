import 'package:ecellapp/screens/signup/signup.dart';
import 'package:ecellapp/screens/signup/signup_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/res/strings.dart';

import 'core/utils/injection.dart';
import 'screens/signup/cubit/signup_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

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
        create: (context) => SignupCubit(APISignupRepository()),
        child: SignupScreen(),
      ),
    );
  }
}
