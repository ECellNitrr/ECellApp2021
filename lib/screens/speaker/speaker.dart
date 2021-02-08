import 'package:ecellapp/core/utils/logger.dart';
import 'package:ecellapp/models/speaker.dart';
import 'package:ecellapp/screens/speaker/cubit/speaker_cubit.dart';
import 'package:ecellapp/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeakerScreen extends StatefulWidget {
  SpeakerScreen({Key key}) : super(key: key);

  @override
  _SpeakerScreenState createState() => _SpeakerScreenState();
}

class _SpeakerScreenState extends State<SpeakerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SpeakerCubit, SpeakerState>(listener: (context, state) async {
        if (state is SpeakerInitial) {
          Log.d(tag: "listner", message: "executed _getAllSpeaker");
        } else if (state is SpeakerError) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      }, builder: (context, state) {
        if (state is SpeakerInitial) {
          Log.d(tag: "state", message: "Initial");
          //StatefulWrapper Used
          return StatefulWrapper(onInit: _getAllSpeakers, child: _buildInitial());
        } else if (state is SpeakerSuccess) {
          Log.d(tag: "state", message: "Success");
          return _buildSuccess(context, state.speakerList);
        } else if (state is SpeakerLoading) {
          Log.d(tag: "state", message: "Loading");
          return _buildLoading();
        } else {
          Log.e(tag: "SpeakerState:", message: "SpeakerError state");
          return _buildAskReload();
        }
      }),
    );
  }

  Widget _buildInitial() {
    return Container();
  }

  Widget _buildSuccess(BuildContext context, List<Speaker> speakerList) {
    //TODO: UI
    List<Speaker> speaker = speakerList;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(speaker[0].email, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildAskReload() {
    //Ask to reload screen
    //TODO: Implement a Screen to reload
    return Container();
  }

  void _getAllSpeakers() {
    final cubit = context.read<SpeakerCubit>();
    cubit.getSpeakerList();
  }
}
