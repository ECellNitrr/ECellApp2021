import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/screens/home/home.dart';
import 'package:ecellapp/screens/login/cubit/login_cubit.dart';
import 'package:ecellapp/screens/login/login.dart';
import 'package:ecellapp/screens/login/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/themes/app_theme.dart';
import 'core/utils/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(ECellApp());
}

class ECellApp extends StatelessWidget {
  final SharedPreferences sharedPreferences = sl.get<SharedPreferences>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    String token = sharedPreferences.getString(S.tokenKeySharedPreferences);
    return MaterialApp(
      title: "ECellApp",
      theme: AppTheme.themeData(context),
      home: token != null
          ? HomeScreen()
          : BlocProvider(
              create: (context) => LoginCubit(APILoginRepository()),
              child: LoginScreen(),
            ),
    );
  }
}
