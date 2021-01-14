import 'package:ecellapp/screens/signup/cubit/signup_cubit.dart';
import 'package:ecellapp/screens/signup/signup.dart';
import 'package:ecellapp/screens/signup/signup_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(ECellApp());
}

class ECellApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ECellApp",
      home: BlocProvider(
        create: (context) => SignupCubit(FakeSignupRepository()),
        child: SignupScreen(),
      ),
    );
  }
}
