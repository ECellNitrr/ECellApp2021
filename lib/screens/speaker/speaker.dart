import 'package:ecellapp/core/utils/logger.dart';
import 'package:ecellapp/widgets/reload_on_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/models/speaker.dart';
import 'package:ecellapp/screens/speaker/cubit/speaker_cubit.dart';
import 'package:ecellapp/screens/speaker/speaker_card.dart';
import 'package:ecellapp/widgets/stateful_wrapper.dart';

class SpeakerScreen extends StatelessWidget {
  SpeakerScreen({Key key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  _doReaload(BuildContext context) {
    //TODO: Resolve _getAllSpeakers(context); not working
  }

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () => _getAllSpeakers(context),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [C.backgroundTop1, C.backgroundBottom1],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Container(
              padding: EdgeInsets.all(D.horizontalPadding - 10),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          body: BlocConsumer<SpeakerCubit, SpeakerState>(listener: (context, state) {
            if (state is SpeakerError) {
              ReloadOnErrorScreen(doOnPress: () => _doReaload(context));
              Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          }, builder: (context, state) {
            if (state is SpeakerInitial) {
              Log.d(tag: "reloaded", message: "Yos");
              return _buildLoading();
            } else if (state is SpeakerSuccess) {
              return _buildSuccess(context, state.speakerList);
            } else if (state is SpeakerLoading) {
              Log.d(tag: "reloaded", message: "Yos");

              return _buildLoading();
            } else {
              return ReloadOnErrorScreen(doOnPress: () => _doReaload(context));
            }
          }),
        ),
      ),
    );
  }

  Widget _buildSuccess(BuildContext context, List<Speaker> speakerList) {
    double height = MediaQuery.of(context).size.height;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    double top = MediaQuery.of(context).viewPadding.top;
    double ratio = MediaQuery.of(context).size.aspectRatio;

    List<Widget> speakerContentList = [];
    speakerList.forEach((element) => speakerContentList.add(SpeakerCard(speaker: element)));

    if (_scrollController.hasClients) {
      if (bottom > height * 0.25) {
        _scrollController.animateTo(
          bottom - height * 0.25,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      } else {
        _scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.ease);
      }
    }

    return DefaultTextStyle.merge(
      style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          child: Container(
            margin: EdgeInsets.only(top: top + 56),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Speakers",
                  style: TextStyle(
                    fontSize: ratio > 0.5 ? 45 : 50,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Column(children: speakerContentList),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _getAllSpeakers(BuildContext context) {
    final cubit = context.read<SpeakerCubit>();
    cubit.getSpeakerList();
  }
}
