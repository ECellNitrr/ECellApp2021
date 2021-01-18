import 'package:ecellapp/screens/signup/signup.dart';
import 'package:ecellapp/screens/signup/signup_repository.dart';
import 'package:ecellapp/core/util/log_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart';
import 'screens/signup/cubit/signup_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  Log.i(
    tag: "main()",
    message: "Getit Initialization Done!\nRunning Application...",
  );

  runApp(ECellApp());
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
