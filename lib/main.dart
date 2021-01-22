import 'package:ecellapp/screens/home/cubit/profile_cubit.dart';
import 'package:ecellapp/screens/home/tabs/profile/profile.dart';
import 'package:ecellapp/screens/home/tabs/profile/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MaterialApp(
      title: "ECellApp",
      theme: AppTheme.themeData(context),
      home: BlocProvider(
        create: (context) => ProfileCubit(FakeProfileRepository()),
        child: ProfileScreen(),
      ),
    );
  }
}
