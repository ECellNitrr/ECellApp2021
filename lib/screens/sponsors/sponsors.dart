import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/models/sponsor_category.dart';
import 'package:ecellapp/screens/sponsors/sponsor_card.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:ecellapp/widgets/stateful_wrapper.dart';
import 'package:ecellapp/widgets/vertical_text.dart';
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
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Container(
            padding: EdgeInsets.only(left: D.horizontalPadding - 10, top: 0),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
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

    //TODO: UI
    List<Widget> sL = [];
    sL.add(Center(
      child: Text(
        "Sponsors",
        style: TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
    ));
    for (var item in sponsorsList) {
      if (item.category.contains('T')) {
        item.spons.forEach((element) {
          sL.add(Expanded(flex: 1, child: SponsorCard(sponsor: element)));
        });
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          padding: EdgeInsets.only(left: 10),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 30),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(flex: 2, child: Container()),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: VerticalText(
                      checked: false,
                      name: "Title",
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: VerticalText(
                      checked: false,
                      name: "Associate",
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: VerticalText(
                      checked: false,
                      name: "Platinum",
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: VerticalText(
                      checked: false,
                      name: "Gold",
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: VerticalText(
                      checked: false,
                      name: "Partner",
                    ),
                  ),
                  Expanded(flex: 2, child: Container()),
                ],
              ),
            ),
            Expanded(
                flex: 9,
                child: Container(
                  child: Column(
                    children: sL,
                    mainAxisSize: MainAxisSize.max,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40), topLeft: Radius.circular(40))),
                ))
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
