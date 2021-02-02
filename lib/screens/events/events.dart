import 'package:ecellapp/core/utils/logger.dart';
import 'package:ecellapp/models/events.dart';
import 'package:ecellapp/screens/events/cubit/events_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<dynamic> json;

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
            _getAllEvents();
            return _buildLoading();
          } else {
            Log.e(tag: "EventsState", message: "State now is EventsError reached");
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
    Events event = Events.fromJson(json[0]);
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

  void _getAllEvents() {
    final cubit = context.read<EventsCubit>();
    cubit.events();
  }
}
