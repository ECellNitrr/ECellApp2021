import 'package:ecellapp/screens/speaker/cubit/speaker_cubit.dart';
import 'package:ecellapp/screens/speaker/speaker.dart';
import 'package:ecellapp/screens/speaker/speaker_repository.dart';
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
      //TODO: Redirect after token is not null to Home()
      home: BlocProvider(
        create: (context) => SpeakerCubit(FakeSpeakerRepository()),
        child: SpeakerScreen(),
      ),
    );
  }
}
