import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/themes/app_theme.dart';
import 'core/utils/injection.dart';
import 'package:ecellapp/screens/events/cubit/events_cubit.dart';
import 'screens/events/events.dart';
import 'package:ecellapp/screens/events/events_repository.dart';

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
        create: (context) => EventsCubit(FakeEventsRepository()),
        child: EventsScreen(),
      ),
    );
  }
}
