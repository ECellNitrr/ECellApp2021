import 'package:ecellapp/screens/our_team/cubit/our_team_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OurTeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OurTeamCubit, OurTeamState>(
          builder: (context, state) {
            if (state is OurTeamInitial) {
              return _initial(context);
            } else if (state is OurTeamOC) {
              return _overallCoordinators(context);
            } else if (state is OurTeamHC) {
              return _headCoordinator(context);
            } else if (state is OurTeamManager) {
              return _managers(context);
            } else if (state is OurTeamExecutives) {
              return _executives(context);
            } else {
              return _initial(context);
            }
          },
          listener: (context, state) {}),
    );
  }

  Widget _initial(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [
          Text("Faculty"),
          _bottomNav(context),
        ],
      ),
    );
  }

  Widget _overallCoordinators(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [
          Text("Overall Coordinators"),
          _bottomNav(context),
        ],
      ),
    );
  }

  Widget _headCoordinator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [
          Text("Head Coordinators"),
          _bottomNav(context),
        ],
      ),
    );
  }

  Widget _managers(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [
          Text("Managers"),
          _bottomNav(context),
        ],
      ),
    );
  }

  Widget _executives(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [
          Text("Executives"),
          _bottomNav(context),
        ],
      ),
    );
  }

  Widget _bottomNav(BuildContext context) {
    return Column(
      children: [
        FlatButton(
            onPressed: () {
              _getFaculties(context);
            },
            child: Text("Get Faculties")),
        FlatButton(
            onPressed: () {
              _getOCs(context);
            },
            child: Text("Get OC")),
        FlatButton(
            onPressed: () {
              _getHCs(context);
            },
            child: Text("Get HC")),
        FlatButton(
            onPressed: () {
              _getManagers(context);
            },
            child: Text("Get Managers")),
        FlatButton(
            onPressed: () {
              _getExecutives(context);
            },
            child: Text("Get Executives")),
      ],
    );
  }

  void _getFaculties(BuildContext context) {
    final cubit = context.read<OurTeamCubit>();
    cubit.getFaculties();
  }

  void _getOCs(BuildContext context) {
    final cubit = context.read<OurTeamCubit>();
    cubit.getOverallCoordinators();
  }

  void _getHCs(BuildContext context) {
    final cubit = context.read<OurTeamCubit>();
    cubit.getHeadCoordinators();
  }

  void _getManagers(BuildContext context) {
    final cubit = context.read<OurTeamCubit>();
    cubit.getManagers();
  }

  void _getExecutives(BuildContext context) {
    final cubit = context.read<OurTeamCubit>();
    cubit.getExecutives();
  }
}
