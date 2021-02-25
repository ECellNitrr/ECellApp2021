import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/res/strings.dart';
import 'core/themes/app_theme.dart';
import 'core/utils/injection.dart';
import 'models/global_state.dart';
import 'screens/home/cubit/feedback_cubit.dart';
import 'screens/home/home.dart';
import 'screens/home/home_repository.dart';
import 'screens/login/cubit/login_cubit.dart';
import 'screens/login/login.dart';
import 'screens/login/login_repository.dart';
import 'screens/signup/cubit/signup_cubit.dart';
import 'screens/signup/signup.dart';
import 'screens/signup/signup_repository.dart';
import 'screens/splash/cubit/splash_cubit.dart';
import 'screens/splash/splash.dart';
import 'screens/splash/splash_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(ECellApp());
}

class ECellApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Provider(
      create: (_) => GlobalState(),
      child: MaterialApp(
        routes: {
          S.routeLogin: (_) =>
              BlocProvider(create: (_) => LoginCubit(APILoginRepository()), child: LoginScreen()),
          S.routeSplash: (_) => BlocProvider(
              create: (_) => SplashCubit(APISplashRepository()), child: SplashScreen()),
          S.routeHome: (_) =>
              BlocProvider(create: (_) => FeedbackCubit(APIHomeRepository()), child: HomeScreen()),
          S.routeSignup: (_) =>
              BlocProvider(create: (_) => SignupCubit(APISignupRepository()), child: SignupScreen())
        },
        initialRoute: S.routeSplash,
        title: "ECellApp",
        theme: AppTheme.themeData(context),
      ),
    );
  }
}
