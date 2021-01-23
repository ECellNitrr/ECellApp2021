import 'package:ecellapp/screens/home/cubit/profile_cubit.dart';
import 'package:ecellapp/screens/home/tabs/profile/profile.dart';
import 'package:ecellapp/screens/home/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: BlocProvider(
        create: (context) => ProfileCubit(APIHomeRepository()),
        child: ProfileScreen(),
      ),
    );
  }
}
