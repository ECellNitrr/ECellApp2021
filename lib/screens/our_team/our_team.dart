import 'package:ecellapp/models/member.dart';
import 'package:ecellapp/screens/our_team/cubit/our_team_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecellapp/widgets/stateful_wrapper.dart';

class OurTeamScreen extends StatelessWidget {
  const OurTeamScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () => _getAllSpeakers(context),
      child: Scaffold(
        body: BlocConsumer<OurTeamCubit, OurTeamState>(listener: (context, state) {
          if (state is OurTeamError) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        }, builder: (context, state) {
          if (state is OurTeamInitial) {
            return _buildInitial();
          } else if (state is OurTeamSuccess) {
            return _buildSuccess(context, state.memberList);
          } else if (state is OurTeamLoading) {
            return _buildLoading();
          } else {
            return _buildAskReload();
          }
        }),
      ),
    );
  }

  Widget _buildInitial() {
    return Container();
  }

  Widget _buildSuccess(BuildContext context, List<Member> speakerList) {
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

  void _getAllSpeakers(BuildContext context) {
    final cubit = context.read<OurTeamCubit>();
    cubit.getMemberList();
  }
}
