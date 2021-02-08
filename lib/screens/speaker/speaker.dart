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
      body: BlocConsumer<SpeakerCubit, SpeakerState>(listener: (context, state) {
        //Unexecuted listner
        if (state is SpeakerInitial) {
        } else if (state is SpeakerError) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      }, builder: (context, state) {
        if (state is SpeakerInitial) {
          //StatefulWrapper Used
          return StatefulWrapper(onInit: _getAllSpeakers, child: _buildInitial());
        } else if (state is SpeakerSuccess) {
          return _buildSuccess(context, state.speakerList);
        } else if (state is SpeakerLoading) {
          return _buildLoading();
        } else {
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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(speakerList.toString(), textAlign: TextAlign.center),
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
