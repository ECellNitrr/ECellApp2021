import 'package:ecellapp/models/sponsor_category.dart';
import 'package:ecellapp/widgets/ecell_animation.dart';
import 'package:ecellapp/widgets/reload_on_error.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:ecellapp/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/sponsors_cubit.dart';

class SponsorsScreen extends StatelessWidget {
  const SponsorsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () => _getAllSponsors(context),
      child: Scaffold(
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
    //TODO: UI
    List<Widget> sL = [Text("Sponsors")];
    for (var item in sponsorsList) {
      sL.add(Text(item.category, textAlign: TextAlign.center));
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: sL,
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
