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
        if (state is SpeakerSuccess) {
          await Future.delayed(Duration(seconds: 1));
        } else if (state is SpeakerError) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      }, builder: (context, state) {
        if (state is SpeakerSuccess) {
          speakerResponse = state.json;
          return _buildSuccess(context);
        } else if (state is SpeakerLoading) {
          _speaker();
          return _buildLoading();
        } else {
          Log.e(tag: "SpeakerState:", message: "SpeakerError state");
          return _buildAskReload();
        }
      }),
    );
  }

  Widget _buildSuccess(BuildContext context) {
    Speaker speaker = speakerResponse[];
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Speaker: ${speaker.name}",
            textAlign: TextAlign.center,
          ),
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

  void _speaker() {
    final cubit = context.read<SpeakerCubit>();
    cubit.getSpeakerList();
  }
}
