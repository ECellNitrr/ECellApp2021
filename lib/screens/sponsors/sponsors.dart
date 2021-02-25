import 'package:ecellapp/models/sponsor_category.dart';
import 'package:ecellapp/widgets/ecell_animation.dart';
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
      onInit: () => _getAllSponsorss(context),
      child: Scaffold(
        body: BlocConsumer<SponsorsCubit, SponsorsState>(listener: (context, state) {
          if (state is SponsorsError) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        }, builder: (context, state) {
          return Stack(
            children: [
              ScreenBackground(elementId: 0),
              if (state is SponsorsInitial)
                _buildLoading(context)
              else if (state is SponsorsSuccess)
                _buildSuccess(context, state.sponsorsList)
              else if (state is SponsorsLoading)
                _buildLoading(context)
              else
                _buildAskReload(),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildSuccess(BuildContext context, List<SponsorCategory> sponsorsList) {
    //TODO: UI
    List<Widget> sL = [];
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
