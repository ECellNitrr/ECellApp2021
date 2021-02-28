import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/models/sponsor_category.dart';
import 'package:ecellapp/screens/sponsors/sponsor_card.dart';
import 'package:ecellapp/widgets/ecell_animation.dart';
import 'package:ecellapp/widgets/reload_on_error.dart';
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
      onInit: () => _getAllSponsors(context),
      child: Scaffold(
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
        body: Stack(
          children: [
            ScreenBackground(elementId: 0),
            BlocBuilder<SponsorsCubit, SponsorsState>(
              builder: (context, state) {
                if (state is SponsorsInitial)
                  return _buildLoading(context);
                else if (state is SponsorsSuccess)
                  return _buildSuccess(context, state.sponsorsList);
                else if (state is SponsorsLoading)
                  return _buildLoading(context);
                else
                  return ReloadOnErrorWidget(() => _getAllSponsors(context));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccess(BuildContext context, List<SponsorCategory> sponsorsList) {
    double top = MediaQuery.of(context).viewPadding.top;
    List<Widget> sL = [];
    sL.add(Column(
      children: [
        SizedBox(height: 20),
        Center(
            child: Text("Sponsors",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                )))
      ],
    ));
    for (var item in sponsorsList) {
      if (item.category.contains('T')) {
        item.spons.forEach((element) {
          sL.add(Expanded(flex: 1, child: SponsorCard(sponsor: element)));
        });
      }
    }

    List<String> tabs = ["Title", "Associates", "Platinum", "Gold", "Partner"];
    List<Widget> tabNames = [SizedBox(height: 150)];

    tabs.forEach((element) {
      tabNames.add(
        Flexible(flex: 1, fit: FlexFit.loose, child: VerticalText(checked: false, name: element)),
      );
    });

    return DefaultTextStyle.merge(
      style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: tabNames,
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
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(child: ECellLogoAnimation(size: width / 2));
  }

  void _getAllSponsors(BuildContext context) {
    final cubit = context.read<SponsorsCubit>();
    cubit.getSponsorsList();
  }
}
