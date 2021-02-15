import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/models/speaker.dart';
import 'package:ecellapp/screens/speaker/speakerCard.dart';
import 'package:ecellapp/screens/speaker/cubit/speaker_cubit.dart';
import 'package:ecellapp/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SpeakerScreen extends StatelessWidget {
  const SpeakerScreen({Key key}) : super(key: key);

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

    List<Widget> sL = [];
    speakerList.forEach((element) {
      sL.add(_cardsLoader(element));
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
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
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [C.backgroundTop1, C.backgroundBottom1],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //Heading
                Text(
                  "Speakers",
                  style: TextStyle(
                      fontSize: heightFactor * 50,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.00),
                ),
                Column(
                  children: sL,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardsLoader(Speaker speaker) {
    return InkWell(onTap: () {}, child: SpeakerCard(speaker: speaker));
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
