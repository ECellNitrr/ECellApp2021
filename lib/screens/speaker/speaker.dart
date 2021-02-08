import 'package:ecellapp/core/utils/logger.dart';
import 'package:ecellapp/models/speaker.dart';
import 'package:ecellapp/screens/speaker/cubit/speaker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeakerScreen extends StatefulWidget {
  SpeakerScreen({Key key}) : super(key: key);

  @override
  _SpeakerScreenState createState() => _SpeakerScreenState();
}

class _SpeakerScreenState extends State<SpeakerScreen> {
  List<Speaker> speakerResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SpeakerCubit, SpeakerState>(listener: (context, state) async {
        if (state is SpeakerInitial) {
          //await Future.delayed(Duration(seconds: 1));
          Log.d(tag: "listner", message: "executed _getAllSpeaker");
          _getAllSpeakers();
        } else if (state is SpeakerError) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      }, builder: (context, state) {
        if (state is SpeakerInitial) {
          Log.d(tag: "state", message: "Initial");
          return _buildInitial();
        } else if (state is SpeakerSuccess) {
          Log.d(tag: "state", message: "Success");
          return _buildSuccess(context, state.speakerList);
        } else if (state is SpeakerLoading) {
          Log.d(tag: "state", message: "Loading");
          return _buildLoading();
        } else {
          Log.d(tag: "state", message: "ElseAllOther");
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
    Log.d(tag: "Response", message: speakerList[0].name);
    //TODO: UI
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(speakerList[0].name, textAlign: TextAlign.center),
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
