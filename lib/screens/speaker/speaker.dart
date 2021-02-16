import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/models/speaker.dart';
import 'package:ecellapp/screens/speaker/cubit/speaker_cubit.dart';
import 'package:ecellapp/screens/speaker/speakerCard.dart';
import 'package:ecellapp/widgets/stateful_wrapper.dart';

class SpeakerScreen extends StatelessWidget {
  SpeakerScreen({Key key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () => _getAllSpeakers(context),
      child: Scaffold(
        body: BlocConsumer<SpeakerCubit, SpeakerState>(listener: (context, state) {
          if (state is SpeakerError) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        }, builder: (context, state) {
          if (state is SpeakerInitial) {
            return _buildInitial();
          } else if (state is SpeakerSuccess) {
            return _buildSuccess(context, state.speakerList);
          } else if (state is SpeakerLoading) {
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

  Widget _buildSuccess(BuildContext context, List<Speaker> speakerList) {
    double height = MediaQuery.of(context).size.height;
    double heightFactor = height / 1000;
    double bottom = MediaQuery.of(context).viewInsets.bottom;

    List<Widget> sL = [];
    speakerList.forEach((element) {
      sL.add(_cardsLoader(element));
    });

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

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [C.backgroundTop1, C.backgroundBottom1],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Container(
            padding: EdgeInsets.only(left: D.horizontalPadding - 10, top: 10),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        body: DefaultTextStyle.merge(
          style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: heightFactor * 100,
                ),
                //Heading
                SizedBox(
                  height: heightFactor * 100,
                  child: Text(
                    "Speakers",
                    style: TextStyle(
                        fontSize: heightFactor * 50,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.00),
                  ),
                ),
                Flexible(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: _scrollController,
                  child: Column(
                    children: sL,
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardsLoader(Speaker speaker) {
    return SpeakerCard(speaker: speaker);
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
    final cubit = context.read<SpeakerCubit>();
    cubit.getSpeakerList();
  }
}
