import 'package:ecellapp/screens/speaker/cubit/speaker_cubit.dart';
import 'package:ecellapp/screens/speaker/speaker.dart';
import 'package:ecellapp/screens/speaker/speaker_repository.dart';
import 'package:ecellapp/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        create: (context) => SpeakerCubit(FakeSpeakerRepository()),
        child: SpeakerScreen(),
      ),
    );
  }
}
