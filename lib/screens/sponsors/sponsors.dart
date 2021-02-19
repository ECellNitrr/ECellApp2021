import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/models/sponsor_category.dart';
import 'package:ecellapp/screens/sponsors/sponsor_card.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:ecellapp/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/sponsors_cubit.dart';

class SponsorsScreen extends StatelessWidget {
  const SponsorsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () => _getAllSponsorss(context),
      child: Scaffold(
        body: BlocConsumer<SponsorsCubit, SponsorsState>(listener: (context, state) {
          if (state is SponsorsError) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        }, builder: (context, state) {
          if (state is SponsorsInitial) {
            return _buildInitial();
          } else if (state is SponsorsSuccess) {
            return _buildSuccess(context, state.sponsorsList);
          } else if (state is SponsorsLoading) {
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

  Widget _buildSuccess(BuildContext context, List<SponsorCategory> sponsorsList) {
    double height = MediaQuery.of(context).size.height;
    double heightFactor = height / 1000;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    final ScrollController _scrollController = ScrollController();

    //TODO: UI
    List<Widget> sL = [];
    for (var item in sponsorsList) {
      sL.add(SponsorCard(sponsor: item));
    }

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

    return Scaffold(
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
        child: Stack(
          children: [
            Container(
              width: 70,
              color: Colors.white,
            ),
            ScreenBackground(elementId: 0),
            Center(
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
          ],
        ),
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

  void _getAllSponsorss(BuildContext context) {
    final cubit = context.read<SponsorsCubit>();
    cubit.getSponsorsList();
  }
}
