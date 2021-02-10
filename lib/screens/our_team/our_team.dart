import 'package:ecellapp/screens/our_team/cubit/our_team_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OurTeamScreen extends StatefulWidget {
  @override
  _OurTeamScreenState createState() => _OurTeamScreenState();
}

class _OurTeamScreenState extends State<OurTeamScreen> {
  Widget _prevState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OurTeamCubit, OurTeamState>(builder: (context, state) {
        if (state is OurTeamFaculties) {
          _prevState = _initial(context);
          return _initial(context);
        } else if (state is OurFacultiesError) {
          return _prevState;
        } else if (state is OurTeamOC) {
          _prevState = _overallCoordinators(context);
          return _overallCoordinators(context);
        } else if (state is OurOCError) {
          return _prevState;
        } else if (state is OurTeamHC) {
          _prevState = _headCoordinator(context);
          return _headCoordinator(context);
        } else if (state is OurHCError) {
          return _prevState;
        } else if (state is OurTeamManager) {
          _prevState = _managers(context);
          return _managers(context);
        } else if (state is OurManagerError) {
          return _prevState;
        } else if (state is OurTeamExecutives) {
          _prevState = _executives(context);
          return _executives(context);
        } else if (state is OurExecutivesError) {
          return _prevState;
        } else {
          return _initial(context);
        }
      }, listener: (context, state) {
        if (state is OurFacultiesError) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is OurOCError) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is OurHCError) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is OurManagerError) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is OurExecutivesError) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      }),
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
