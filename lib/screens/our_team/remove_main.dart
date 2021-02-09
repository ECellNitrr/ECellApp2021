import 'package:ecellapp/screens/our_team/cubit/our_team_cubit.dart';
import 'package:ecellapp/screens/our_team/our_team.dart';
import 'package:ecellapp/screens/our_team/out_team_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => OurTeamCubit(OurTeamRepositoryFake()),
        child: OurTeamScreen(),
      ),
    );
  }
}
