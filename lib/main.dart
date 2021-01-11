import 'package:ecellapp/core/util/log_wrapper.dart';
import 'package:ecellapp/injection_container.dart';
import 'package:ecellapp/screens/login/cubit/login_cubit.dart';
import 'package:ecellapp/screens/login/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/res/strings.dart';
import 'screens/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  Log.i(
    tag: "main()",
    message: "Getit Initialization Done!\nRunning Application...",
  );

  runApp(EcellApp2021());
}

class EcellApp2021 extends StatelessWidget {
  final SharedPreferences sharedPreferences = sl.get<SharedPreferences>();

  @override
  Widget build(BuildContext context) {
    String token = sharedPreferences.getString(S.tokenKey);
    return MaterialApp(
      title: "EcellApp2021",
      home: BlocProvider(
        create: (context) => LoginCubit(FakeLoginRepository()),
        child: LoginScreen(),
      ),
    );
  }
}
