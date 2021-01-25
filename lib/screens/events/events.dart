import 'dart:convert';

import 'package:ecellapp/core/utils/logger.dart';
import 'package:ecellapp/models/events.dart';
import 'package:ecellapp/screens/events/cubit/events_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, Object> json;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<EventsCubit, EventsState>(
        listener: (context, state) {
          if (state is EventsError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is EventsSuccess) {
            json = state.json;
            return _buildSuccess(context);
          } else if (state is EventsLoading) {
            _events();
            return _buildLoading();
          } else {
            Log.e(tag: "ProfileState", message: "State now is ProfileError reached");
            return Container(); // TODO the user should be shown the error on screen instead of a snackbar, and a retry button.
          }
        },
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccess(context) {
    Events event = Events.fromJson(jsonDecode(json[0]));
    //TODO On success UI
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.check_circle_outline),
          Text(
            event.details,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _events() {
    final cubit = context.read<EventsCubit>();
    cubit.events();
  }
}
