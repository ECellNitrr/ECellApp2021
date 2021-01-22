import 'package:ecellapp/screens/login/login.dart';
import 'package:ecellapp/screens/login/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/res/strings.dart';
import 'core/utils/injection.dart';
import 'screens/login/cubit/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(ECellApp());
}

class ECellApp extends StatelessWidget {
  final SharedPreferences sharedPreferences = sl.get<SharedPreferences>();
  @override
  Widget build(BuildContext context) {
    String token = sl.get<SharedPreferences>().getString(S.tokenKey);
    return MaterialApp(
      title: "ECellApp",
      // ignore: todo
      //TODO: Redirect after token is not null to Home()
      home: BlocProvider(
        create: (context) => LoginCubit(APILoginRepository()),
        child: LoginScreen(),
      ),
    );
  }
}
