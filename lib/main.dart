import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'core/themes/app_theme.dart';
import 'core/utils/injection.dart';
import 'screens/login/cubit/login_cubit.dart';
import 'screens/login/login.dart';
import 'screens/login/login_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(ECellApp());
}

class ECellApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: "ECellApp",
      theme: AppTheme.themeData(context),
      home: BlocProvider(
        create: (context) => LoginCubit(APILoginRepository()),
        child: LoginScreen(),
      ),
    );
  }
}
