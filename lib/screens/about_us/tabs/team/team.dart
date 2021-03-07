import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/models/team_category.dart';
import 'package:ecellapp/widgets/ecell_animation.dart';
import 'package:ecellapp/widgets/reload_on_error.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecellapp/widgets/stateful_wrapper.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/team_cubit.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () => _getAllTeamMembers(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: Stack(
          children: [
            ScreenBackground(elementId: 0),
            BlocBuilder<TeamCubit, TeamState>(
              builder: (context, state) {
                if (state is TeamInitial)
                  return _buildLoading();
                else if (state is TeamSuccess)
                  return _buildSuccess(context, state.teamList);
                else if (state is TeamLoading)
                  return _buildLoading();
                else
                  return ReloadOnErrorWidget(() => _getAllTeamMembers(context));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccess(BuildContext context, List<TeamCategory> teamList) {
    double top = MediaQuery.of(context).viewPadding.top;

    // ignore: close_sinks
    BehaviorSubject<int> subject = BehaviorSubject.seeded(0);

    return DefaultTextStyle.merge(
      style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: Container(
          color: Colors.white,
          child: StreamBuilder<int>(
            initialData: 0,
            stream: subject.stream,
            builder: (context, snapshot) {
              int i = snapshot.data;
              return Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: data.map((spon) {
                        String tab = spon.category;
                        return RotatedCurvedTile(
                          checked: tab == data[i].category,
                          name: tab,
                          onTap: () => subject.add(data.indexWhere((e) => e.category == tab)),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(top: top + 56),
                        color: C.sponsorPageBackground,
                        width: double.infinity,
                        child: Column(children: [
                          Text(
                            "Sponsors",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                            ),
                          ),
                          ...data[i].spons.map((e) => {
                                //TODO: TEAM CARD
                              }),
                        ], mainAxisSize: MainAxisSize.max),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(child: ECellLogoAnimation(size: width / 2));
  }

  void _getAllTeamMembers(BuildContext context) {
    final cubit = context.read<TeamCubit>();
    cubit.getAllTeamMembers();
  }
}
