import 'package:ecellapp/screens/login/cubit/login_cubit.dart';
import 'package:ecellapp/screens/login/login.dart';
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
        create: (context) => LoginCubit(),
        child: LoginScreen(),
      ),
    );
  }
}
