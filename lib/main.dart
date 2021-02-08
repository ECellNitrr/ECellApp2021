<<<<<<< HEAD
import 'package:ecellapp/screens/esummit/esummit.dart';
import 'package:flutter/material.dart';

=======
import 'package:ecellapp/screens/login/cubit/login_cubit.dart';
import 'package:ecellapp/screens/login/login.dart';
import 'package:ecellapp/screens/login/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
>>>>>>> e1180a4529069775b38e88e15c671162dda56ee3
import 'core/themes/app_theme.dart';
import 'core/utils/injection.dart';

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
<<<<<<< HEAD
      home: ESummit(),
=======
      home: BlocProvider(
        create: (context) => LoginCubit(APILoginRepository()),
        child: LoginScreen(),
      ),
>>>>>>> e1180a4529069775b38e88e15c671162dda56ee3
    );
  }
}
